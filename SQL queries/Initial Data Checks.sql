-- Utilizing dataset for the first time, performing checks for inconsistencies, errors, and general data ranges
-- 1) Duplicate Orders Check
SELECT
    customer_id,
    COUNT(*) AS customer_id_count
FROM orders
GROUP BY 1
HAVING customer_id_count > 1;

-- 2) Null Check
SELECT
    SUM(CASE WHEN orders.customer_id IS NULL THEN 1 ELSE 0 END) AS nullcount_cust_id,
    SUM(CASE WHEN orders.country_code IS NULL THEN 1 ELSE 0 END) AS nullcount_country_code,
    SUM(CASE WHEN orders.sub_type IS NULL THEN 1 ELSE 0 END) AS nullcount_sub_type,
    SUM(CASE WHEN orders.sub_period IS NULL THEN 1 ELSE 0 END) AS nullcount_sub_period,
    SUM(CASE WHEN orders.usd_price IS NULL THEN 1 ELSE 0 END) AS nullcount_usd_price,
    SUM(CASE WHEN orders.sub_start_date IS NULL THEN 1 ELSE 0 END) AS nullcount_sub_start_date
FROM orders;

-- 3) Checking Distinct Sub Types, Sub Periods, Countries & Regions For Familiarity And Finding Irregularities
SELECT
    DISTINCT sub_type
FROM orders
ORDER BY 1;


SELECT
    DISTINCT sub_period
FROM orders
ORDER BY 1;


SELECT 
	DISTINCT region
FROM geo_lookup;


SELECT
    DISTINCT orders.country_code,
    geo_lookup.region
FROM orders
LEFT JOIN geo_lookup AS geo_lookup
ON orders.country_code = geo_lookup.country_code
ORDER BY 1;


SELECT
    DISTINCT orders.country_code,
    COUNT(orders.country_code) AS countnull
FROM orders
LEFT JOIN geo_lookup AS geo_lookup
ON orders.country_code = geo_lookup.country_code
WHERE geo_lookup.region IS NULL
GROUP BY 1;

-- 4) Subscription Start Date Ranges To Understand Time Frames
SELECT
    MIN(sub_start_date) AS earliest_sub_start_date,
    MAX(sub_start_date) AS latest_sub_start_date
FROM orders;

-- 5) Price Ranges
SELECT COUNT(*) AS count_of_orders
FROM orders
WHERE usd_price = 0
GROUP BY 1;


SELECT
    MIN(usd_price) AS smallest_price,
    MAX(usd_price) AS largest_price
FROM orders
WHERE usd_price != 0;


SELECT sub_type, sub_period,
    MIN(usd_price) AS smallest_price,
    MAX(usd_price) AS largest_price
FROM orders
WHERE usd_price <> 0
GROUP BY 1, 2
ORDER BY 1, 2;