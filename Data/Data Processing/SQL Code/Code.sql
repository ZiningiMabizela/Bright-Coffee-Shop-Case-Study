select * 
from `Bright_Coffee_Shop`.`sales`.`bright_coffee_shop_sales_dataset` 
limit 100;

SELECT 
  transaction_date,
  DAYNAME(transaction_date) AS Day_name,
  CASE 
    WHEN DAYNAME(transaction_date) = 'Sat' THEN 'Weekend'
    WHEN DAYNAME(transaction_date) = 'Sun' THEN 'Weekend'
    ELSE 'Weekday'
  END AS day_classification,

  CASE 
    WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
    WHEN transaction_time BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon'
    WHEN transaction_time BETWEEN '18:00:00' AND '23:59:59' THEN 'Evening'
   END AS time_classification, 

  MONTHNAME(transaction_date) AS Month_name
  FROM `Bright_Coffee_Shop`.`sales`.`bright_coffee_shop_sales_dataset`;


  SELECT count(transaction_id) as total_number_of_sales,
            SUM(transaction_qty) as units_sold,
            COUNT(DISTINCT product_id) AS unique_products,
            COUNT(store_id) as number_of_stores,
            SUM(transaction_qty * CAST(REPLACE(unit_price, ',', '.') AS DECIMAL(10,2))) as revenue,
            store_location,
            product_category,
            product_type,
            product_detail
FROM `Bright_Coffee_Shop`.`sales`.`bright_coffee_shop_sales_dataset`
GROUP BY ALL;

--Total revenue 
SELECT ROUND(SUM(transaction_qty * CAST(REPLACE(unit_price, ',', '.') AS DECIMAL(10,2))), 2) AS `total amount`
FROM `Bright_Coffee_Shop`.`sales`.`bright_coffee_shop_sales_dataset`;

-- Big code
SELECT
transaction_date,
DAYNAME(transaction_date) AS Day_name,
MONTHNAME(transaction_date) AS Month_name,
COUNT(transaction_id) as number_of_sales,
SUM(transaction_qty) as units_sold,
COUNT(DISTINCT product_id) AS unique_products,
COUNT(store_id) as number_of_stores,
SUM(transaction_qty * CAST(REPLACE(unit_price, ',', '.') AS DECIMAL(10,2))) as revenue,

CASE 
WHEN DAYNAME(transaction_date) = 'Sat' THEN 'Weekend'
WHEN DAYNAME(transaction_date) = 'Sun' THEN 'Weekend'
ELSE 'Weekday'
END AS day_classification,

CASE 
WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
WHEN transaction_time BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon'
WHEN transaction_time BETWEEN '18:00:00' AND '23:59:59' THEN 'Evening'
END AS time_classification,

store_location,
product_category,
product_type,
product_detail
FROM `Bright_Coffee_Shop`.`sales`.`bright_coffee_shop_sales_dataset`
GROUP BY ALL;
