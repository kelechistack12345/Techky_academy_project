{{ config(
    materialized='view',
    schema='marts'
) }}

select
    b.customer_id,
    sum(a.qty_total) as total_sales
from {{ ref('facts_orders') }} a

left join {{ ref('dim_customers') }} b
    on a.customer_id = b.customer_id

group by
    b.customer_id










