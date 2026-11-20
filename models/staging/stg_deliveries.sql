select
    order_id,
    store_id,
    order_ts,
    promised_delivery_minutes,
    actual_delivery_minutes,
    delivered_within_sla
from {{ source('raw', 'deliveries_raw') }}