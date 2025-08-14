-- Cleaning and combining orders and geo_lookup tables for Tableau analysis
WITH cleaned_orders AS (
  SELECT
    customer_id,
    UPPER(country_code) AS country_code,
    CASE
      WHEN usd_price IS NOT NULL AND (sub_type IS NULL OR sub_period IS NULL) AND usd_price < 20 THEN 'standard'
      ELSE sub_type
    END AS sub_type,
    CASE
      WHEN usd_price IS NOT NULL AND (sub_type IS NULL OR sub_period IS NULL) AND usd_price < 20 THEN 'month'
      ELSE sub_period
    END AS sub_period,
    sub_start_date,
    usd_price
  FROM orders
),
cleaned_geo_lookup AS (
  SELECT
    UPPER(country_code) AS country_code,
    CASE
      WHEN country_code IN ('BO', 'BQ', 'VE', 'VG', 'VI') THEN 'LATAM'
      WHEN country_code IN ('CD', 'IC', 'IR', 'MD', 'MK', 'PS', 'SH', 'TZ', 'EU') THEN 'EMEA'
      WHEN country_code IN ('KP', 'KR', 'TW') THEN 'APAC'
      ELSE COALESCE(region, 'Unknown')
    END AS region
  FROM geo_lookup
)
SELECT
  cleaned_orders.customer_id,
  cleaned_orders.country_code,
  cleaned_orders.sub_type,
  cleaned_orders.sub_period,
  cleaned_orders.sub_start_date,
  cleaned_orders.usd_price,
  cleaned_geo_lookup.region
FROM cleaned_orders
LEFT JOIN cleaned_geo_lookup
  ON cleaned_orders.country_code = cleaned_geo_lookup.country_code;