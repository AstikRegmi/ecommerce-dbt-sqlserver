SELECT
    customer_id,
    customer_name,
    city,
    SUM(order_amount) AS total_spent,
    COUNT(order_id) AS total_orders

FROM {{ ref('int_order_details') }}

GROUP BY
    customer_id,
    customer_name,
    city