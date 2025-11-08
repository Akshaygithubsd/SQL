use practice;
select * from data;
# find products where product name ends with s
select product_name from data 
where product_name like '%s'; 
# find products where product name starts with s
select product_name from data
where product_name like 's%';
# find products where brand name starts contains ad
select product_name,brand_name from data
where brand_name like '%ad%';
#find products where brand_name stands with p and ends with s
select * from data
where brand_name like 'p%s';
#find product where brand name is exxact of 6 characters
select * from data 
where brand_name like '______';
#find product where brand name is 2nd character as s
select * from data
where brand_name like '_s';

# aggregate functions

#count 
select count(*) as no_of_rows from data ;
# max
select *  from data
where rating =( select max(rating ) from data);
# similarly min ,sum , avg 

