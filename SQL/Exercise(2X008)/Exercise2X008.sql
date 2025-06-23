SELECT*FROM sales;
SELECT * FROM CUSTOMER;
SELECT* FROM PRODUCT;
SELECT COUNT(*) FROM CUSTOMER WHERE REGION='SOUTH'OR REGION='EAST';
SELECT COUNT(DISTINCT CITY) AS UniqueCities
FROM CUSTOMER
WHERE Region = 'South' OR Region = 'East';
SELECT COUNT(DISTINCT order_id)FROM SALES WHERE SALES BETWEEN 100 AND 500;
SELECT COUNT(*)
FROM customer
WHERE customer_name LIKE '% ____'
---1.	Fetch all orders where the discount value is greater than zero, and sort the results in descending order based on the discount value.--

SELECT *
FROM SALES
WHERE Discount > 0
ORDER BY Discount DESC;

SELECT * 
FROM SALES
WHERE DISCOUNT > 0
ORDER BY DISCOUNT DESC
LIMIT 10;

SELECT SUM(sales) as sum_sales from SALES;
SELECT COUNT(*) FROM CUSTOMER WHERE AGE BETWEEN 20 AND 30;
---Calculate the total sum of all sales values---------------------
SELECT SUM(SALES) AS SUM_SALES FROM SALES;
---2.	Determine the number of customers in the north region who are aged between 20 and 30.---------------

SELECT COUNT(*) 
FROM CUSTOMER 
WHERE AGE BETWEEN 20 AND 30 AND region = 'North';

---3.	Compute the average age of customers located in the east region.-----------------
SELECT AVG(AGE) AS Average_Age
FROM CUSTOMER
WHERE Region = 'East';


-----4.Identify the minimum and maximum ages of customers from Philadelphia.---------------------------
SELECT MIN(AGE) AS Minimum_Age, MAX(AGE) AS Maximum_Age
FROM CUSTOMER
WHERE City = 'Philadelphia';