# avg rating of products
use practice;
select * from data;
select product_tag,round(avg(rating)) from data group by product_tag;
select avg(rating) from data ;

# brand name of products with a rating higher than avg rating 
select brand_name , round(avg(rating)) as 'avg_rat' from data
where  rating > 'avg_rat'
group by brand_name;

# product name along with the avg rating of the products

select product_name , avg(rating) from data 
group by product_name;

# total rating count of products for each brand compared to overall avg rating count 

select brand_tag, count(rating),avg(rating_count) from data
group by brand_tag; 