-- Q1: List all customers along with the total number of orders they placed
-- Joining CSV (customers) and JSON (orders)
SELECT 
    c.name as customer_name, 
    COUNT(o.order_id) as total_orders
FROM read_csv_auto('customers.csv') c
LEFT JOIN read_json_auto('orders.json') o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_orders DESC;

-- Q2: Find the top 3 customers by total order value
-- Using JSON (orders) and CSV (customers)
SELECT 
    c.name, 
    SUM(o.total_amount) as total_spent
FROM read_json_auto('orders.json') o
JOIN read_csv_auto('customers.csv') c ON o.customer_id = c.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 3;

-- Q3: List all products purchased by customers from "Bangalore"
-- Joining CSV (customers), JSON (orders), and Parquet (products)
-- Note: Assuming orders.json contains product_id or a link to it
SELECT DISTINCT p.product_name
FROM read_csv_auto('customers.csv') c
JOIN read_json_auto('orders.json') o ON c.customer_id = o.customer_id
JOIN read_parquet('products.parquet') p ON o.order_id = p.order_id
WHERE c.city = 'Bangalore';

-- Q4: Join all three files to show: customer name, order date, product name and quantity
SELECT 
    c.name as customer_name, 
    o.order_date, 
    p.product_name,
    p.quantity
FROM read_csv_auto('customers.csv') c
JOIN read_json_auto('orders.json') o ON c.customer_id = o.customer_id
JOIN read_parquet('products.parquet') p ON o.order_id = p.order_id;