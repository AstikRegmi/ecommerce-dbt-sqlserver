SELECT
    order_id,
    customer_id,
    product_id,
    order_date,
    quantity,
    CASE
        WHEN quantity > 0 THEN 'Valid'
        ELSE 'Invalid'
    END AS order_status

FROM {{ source('ecommerce', 'raw_orders') }}