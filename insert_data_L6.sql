use second;
drop table if exists akshay;
create table if not exists akshay(
emp_id varchar(50),
first varchar(20),
second varchar(10),
depat varchar(30));
select * from akshay;

# inserting data in single row 

insert into akshay(
emp_id,first,second,depat)
values(1,'akshay','kuam','aiml');
select * from akshay;

# insert multiple rows
insert into akshay(
emp_id,first,second,depat)
values(2,'aks','jd','dj'),
(3,'djd','djd','dd');

select * from akshay;

# adding partial data

insert into akshay(
first,second)
values('ajs','djd');
select * from akshay;

# inserting order in diff order

# adding data without order 
# updating data
update akshay
set first= 'ok'
where emp_id=1;
select * from akshay;

# deleting table 

delete from akshay
where first='ok';
select * from akshay;
# delete data whose last name starts with w
delete from akshay
where second like 'k%';
select * from akshay;
# delete all rows from table 
delete from akshay;
select * from akshay;