select
    category,
    line_total_ngn,
    order_id,
    product_id,
    product_name,
    qty,
    unit_price_ngn
from {{ source('raw', 'order_items_raw') }}