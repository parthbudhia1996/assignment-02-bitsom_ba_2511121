-- Create Customers Table
CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

-- Create Products Table
CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL
);

-- Create Sales Representatives Table
CREATE TABLE sales_reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address TEXT NOT NULL
);

-- Create Orders Table
CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    product_id VARCHAR(10),
    sales_rep_id VARCHAR(10),
    quantity INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

-- Insert Sample Data (at least 5 rows per table)
INSERT INTO customers VALUES ('C001', 'Rohan Mehta', 'rohan@gmail.com', 'Mumbai');
INSERT INTO customers VALUES ('C002', 'Priya Sharma', 'priya@gmail.com', 'Delhi');
INSERT INTO customers VALUES ('C003', 'Amit Verma', 'amit@gmail.com', 'Bangalore');
INSERT INTO customers VALUES ('C004', 'Sneha Iyer', 'sneha@gmail.com', 'Chennai');
INSERT INTO customers VALUES ('C005', 'Vikram Singh', 'vikram@gmail.com', 'Mumbai');

INSERT INTO products VALUES ('P004', 'Notebook', 'Stationery', 120.00);
INSERT INTO products VALUES ('P007', 'Pen Set', 'Stationery', 250.00);
INSERT INTO products VALUES ('P001', 'Laptop', 'Electronics', 55000.00);
INSERT INTO products VALUES ('P002', 'Mouse', 'Electronics', 800.00);
INSERT INTO products VALUES ('P003', 'Desk Chair', 'Furniture', 8500.00);

INSERT INTO sales_reps VALUES ('SR01', 'Deepak Joshi', 'deepak@corp.com', 'Mumbai HQ, Nariman Pt, Mumbai - 400021');
INSERT INTO sales_reps VALUES ('SR02', 'Anita Desai', 'anita@corp.com', 'Delhi Office, Connaught Place, New Delhi - 110001');
INSERT INTO sales_reps VALUES ('SR03', 'Ravi Kumar', 'ravi@corp.com', 'South Zone, MG Road, Bangalore - 560001');

INSERT INTO orders VALUES ('ORD1027', 'C002', 'P004', 'SR02', 4, '2023-11-02');
INSERT INTO orders VALUES ('ORD1114', 'C001', 'P007', 'SR01', 2, '2023-08-06');
INSERT INTO orders VALUES ('ORD1153', 'C006', 'P007', 'SR01', 3, '2023-02-14');
INSERT INTO orders VALUES ('ORD1002', 'C002', 'P005', 'SR02', 1, '2023-01-17');
INSERT INTO orders VALUES ('ORD1118', 'C006', 'P007', 'SR02', 5, '2023-11-10');