
use swiggy;
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
 # query execution order
 select name , city from messy_indian_dataset;
 # order of execution of above query
 # 1) from ( command will work )
 # 2) select (command )
 
 select name , city , purchase_amount 
 from messy_indian_dataset
 where purchase_amount >1000;
  # order of execution of above query
 # 1) from ( command will work )
 # 2) where ( command will work)
 # 3) select (command )
 
select name , city , purchase_amount 
	from messy_indian_dataset
		where purchase_amount >1000
			order by purchase_amount desc;
 
  # order of execution of above query
 # 1) from ( command will work )
 # 2) where ( command will work)
 # 3) select (command )
 # 4 ) order by 
 
 select city , avg(purchase_amount) as avg_purchase
	from messy_indian_dataset
		group by city;
# order of execution of above query
 # 1) from ( command will work )
 # 2) group by ( command will work)
 # 3) select (command )
 
 select city , avg(purchase_amount) as avg_purchase
	from messy_indian_dataset
		group by city
			having avg(purchase_amount)>1000;
# order of execution of above query
 # 1) from ( command will work )
 # 2) group by ( command will work)
 # 3) having 
 # 4) select (command )
 #DROP TABLE states;
CREATE TABLE states ( state VARCHAR(50), region VARCHAR(50) );
INSERT INTO states (state, region) VALUES 	('Maharashtra', 'West'), ('Delhi', 'North'), ('Karnataka', 'South'), 
											('West Bengal', 'East'), ('Rajasthan', 'West');
SELECT m.name, m.city, s.region
	FROM messy_indian_dataset m
		JOIN states s ON m.state = s.state;
# order of execution of above query
 # 1) from ( command will work )
-- 2. JOIN
-- 3. SELECT

SELECT name, city, purchase_amount
	FROM messy_indian_dataset
		WHERE purchase_amount > (SELECT AVG(purchase_amount) FROM messy_indian_dataset);
# order of execution of above query
-- 1. Subquery(FROM)
-- 2. Subquery(SELECT)
-- 3. FROM
-- 4. WHERE
-- 5. SELECT

-- Final

-- Order of Execution
-- 1. FROM: Determines the source tables and joins if any.
-- 2. WHERE: Applies row filtering.
-- 3. GROUP BY: Groups rows by specified columns.
-- 4. HAVING: Applies group filtering.
-- 5. SELECT: Determines which columns to include in the final result set.
-- 6. ORDER BY: Sorts the result set.
-- 7. LIMIT: Restricts the number of rows in the result set.

# how to improve efficiency of sql query
# 1) Avoid accessing unnecessary results 
select * from messy_indian_dataset;
#( don't display all the results if u have option to limit the results)
select id,name, city, purchase_amount from messy_indian_dataset;
select id,name, city, purchase_amount from messy_indian_dataset where purchase_amount > 1000 limit 5;

-- 2. Use right kind of JOIN

-- 3. Use of Appropriate Data Types
create table customer_correct(id INT, name varchar(50), description varchar(255));
# this no need to use 
create table customer_correct(id INT, name varchar(50), description text);
# this will stre the data in more efficient way

-- 4. Query Execution Plans ( tells a lot about the query )
explain select id, name, city , purchase_amount from messy_indian_dataset 
where purchase_amount > 1000;

# whenever u r using any websites frequently , chrome browser save it in your local host 
# in caching if u r writung same queries again and again , result will save result in cache
# on your local system , caching in my sql not in used bcz its depriciated 	 

# what is & why temporary table 
# partition table
CREATE TABLE dataset (
    id INT,
    name VARCHAR(50),
    city VARCHAR(50),
    purchase_amount DECIMAL(10, 2),
    purchase_date DATE);

-- 1. Range Partitioning

DROP TABLE IF EXISTS partitioned_dataset;
CREATE TABLE partitioned_dataset ( id INT, name VARCHAR(50), city VARCHAR(50), purchase_amount DECIMAL(10, 2), purchase_date DATE )
PARTITION BY RANGE (YEAR(purchase_date)) 
(
    PARTITION p0 VALUES LESS THAN (2020),
    PARTITION p1 VALUES LESS THAN (2021),
    PARTITION p2 VALUES LESS THAN (2022),
    PARTITION p3 VALUES LESS THAN (2023),
    PARTITION p4 VALUES LESS THAN (2024)
);
SELECT name, city, purchase_amount  FROM partitioned_dataset WHERE purchase_date BETWEEN '2022-01-01' AND '2022-12-31';

-- 2. List Partitioning

DROP TABLE IF EXISTS partitioned_dataset;
CREATE TABLE partitioned_dataset ( id INT, name VARCHAR(50), city VARCHAR(50), purchase_amount DECIMAL(10, 2), purchase_date DATE,
    city_code INT GENERATED ALWAYS AS (
        CASE
            WHEN city = 'Mumbai' THEN 1
            WHEN city = 'Delhi' THEN 2
            WHEN city = 'Bangalore' THEN 3
            WHEN city IN ('Kolkata', 'Chennai', 'Hyderabad', 'Pune') THEN 4
            ELSE NULL
        END
    ) STORED
)
PARTITION BY LIST (city_code) (
    PARTITION p_mumbai VALUES IN (1),
    PARTITION p_delhi VALUES IN (2),
    PARTITION p_bangalore VALUES IN (3),
    PARTITION p_other VALUES IN (4));

INSERT INTO partitioned_dataset (id, name, city, purchase_amount, purchase_date)
VALUES
(1, 'Rajesh Patel', 'Mumbai', 1000.50, '2023-01-05'),
(2, 'Priya Sharma', 'Delhi', 850.75, '2023-02-10'),
(3, 'Amit Kumar', 'Bangalore', 1200.00, '2023-03-15'),
(4, 'Ritu Singh', 'Kolkata', 950.00, '2023-04-20'),
(5, 'Anjali Gupta', 'Chennai', 1100.25, '2023-05-25');


SELECT name, purchase_amount 
FROM partitioned_dataset 
WHERE city = 'Mumbai';


-- 3. Hash Partitioning

DROP TABLE IF EXISTS partitioned_dataset;
CREATE TABLE partitioned_dataset ( id INT, name VARCHAR(50), city VARCHAR(50), purchase_amount DECIMAL(10, 2), purchase_date DATE )
PARTITION BY HASH(id) PARTITIONS 4;

SELECT name, city, purchase_amount 
FROM partitioned_dataset 
WHERE id = 12345;

-- 4. Subpartitioning

DROP TABLE IF EXISTS partitioned_dataset;
CREATE TABLE partitioned_dataset (
    id INT,
    name VARCHAR(50),
    city VARCHAR(50),
    purchase_amount DECIMAL(10, 2),
    purchase_date DATE
)
PARTITION BY RANGE (YEAR(purchase_date))
SUBPARTITION BY HASH(id) SUBPARTITIONS 4 (
    PARTITION p0 VALUES LESS THAN (2020),
    PARTITION p1 VALUES LESS THAN (2021),
    PARTITION p2 VALUES LESS THAN (2022),
    PARTITION p3 VALUES LESS THAN (2023),
    PARTITION p4 VALUES LESS THAN (2024)
);

SELECT name, city, purchase_amount 
FROM partitioned_dataset 
WHERE purchase_date BETWEEN '2022-01-01' AND '2022-12-31';

# indexing is basically used to select any column of your choice , it like group by 