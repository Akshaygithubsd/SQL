#use second;
#select * from Employees;
# another way of writing 
select * from second.Employees;
select name , age from Employees;
# changing column name from table 
select name as akshay from Employees;
select * from Employees;
select * from Employees where age>30;
select * from Employees where age >30 and department="HR";
select * from Employees where age between 30 and 40;
select * from Employees where department ="hr" or department="sales";
# u'll get all the names starting from J
select * from Employees where name like "J%";
# getting not null data
select * from Employees where department is not null;
# getting data using IN  command 
select * from Employees where department in ('sales','marketing ');
# to get first 5 values 
select * from Employees limit 5;
# will get first 5 values after 5 index
select * from Employees limit 5 offset 5;
# sorting the data , by default it will sort in ascending order
select * from Employees order by age ;
select * from Employees order by age desc;
# multiple order cases
select * from Employees order by age desc, employee_id asc;