create database swiggy;
use swiggy;
select * from restaurants;
# new column containing avg rating of function through dataset

select * , round(avg(rating) over(),2) as 'avg column' from restaurants;
# SELECT VERSION();

# new column containing avg rating count of retaurants throught dataset
select * , avg(rating_count) over() as 'count' from restaurants; 

# # new column containing avg cost of retaurants throught dataset
select * , avg(cost) over() as 'avg_cost' from restaurants;

# new column containing avg min , max of cost ,rating , rating_count of restaurants throughout the data set 
select * ,avg(rating ) over() as 'rating_avg' 
, max(rating) over() as 'maximum'
,min(rating) over() as 'minimum'
from restaurants;
# similarly we can do for rating_count and cost

# new column containing avg cost of city where that specific restaurant is from 
select * , round(avg(cost) over(partition by city )) as 'avg' from restaurants;

# column containing avg cost of cuisine where that specific restaurant is serving 
# same as above , hust partition by cuisine 

# restaurants whose cost is more than avg cost of restaurants
select * , name from restaurants
where cost>( select avg(cost) from restaurants);

# rank 
# rank every restaurant from expensive to least expensive 
select *, rank() over(order by cost) from restaurants;
# rank every restaurant from most visited to least visited
select *, rank() over(order by rating_count desc) as 'rank' from restaurants;
#rank every restaurant from most to least expensive as per city
select *, rank() over(partition by city order by cost) from restaurants;
#dense rank
select *, dense_rank() over(partition by city order by cost) from restaurants;
#rank every restaurant from expensive to least expensive as per their city along with its city(adilabad-1,adilabad-2)
select *,concat(city,row_number() over(partition by city order by cost desc )) as 'rank' from restaurants;

# views 
 # creating view
 create view rest as (
		select name ,city,rating from restaurants);
select * from rest;
#create view for sweet dishes 
create view view_user as(
select * from restaurants where cuisine='Sweets');
select * from view_user;

#saving tables 
#create new table name 'sirsa_restaurants containing restaurants of sirsa only
drop table if exists sirsa_restaurants;
create table if not exists sirsa_restaurants as select * from restaurants where city ='sirsa';
select * from sirsa_restaurants;
# temporary table
#creating temporary table
create temporary table temp_restaurants as select * from restaurants ;
select * from temp_restaurants;

# dataset creation (ignore)
DROP TABLE IF EXISTS messy_indian_dataset;
CREATE TABLE IF NOT EXISTS messy_indian_dataset (
    id INT,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(50),
    purchase_amount DECIMAL(10, 2),
    purchase_date DATE
);

-- Insert messy data into the table for Indian users
INSERT INTO messy_indian_dataset (id, name, age, gender, email, phone_number, city, state, purchase_amount, purchase_date) VALUES
(1, 'Rajesh Patel', 30, 'Male', 'rajesh@example.com', '9876543210', 'Mumbai', 'Maharashtra', 1000.50, '2023-01-05'),
(2, 'Priya Sharma', 25, 'Female', 'priya@example.com', '9876543211', 'Delhi', 'Delhi', NULL, '2023-02-15'),
(3, 'Amit Kumar', 35, 'Male', 'amit@example.com', '9876543212', 'Bangalore', 'Karnataka', 750.25, '2023-03-25'),
(4, 'Ritu Singh', 28, 'Female', NULL, '9876543213', 'Kolkata', 'West Bengal', 1200.75, '2023-04-10'),
(5, 'Rajesh Patel', 30, 'Male', 'rajesh@example.com', '9876543210', 'Mumbai', 'Maharashtra', 1000.50, '2023-01-05'),
(6, 'Priya Sharma', 25, 'Female', 'priya@example.com', '9876543211', 'Delhi', 'Delhi', 800.00, '2023-02-15'),
(7, 'Amit Kumar', NULL, 'Male', 'amit@example.com', NULL, 'Bangalore', 'Karnataka', 750.25, '2023-03-25'),
(8, 'Ritu Singh', 28, 'Female', 'ritu@example.com', '9876543213', 'Kolkata', 'West Bengal', 1200.75, '2023-04-10'),
(9, 'Ankit Tiwari', 32, 'Male', 'ankit@example.com', '9876543214', 'Lucknow', 'Uttar Pradesh', 900.00, '2023-05-20'),
(10, 'Swati Gupta', 27, 'Female', 'swati@example.com', '9876543215', 'Jaipur', 'Rajasthan', 1500.00, NULL);


# functions and procedures , plsql,sql,core sql
select * from messy_indian_dataset;
#function to calculate the age 
drop function if exists CalculateAge;
delimiter //
create function CalculateAge(birthdate DATE ) returns int 
deterministic
begin
	declare age int;
	set age=year(curdate())-year(birthdate);
    return age;
end; //
delimiter ;
select CalculateAge('1990-05-15') as age;

#procedures
#creating first procedure
drop procedure if exists GetUserByID;
delimiter //
	create procedure GetUserByID(in userID int)
		begin
			select * from messy_indian_dataset where id=userID;
		end //
delimiter ;
call GetUserByID(1);

# Transactions
select * from messy_indian_dataset;
# start  a transaction
start transaction ;
update messy_indian_dataset set purchase_amount =1500 where id=1;
select * from messy_indian_dataset;
# tarnsaction with rollback 
start transaction ;
update messy_indian_dataset set purchase_amount =1200 where id=1;
select * from messy_indian_dataset;
rollback;
select * from messy_indian_dataset;
#transactions with commit 
start transaction ;
update messy_indian_dataset set purchase_amount =1200 where id=1;
select * from messy_indian_dataset;
commit;
select * from messy_indian_dataset;
#commit & rollback
start transaction ;
insert into messy_indian_dataset (id, name, age, gender, email, phone_number, city, state, purchase_amount, purchase_date) VALUES
(11, 'Aryan Patel', 30, 'Male', 'rajesh@example.com', '9876543210', 'Mumbai', 'Maharashtra', 1000.50, '2023-01-05');
select * from messy_indian_dataset where id=11;
select * from messy_indian_dataset;
commit;
rollback;
# here rollback wont work after commiting 
select * from messy_indian_dataset;

# exception handling

#syntax error
select * form restaurants;
#logical error
select * from restaurants where rating>4.0 and rating<2.0;
#data type exception
select * from restaurants where rating>'high';
#performance exception (query works slow becz of size of dataset)
select * from restaurants where rating=4.5;
#Aggregate functions errors 
select city, count(*) from restaurants;
#to fix above 
select city, count(*) from restaurants group by city;
#subquery exception
#constraint errors
#fun errors


#exception handling 

#if table doesn't exists exception handling 
delimiter //
drop procedure if exists handle_non_existant_table;
create procedure handle_non_existant_table()
	begin
		declare continue handler for sqlexception
			begin 
				select ' table not exist' as message ;
			end;
		select * from handle_non_existant_table;
	end//
delimiter ;
call handle_non_existant_table();