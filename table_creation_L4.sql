# creating a table 
create table akshay(name varchar(50),age int);
select * from akshay;

drop table if exists akshay;
create table akshay (
name varchar(50) not null,
age int check(age>=18),
hire_date date);
select * from akshay;
#adding column 
alter table akshay add column address varchar(50);
select * from akshay;

# renaming column 
-- alter table akshay rename column name to naming ;
-- select * from akshay;
# drop column 
alter table akshay drop column name ;
select * from akshay ;