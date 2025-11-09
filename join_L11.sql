create database user;
create table aks(
name varchar(50),usn int primary key);
create table aksh(
name varchar(50),usn int primary key);
create table aksha(
name varchar(50),usn int primary key);
insert into aks (name,usn) values('akshay',4),('jdd',7),('gh',6);
insert into aksh (name,usn) values('akshay',4),('jdd',7),('gh',2),('shdg',5);
insert into aksha (name,usn) values('akshay',4),('jdd',7),('gh',2),('shdg',5),('xcfgyu',6);
select * from aks;
select * from aksh;
select * from aksha;

# inner join

select * from aks inner join aksh on aks.usn=aksh.usn;

# left join

select * from aks left join aksh on aks.usn=aksh.usn;

# right join

select * from aks right join aksh on aks.usn=aksh.usn;

#cross inner join , union 

select * from aks 
union
select * from aksh;

# union all , prints value as it is 

select * from aks 
union all
select * from aksh;

# except , it prints all the values of table 1 that r not in table 2 

SELECT * FROM aks
EXCEPT
SELECT * FROM aksh;
# rows common in both 

select * from aks
intersect 
select * from aksh;