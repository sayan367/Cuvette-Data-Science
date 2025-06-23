SELECT*FROM CUSTOMER;
SELECT*FROM PRODUCT;
SELECT*FROM SALES;

----1.	Query 1
----2.Retrieve Data: Get the Product ID, Product Name, Sales Value, and Profit.
----3.Join Method: Use an INNER JOIN to combine the product and sales tables based on the Product ID column as the common key.
SELECT PRODUCT_ID,PRODUCT_NAME FROM PRODUCT;
SELECT SALES,PROFIT ,PRODUCT_ID FROM SALES;
SELECT 
    p.PRODUCT_ID, 
    p.PRODUCT_NAME, 
    s.SALES, 
    s.PROFIT
FROM 
    PRODUCT p
INNER JOIN 
    SALES s
ON 
    p.PRODUCT_ID = s.PRODUCT_ID;


-------2.	Query 2
--------Customer Sales Summary: Fetch the Customer Name and City along with the total sales amount for each customer.
--------Grouping: Use the GROUP BY clause on Customer ID to calculate the total sales for each customer, and then join this result with the customer table to get the corresponding customer details.

SELECT CUSTOMER_ID,CUSTOMER_NAME,CITY FROM CUSTOMER;
SELECT CUSTOMER_ID, SALES FROM SALES;

SELECT 
    c.CUSTOMER_NAME, 
    c.CITY, 
    SUM(s.SALES) AS TOTAL_SALES
FROM 
    CUSTOMER c
INNER JOIN 
    SALES s
ON 
    c.CUSTOMER_ID = s.CUSTOMER_ID
GROUP BY 
    c.CUSTOMER_ID, c.CUSTOMER_NAME, c.CITY;