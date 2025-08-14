-- Create database and use it
CREATE DATABASE IF NOT EXISTS edumentor_sub;
USE edumentor_sub;

-- Enable local_infile if needed
SET GLOBAL local_infile = 1;

-- Drop orders table if exists
DROP TABLE IF EXISTS orders;

-- Create table with proper datatypes
CREATE TABLE orders (
    customer_id VARCHAR(16),
    country_code VARCHAR(5),
    sub_type VARCHAR(16),
    sub_period VARCHAR(16),
    usd_price FLOAT,
    sub_start_date DATE
);

-- Load data from your CSV file
LOAD DATA LOCAL INFILE '/Users/hiepnguyenbg91/Downloads/orders.csv'
INTO TABLE orders
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    @customer_id,
    @country_code,
    @sub_type,
    @sub_period,
    @usd_price,
    @sub_start_date
)
SET
    customer_id = NULLIF(@customer_id, ''),
    country_code = NULLIF(@country_code, ''),
    sub_type = NULLIF(@sub_type, ''),
    sub_period = NULLIF(@sub_period, ''),
    usd_price = NULLIF(TRIM(@usd_price), ''),
	sub_start_date = NULLIF(REPLACE(TRIM(@sub_start_date), '\r', ''), '');
    
    
SELECT *
FROM orders
LIMIT 10;



-- Drop orders table if exists
DROP TABLE IF EXISTS geo_lookup;

-- Create table with proper datatypes
CREATE TABLE geo_lookup (
    country_code VARCHAR(5),
    region VARCHAR(10)
);

-- Load data from your CSV file
LOAD DATA LOCAL INFILE '/Users/hiepnguyenbg91/Downloads/geo_lookup.csv'
INTO TABLE geo_lookup
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    @country_code,
    @region
)
SET
    country_code = NULLIF(TRIM(REPLACE(@country_code, '\r', '')), ''),
    region       = NULLIF(TRIM(REPLACE(@region, '\r', '')), '');
    
    
SELECT *
FROM geo_lookup;    