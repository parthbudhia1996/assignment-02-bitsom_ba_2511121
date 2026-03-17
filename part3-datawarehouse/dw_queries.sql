-- total_revenue - Calculated as units_sold * unit_price

-- Q1: Total sales revenue by product category for EACH month
-- This gives a month-by-month breakdown of how each category performed
SELECT 
    d.year, 
    d.month, 
    p.category, 
    SUM(f.units_sold * f.unit_price) as total_revenue
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
JOIN dim_date d ON f.date_key = d.date_key
GROUP BY d.year, d.month, p.category
ORDER BY d.year, d.month, p.category;

-- Q2: Top 2 performing stores by total revenue
SELECT s.store_name, SUM(f.units_sold * f.unit_price) as total_revenue
FROM fact_sales f
JOIN dim_store s ON f.store_id = s.store_id
GROUP BY s.store_name
ORDER BY total_revenue DESC
LIMIT 2;

-- Q3: Month-over-month sales trend across all stores
-- Shows the growth or decline of the entire business month by month
SELECT d.year, d.month, SUM(f.units_sold * f.unit_price) as total_revenue
FROM fact_sales f
JOIN dim_date d ON f.date_key = d.date_key
GROUP BY d.year, d.month
ORDER BY d.year, d.month;