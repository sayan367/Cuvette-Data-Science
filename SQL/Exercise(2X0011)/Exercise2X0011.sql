SELECT*FROM CUSTOMER;
  
----1.	1. Calculate the total sales for each state using the `customer_20_60` and `sales_2015` tables. Remember to utilize joins and the GROUP BY command.
SELECT c.state, SUM(s.sales) AS total_sales
FROM customer AS c
JOIN sales AS s
ON c.customer_id = s.customer_id
GROUP BY c.state
ORDER BY total_sales DESC;


--------2.	Retrieve data that includes the product ID, product name, category, total sales value for each product, and total quantity sold. (Make sure to use the `sales` and `product` tables.)
SELECT c.state, SUM(s.sales) AS total_sales
FROM customer AS c
JOIN sales AS s
ON c.customer_id = s.customer_id
GROUP BY c.state
ORDER BY total_sales DESC;




