-- What is the average quarterly subscription count and total revenue for Premium Plus plans in North America? (i.e., “For North America Premium Plus plans, average of X subscriptions per quarter and Y in dollar revenue per quarter”)
WITH quarterly_metrics AS (
  SELECT
    DATE_FORMAT(sub_start_date, '%Y-%m-01') AS quarter_start,
    COUNT(customer_id) AS subscription_count,
    ROUND(SUM(usd_price), 2) AS revenue_volume
  FROM orders
  LEFT JOIN geo_lookup
  ON orders.country_code = geo_lookup.country_code
  WHERE LOWER(sub_type) LIKE '%premium plus%'
  AND LOWER(TRIM(geo_lookup.region)) LIKE '%na%'
  GROUP BY quarter_start
  ORDER BY quarter_start
)
SELECT
  ROUND(AVG(subscription_count), 2) AS average_quarterly_subscriptions,
  ROUND(AVG(revenue_volume), 2) AS average_quarterly_revenue
FROM quarterly_metrics;


-- What is the subscription count and rate for each plan per year?
SELECT
  YEAR(sub_start_date) AS subscription_year,
  sub_type,
  COUNT(customer_id) AS subscription_count,
  ROUND(COUNT(customer_id) / SUM(COUNT(customer_id)) OVER (PARTITION BY YEAR(sub_start_date)), 2) AS subscription_rate
FROM orders
GROUP BY YEAR(sub_start_date), sub_type
ORDER BY subscription_year IS NULL, subscription_year ASC, subscription_rate DESC;


-- Within each region, what are the ranks of each plan in terms of total revenue?
WITH revenue_by_plan_by_region AS (
  SELECT
    TRIM(geo_lookup.region) AS region,
    orders.sub_type,
    ROUND(SUM(orders.usd_price), 2) AS total_revenue,
    RANK() OVER (PARTITION BY TRIM(geo_lookup.region) ORDER BY SUM(orders.usd_price) DESC) AS revenue_rank
  FROM orders
  LEFT JOIN geo_lookup
  ON orders.country_code = geo_lookup.country_code
  GROUP BY TRIM(geo_lookup.region), orders.sub_type
)
SELECT
  region,
  sub_type,
  total_revenue,
  revenue_rank
FROM revenue_by_plan_by_region
ORDER BY region IS NULL,
region, revenue_rank;

