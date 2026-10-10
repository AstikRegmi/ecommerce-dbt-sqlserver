{#
SELECT
    product_id,
    product_name,
    category,
    total_sales,
    {{ classify_sales('total_sales', 10000, 50000) }} AS sales_category

FROM {{ ref('product_performance') }} #}


SELECT
    product_id,
    product_name,
    category,
    total_sales,
    {{ classify_sales('total_sales', 10000, 50000,false) }} AS sales_category

FROM {{ ref('product_performance') }}
