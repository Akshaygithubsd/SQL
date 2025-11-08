use practice;
select * from data;

# find name of unique brand
select distinct(brand_name) from data;

# find no. of unique brand 
select count(distinct(brand_name)) as counts from data;

# no. of products in each brand
select brand_name , count(product_name) as count from data group by(brand_name);

# top 5 brands who has most no. of products
select brand_name , count(product_name) as products from data
group by(brand_name) order by (count(product_name)) desc limit 5;

# top 5 most expensive brand based on their discount price 
select brand_name , discounted_price from data 
group by(brand_name) order by (round(discounted_price)) desc limit 5;

#top 5 brand who sold most no. of product 
select brand_name , sum(rating_count) as product_sold from data 
group by(brand_name) order by product_sold desc limit 5;

# top 5 most expensive brands based on their dicounted price

select brand_name , avg(discounted_price) as disc from data 
group by (brand_name) order by disc desc limit 5;

# top 10 best selling product categories
select product_name , sum(rating_count) pro_sold from data
group by product_name
order by count desc limit 10;

# top 10 brand who has max discount 

select brand_name , avg(discounted_price) as discount from data
group by(brand_name) order by(discount) desc limit 10;

# top 5 expensive product categories 

select product_tag, sum(marked_price) as price from data
group by product_tag 
order by price desc limit 5;

# brand report card

select brand_tag as brand, brand_name as name,
marked_price as price from data
group by brand_tag;

# which product category of any brand is sold the most 

select product_tag as product ,brand_tag as brand , sum(rating_count) as summ from data 
group by product,brand order by summ desc limit 1 ;

# top 5 brands which has sold most number of tshirts 

select brand_tag as brand , product_tag as product,sum(rating_count) as sold from data
where product_tag='tshirts'
group by brand 
order by sold desc limit 5;

# most popular product 
select product_name as product,sum(rating_count) as sold_prod from data 
group by product_name
order by sold_prod desc limit 1;

#no. of product sold for every rating (0-5)
select rating , count(product_tag) as prod from data
group by rating 
order by prod desc ;

#no. of product sold for every rating by bike 
select rating , count(rating_count) as count  from data 
where (brand_tag='nike' and rating =0)
group by rating 
order by count desc limit 2;
