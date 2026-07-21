
-- Combining the orders from 2023, 2024, and 2025 into a single dataset for analysis

WITH all_orders AS (
SELECT 
    order_id,
    customer_id,
    product_id,
    order_date,
    quantity,
    revenue,
    cogs
FROM 
    orders_2023

UNION ALL

SELECT 
    order_id,
    customer_id,
    product_id,
    order_date,
    quantity,
    revenue,
    cogs
FROM 
    orders_2024

UNION ALL

SELECT 
    order_id,
    customer_id,
    product_id,
    order_date,
    quantity,
    revenue,
    cogs
FROM
    orders_2025
)

-- building the main dataset queries
SELECT 
    a.order_id,
    a.customer_id,
    c.region,
    a.product_id,
    a.order_date,
    date_trunc('week', a.order_date)::date AS order_week,
    c.customer_join_date,
    a.quantity,
    a.revenue,
        CASE WHEN a.revenue IS NULL THEN p.price * a.quantity 
        ELSE a.revenue 
        END AS cleaned_revenue,
    a.revenue - a.cogs AS profit,
    a.cogs,
    p.product_name,
    p.product_category,
    p.price,
    p.base_cost
FROM all_orders a
LEFT JOIN customers c ON a.customer_id = c.customer_id
LEFT JOIN products p ON a.product_id = p.product_id
-- clean the non-customer ID
WHERE 
    a.customer_id IS NOT NULL
