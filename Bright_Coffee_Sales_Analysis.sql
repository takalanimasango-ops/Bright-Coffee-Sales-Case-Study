SELECT
  *
FROM
  "MIROBRIGHT"."COFFEE"."SHOP"
  
--------------------------------------------------------------------
--EXPLOROTORY DATA ANALYSIS

--Checking number of our stores

SELECT DISTINCT store_location
FROM MIROBRIGHT.COFFEE.SHOP;

--------------------------------------------------------------------
--Checking number of product category

SELECT DISTINCT product_category
FROM MIROBRIGHT.COFFEE.SHOP;

--------------------------------------------------------------------
--Checking product type

SELECT DISTINCT product_type
FROM MIROBRIGHT.COFFEE.SHOP;

--------------------------------------------------------------------
--Date and time function
--Checking the earliest transaction date

SELECT MIN(transaction_date) AS first_operating_date
FROM MIROBRIGHT.COFFEE.SHOP;

--------------------------------------------------------------------
--Checking the latest transaction date

SELECT MAX(transaction_date) AS last_operating_date
FROM MIROBRIGHT.COFFEE.SHOP;

--------------------------------------------------------------------

--Checking the earliest time 

SELECT MIN(transaction_time) AS earliest_time
FROM MIROBRIGHT.COFFEE.SHOP;

--------------------------------------------------------------------
--Checking the latest transaction date

SELECT MAX(transaction_time) AS lastest_time
FROM MIROBRIGHT.COFFEE.SHOP;

--------------------------------------------------------------------

SELECT transaction_date,
       DAYNAME(transaction_date) AS day_name
FROM MIROBRIGHT.COFFEE.SHOP;
--------------------------------------------------------------------

SELECT transaction_date,
       DAYNAME(transaction_date) AS day_name, 
       CASE
          WHEN DAYNAME(transaction_date) IN ('Sat','Sun') THEN 'weekend'
          ELSE 'weekday'
    END AS day_classification
FROM MIROBRIGHT.COFFEE.SHOP;


--------------------------------------------------------------------

SELECT transaction_date,
       DAYNAME(transaction_date) AS day_name, 
       CASE
          WHEN DAYNAME(transaction_date) IN ('Sat','Sun') THEN 'weekend'
          ELSE 'weekday'
    END AS day_classification,
    MONTHNAME(transaction_date) AS month_name
FROM MIROBRIGHT.COFFEE.SHOP;


--------------------------------------------------------------------
SELECT transaction_date,
       DAYNAME(transaction_date) AS day_name, 
       CASE
          WHEN DAYNAME(transaction_date) IN ('Sat','Sun') THEN 'weekend'
          ELSE 'weekday'
    END AS day_classification,
    MONTHNAME(transaction_date) AS month_name,
    transaction_time,
    CASE 
       WHEN transaction_time BETWEEN '06:00:00' AND '11:59:00' THEN 'Morning'
       WHEN transaction_time BETWEEN '12:00:00' AND '16:59:00' THEN 'Afternoon'
       WHEN transaction_time >= '17:00:00' THEN 'Evening'
       END AS Time_bucket
FROM MIROBRIGHT.COFFEE.SHOP;


--------------------------------------------------------------------
SELECT transaction_date,
       DAYNAME(transaction_date) AS day_name, 
       CASE
          WHEN DAYNAME(transaction_date) IN ('Sat','Sun') THEN 'weekend'
          ELSE 'weekday'
    END AS day_classification,
    MONTHNAME(transaction_date) AS month_name,
    transaction_time,
    CASE 
       WHEN transaction_time BETWEEN '06:00:00' AND '11:59:00' THEN 'Morning'
       WHEN transaction_time BETWEEN '12:00:00' AND '16:59:00' THEN 'Afternoon'
       WHEN transaction_time >= '17:00:00' THEN 'Evening'
       END AS Time_bucket,
       HOUR (transaction_time) AS hour_of_day
FROM MIROBRIGHT.COFFEE.SHOP;

--------------------------------------------------------------------

SELECT transaction_date,
       DAYNAME(transaction_date) AS day_name, 
       CASE
          WHEN DAYNAME(transaction_date) IN ('Sat','Sun') THEN 'weekend'
          ELSE 'weekday'
    END AS day_classification,
    MONTHNAME(transaction_date) AS month_name,
    transaction_time,
    CASE 
       WHEN transaction_time BETWEEN '06:00:00' AND '11:59:00' THEN 'Morning'
       WHEN transaction_time BETWEEN '12:00:00' AND '16:59:00' THEN 'Afternoon'
       WHEN transaction_time >= '17:00:00' THEN 'Evening'
       END AS Time_bucket,
       HOUR (transaction_time) AS hour_of_day,
       Store_location,
       Product_category,
       Product_detail,
       Product_type
FROM MIROBRIGHT.COFFEE.SHOP;

--------------------------------------------------------------------
SELECT transaction_date,
       DAYNAME(transaction_date) AS day_name, 
       CASE
          WHEN DAYNAME(transaction_date) IN ('Sat','Sun') THEN 'weekend'
          ELSE 'weekday'
    END AS day_classification,
    MONTHNAME(transaction_date) AS month_name,
    transaction_time,
    CASE 
       WHEN transaction_time BETWEEN '06:00:00' AND '11:59:00' THEN 'Morning'
       WHEN transaction_time BETWEEN '12:00:00' AND '16:59:00' THEN 'Afternoon'
       WHEN transaction_time >= '17:00:00' THEN 'Evening'
       END AS Time_bucket,
       HOUR (transaction_time) AS hour_of_day,
       Store_location,
       Product_category,
       Product_detail,
       Product_type,
       Unit_price,
       Transaction_qty
FROM MIROBRIGHT.COFFEE.SHOP;

-------------------------------------------------------------------

SELECT transaction_date,
       DAYNAME(transaction_date) AS day_name, 
       CASE
          WHEN DAYNAME(transaction_date) IN ('Sat','Sun') THEN 'weekend'
          ELSE 'weekday'
    END AS day_classification,
    MONTHNAME(transaction_date) AS month_name,
    transaction_time,
    CASE 
       WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
       WHEN transaction_time BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
       WHEN transaction_time >= '17:00:00' THEN 'Evening'
       END AS Time_bucket,
       HOUR (transaction_time) AS hour_of_day,
       Store_location,
       Product_category,
       Product_detail,
       Product_type,
       Unit_price,
       Transaction_qty,
       COUNT (DISTINCT transaction_id) AS number_of_sales,
       SUM(Transaction_qty*unit_price) AS revenue
FROM MIROBRIGHT.COFFEE.SHOP
GROUP BY ALL;

-----------------------------------
