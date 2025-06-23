show databases;
use supermart_db;
show tables;
select*from customer;
select*from product;
select*from sales;

CREATE VIEW Daily_Billing AS
SELECT order_line, product_id, sales, discount
FROM sales
WHERE order_date = (
    SELECT MIN(order_date) FROM sales
);
SHOW CREATE VIEW Daily_Billing;

SHOW FULL TABLES IN supermart_db WHERE TABLE_TYPE LIKE 'VIEW';
DROP VIEW IF EXISTS Daily_Billing;
