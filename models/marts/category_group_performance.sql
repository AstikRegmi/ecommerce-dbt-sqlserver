SELECT
    m.category_group,
    SUM(p.total_quantity_sold) AS total_quantity_sold,
    SUM(p.total_orders) AS total_orders,
    SUM(p.total_sales) AS total_sales

FROM {{ ref('product_performance') }} p

LEFT JOIN {{ ref('category_mapping') }} m
    ON p.category = m.category

GROUP BY
    m.category_group