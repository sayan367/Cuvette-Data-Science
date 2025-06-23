Create database supermart_db;
USE supermart_db;

CREATE TABLE customer (
    customer_id character varying(255) NOT NULL,
    customer_name character varying(255),
    segment character varying(255),
    age integer,
    country character varying(255),
    city character varying(255),
    state character varying(255),
    postal_code bigint,
    region character varying(255)
);

select*from customer;
CREATE TABLE product (
    product_id character varying(255) NOT NULL,
    category character varying(255),
    sub_category character varying(255),
    product_name character varying(255)
);

select * from product;

CREATE TABLE sales (
    order_line integer NOT NULL,
    order_id character varying(255),
    order_date date,
    ship_date date,
    ship_mode character varying(255),
    customer_id character varying(255),
    product_id character varying(255),
    sales double precision,
    quantity integer,
    discount double precision,
    profit double precision
);



SHOW VARIABLES LIKE 'local_infile';

LOAD DATA LOCAL INFILE '/Users/sayansarkar/Downloads/Data/1.All files for Restoring Database/CSV files/Customer.csv'
INTO TABLE customer
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
select*from customer;
DROP TABLE customer;

LOAD DATA LOCAL INFILE '/Users/sayansarkar/Downloads/Data/1.All files for Restoring Database/CSV files/Product.csv'
INTO TABLE product
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


LOAD DATA LOCAL INFILE '/Users/sayansarkar/Downloads/Data/1.All files for Restoring Database/CSV files/Sales.csv'
INTO TABLE sales
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

select * from Sales;
select * from customer;
select * from product;
SELECT c.*
FROM customer c
JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.customer_name, c.segment, c.age, c.country, c.city, c.state, c.postal_code, c.region
HAVING 
    (SUM(s.sales) > 1000 AND c.city = 'New York City')
    OR
    (SUM(s.sales) < 500 AND c.city = 'Mesa');





