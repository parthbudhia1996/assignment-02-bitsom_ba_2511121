-- 1. Central Fact Table
CREATE TABLE fact_sales (
    transaction_id VARCHAR(20) PRIMARY KEY,
    date_key DATE,
    store_id INT,
    product_id,
    units_sold INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
	FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
	FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
	FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- 2. Dimension Tables
CREATE TABLE dim_date (
    date_key DATE PRIMARY KEY,
    day INT NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL
);

CREATE TABLE dim_store (
    store_id SERIAL PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    store_city VARCHAR(50) NOT NULL
);

CREATE TABLE dim_product (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);

-- 3. Sample Cleaned Data Load (at least 10 fact rows)
INSERT INTO dim_product VALUES (1, 'Speaker','Electronics');
INSERT INTO dim_product VALUES (2, 'Atta 10kg','Grocery');
INSERT INTO dim_product VALUES (3, 'SmartWatch','Electronics');
INSERT INTO dim_product VALUES (4, 'Tablet','Electronics');
INSERT INTO dim_product VALUES (5, 'Jeans','Clothing');

INSERT INTO dim_store VALUES (1, 'Chennai Anna', 'Chennai');
INSERT INTO dim_store VALUES (2, 'Bangalore MG', 'Bangalore');
INSERT INTO dim_store VALUES (3, 'Pune FC Road', 'Pune');
INSERT INTO dim_store VALUES (4, 'Delhi South', 'Delhi');
INSERT INTO dim_store VALUES (5, 'Mumbai Central', 'Mumbai');

INSERT INTO dim_date VALUES ('2023-08-29', 29, 8, 2023);
INSERT INTO dim_date VALUES ('2023-08-09', 09, 08, 2023);
INSERT INTO dim_date VALUES ('2023-03-31', 31, 3, 2023);
INSERT INTO dim_date VALUES ('2023-02-20', 20, 2, 2023);
INSERT INTO dim_date VALUES ('2023-10-20', 20, 10, 2023);

INSERT INTO fact_sales VALUES ('TXN5000', '2023-08-29', 1, 1, 3, 49262.78);
INSERT INTO fact_sales VALUES ('TXN5001', '2023-12-12', 1, 4, 11, 23226.12);
INSERT INTO fact_sales VALUES ('TXN5002', '2023-02-05', 1, 6, 20, 48703.39);
INSERT INTO fact_sales VALUES ('TXN5003', '2023-02-20', 2, 1, 14, 23226.12);
INSERT INTO fact_sales VALUES ('TXN5005', '2023-08-09', 3, 2, 12, 52464.00);
INSERT INTO fact_sales VALUES ('TXN5006', '2023-03-31', 4, 3, 6, 58851.01);
INSERT INTO fact_sales VALUES ('TXN5007', '2023-10-26', 4, 5, 16, 2317.47);
INSERT INTO fact_sales VALUES ('TXN5008', '2023-12-08', 3, 7, 9, 27469.99);
INSERT INTO fact_sales VALUES ('TXN5011', '2023-10-20', 5, 5, 13, 2317.47);
INSERT INTO fact_sales VALUES ('TXN5013', '2023-04-28', 5, 8, 10, 43374.39);