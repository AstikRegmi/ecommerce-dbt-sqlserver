SELECT
    product_id,
    product_name,
    category,
    price
FROM {{ source('ecommerce', 'raw_products') }}