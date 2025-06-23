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
show tables;

CREATE TABLE product (
    product_id character varying(255) NOT NULL,
    category character varying(255),
    sub_category character varying(255),
    product_name character varying(255)
);


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





select*from customer;
select*from product;
select*from sales;

SELECT 
    s.*, 
    c.customer_name, 
    c.customer_age, 
    p.product_name, 
    p.product_category
FROM 
    (SELECT * FROM sales) AS s
JOIN 
    customers AS c ON s.customer_id = c.customer_id
JOIN 
    products AS p ON s.product_id = p.product_id;





