-- Data Loading --

---- Table Creation ----

-- 1. customers.csv
CREATE TABLE customers (
    customer_id      UUID PRIMARY KEY,
    region           VARCHAR(20) NOT NULL,
    customer_join_date DATE NOT NULL
);

-- 2. products.csv
CREATE TABLE products (
    product_id       INTEGER PRIMARY KEY,
    product_name     VARCHAR(100) NOT NULL,
    product_category VARCHAR(50) NOT NULL,
    price            NUMERIC(10,2) NOT NULL,
    base_cost        NUMERIC(10,2) NOT NULL
);

-- 3. Orders_2023.csv
CREATE TABLE orders_2023 (
    order_id     UUID PRIMARY KEY,
    customer_id  UUID REFERENCES customers(customer_id),        
    product_id   INTEGER NOT NULL REFERENCES products(product_id),
    order_date   DATE NOT NULL,
    quantity     INTEGER NOT NULL,
    revenue      NUMERIC(10,2),                                   
    cogs         NUMERIC(10,2) NOT NULL,
    source_file  VARCHAR(50) NOT NULL
);

-- 4. Orders_2024.csv
CREATE TABLE orders_2024 (
    order_id     UUID PRIMARY KEY,
    customer_id  UUID REFERENCES customers(customer_id),        
    product_id   INTEGER NOT NULL REFERENCES products(product_id),
    order_date   DATE NOT NULL,
    quantity     INTEGER NOT NULL,
    revenue      NUMERIC(10,2),                                   
    cogs         NUMERIC(10,2) NOT NULL,
    source_file  VARCHAR(50) NOT NULL
);

-- 5. Orders_2025.csv
CREATE TABLE orders_2025 (
    order_id     UUID PRIMARY KEY,
    customer_id  UUID REFERENCES customers(customer_id),        
    product_id   INTEGER NOT NULL REFERENCES products(product_id),
    order_date   DATE NOT NULL,
    quantity     INTEGER NOT NULL,
    revenue      NUMERIC(10,2),                                   
    cogs         NUMERIC(10,2) NOT NULL,
    source_file  VARCHAR(50) NOT NULL
);

