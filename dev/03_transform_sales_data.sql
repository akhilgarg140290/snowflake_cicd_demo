CREATE OR REPLACE TABLE sales_summary AS
SELECT region, SUM(amount) AS total_sales
FROM sales_data_raw
GROUP BY region;
