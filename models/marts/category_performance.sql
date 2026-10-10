SELECT
    category,
    SUM(total_quantity_sold) AS total_quantity_sold,
    SUM(total_orders) AS total_orders,
    SUM(total_sales) AS total_sales
FROM {{ ref('product_performance') }}
GROUP BY
    category