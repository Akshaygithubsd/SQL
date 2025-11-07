use second;
# Primary key
drop table if exists akshay;
create table if not exists akshay(name varchar(50), usn int primary key	);
select * from akshay;

# Composite key
#drop table if exists orders;
create table orders (order_id serial primary key , customer_id int,order_date date,primary key(order_id,cutomer_id));
select* from orders;

#foriegn key
drop table if exists orders;
create table if not exists orders (order_id serial primary key , cutomer_id int ,order_date date,foreign key(customer_id) references akshay(usn));
select * from orders;

#unique constraint

create table kumar(
em_id serial primary key,
email varchar(50) unique,
name varchar(50));
select * from kumar;

# check constraint 

create table bhar(
age int check(age>18));
select * from bhar;