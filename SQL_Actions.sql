#create database practice;
use practice ;
select * from data;
# showing specific column
select product_name,brand_name from data;
# showing column in diff order
select rating,sizes from data;
# creating new column with material function | making discounted amounted
select product_name , marked_price-discounted_price from data;
# renaming the column 
select product_name,marked_price-discounted_price as discounted from data;

#finding unique values from a column
select distinct (brand_name) from data;
# renaming brand_name
select distinct(brand_name) as unique_brand from data;
# where clause
select distinct(rating),marked_price from data where marked_price=1295;

select rating ,marked_price , discounted_price from data where marked_price=1295 and discounted_price=828;
# between 	
select rating,marked_price , discounted_price from data where marked_price between 1000 and 1500;
select count(distinct(product_tag)) as counting from data where brand_tag='adidas';
# oR
select count(distinct(product_tag)) as countingsss ,brand_tag from data 
where (brand_tag='adidas' or brand_tag='puma');
# not
select count(distinct(product_tag)) as countingsss ,brand_tag from data 
where not (brand_tag='adidas' or brand_tag='puma');
# in
select count(distinct(product_tag)) as countingsss ,brand_tag from data 
where brand_tag in ('adidas' ,'puma');
# similarly no in 
