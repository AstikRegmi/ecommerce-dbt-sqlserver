
{{
    config(
        materialized='incremental',
        unique_key='order_id'
    )
}}

SELECT *
FROM {{ ref('int_order_details') }}

{% if is_incremental() %}

WHERE order_id > (
    SELECT COALESCE(MAX(order_id), 0)
    FROM {{ this }}
)

{% endif %}