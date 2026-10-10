--Which products are selling the most and generating the most revenue?

SELECT
    product_id,
    product_name,
    category,
    SUM(quantity) AS total_quantity_sold,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(order_amount) AS total_sales
FROM {{ ref('int_order_details') }}
GROUP BY
    product_id,
    product_name,
    category