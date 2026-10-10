SELECT
    product_id,
    product_name,
    category,
    total_sales
FROM {{ ref('product_performance') }}
WHERE total_sales >= {{ var('min_sales') }}