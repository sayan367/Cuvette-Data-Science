SELECT*FROM CUSTOMER;
SELECT*FROM PRODUCT;
SELECT*FROM SALES;
SELECT DISTINCT city
FROM customer
WHERE region IN ('North', 'East');
SELECT *  FROM SALES
WHERE SALES BETWEEN 100 AND 500;
SELECT *
FROM CUSTOMER
WHERE CUSTOMER_name 
LIKE '____';