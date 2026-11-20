select
    store_id,
    store_name,
    city,
    opening_hours,
    delivery_sla_minutes
from {{ source('raw', 'stores_raw') }}