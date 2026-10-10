SELECT *
FROM {{ ref('int_order_details') }}
WHERE order_amount < 0