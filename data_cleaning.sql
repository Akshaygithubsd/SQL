 use swiggy;

 #dataset creation (ignore)
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
(1, 'Rajesh Patel   ', 30, 'Male', 'rajesh@e(ample.com', '9876b43210', 'Mumbai', 'Maharashtra', 1000.50, '2023-01-05'),
(1, 'Priya Sharma', 25, 'Female', 'priya@example.com', '9876543211', 'Delhi', 'Delhi', NULL, '2023-02-15'),
(3, 'Amit Kumar', 35, 'm', 'amit@example.com', '98765a3212', 'Bangalore', 'Karnataka', 750.25, '2023-03-25'),
(4, 'Ritu Singh', 28, 'Female', NULL, '9876543213', 'Kolkata', 'West Bengal', 1200.75, '2023-04-10'),
(5, 'Rajesh Patel', 30, 'Male', 'rajesh@e(ample.com', '9876543210', 'Mumbai', 'Maharashtra', 1000.50, '2023-01-05'),
(6, 'Priya Sharma', 25, 'Female', 'priya@example.com', '98765*3211', 'Delhi', 'Delhi', 800.00, '2023-02-15'),
(7, 'Amit Kumar', NULL, 'Male', 'amit@example.com', NULL, 'Bangalore', 'Karnataka', 750.25, '2023-03-25'),
(8, 'Ritu Singh', 28, 'Female', 'ritu@example.com', '9876543213', 'Kolkata', 'West Bengal', 1200.75, '2023-04-10'),
(9, 'Ankit Tiwari', 32, 'Male', 'ankit@example.com', '9876a43214', 'Lucknow', 'Uttar Pradesh', 900.00, '2023-05-20'),
(10, 'Swati Gupta   ', 27, 'Female', 'swati@example.com', '9876543215', 'Jaipur', 'Rajasthan', 1500.00, NULL);
select * from messy_indian_dataset;

# rows with missing values in any columnn
select * from messy_indian_dataset where name is null or age is null or email is null or phone_number is null or
city is null or state is null or purchase_amount is null or purchase_date is null;

# rows without missing values 
select * from messy_indian_dataset where name is not null and age is not null and email is not null and phone_number is not null and
city is not null and state is not null and purchase_amount is not null and purchase_date is not null;

# saving table without null values 
create table clean_table as 
select * from messy_indian_dataset where name is not null and age is not null and email is not null and phone_number is not null and
city is not null and state is not null and purchase_amount is not null and purchase_date is not null;
select * from clean_table;

# filling missing age with any specific values
update messy_indian_dataset set age =coalesce(age,0);
select * from messy_indian_dataset;

# duplicate values
# finding unique rows 
select distinct * from messy_indian_dataset;
# unique values based on id
select id from messy_indian_dataset
group by id 
order by id;

# outliers 
# finding based on z score 
select *,ABS(purchase_amount-avg(purchase_amount) over())/STDDEV(purchase_amount) over() as 'z_score' from messy_indian_dataset;
# adding column for day, month and year
alter table messy_indian_dataset
add column day int,
add column month int ,
add column year int;
select * from messy_indian_dataset;
# extracting date month and year values
update messy_indian_dataset
	set day=DAY(purchase_date),
		month=month(purchase_date),
		year =year(purchase_date);
select * from messy_indian_dataset;

# Data Cleaning 
select * from messy_indian_dataset;
# update Name ( removing extra spaces )
update messy_indian_dataset
set name =trim(name),
name=lower(name);
select * from messy_indian_dataset;
# extracting username from email
alter table messy_indian_dataset
	add column username varchar(30);
update messy_indian_dataset
	set username =substring_index(email,'@',1);
select * from messy_indian_dataset;