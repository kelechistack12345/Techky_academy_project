select
    actual_delivery_minutes,
    channel,
    customer_id,
    delivery_fee_ngn,
    discount_ngn,
    items_count,
    order_id,
    order_ts,
    payment_method,
    promised_delivery_minutes,
    promo_code,
    qty_total,
    store_id,
    subtotal_ngn,
    tax_ngn,
    total_amount_ngn
from {{ source('raw', 'orders_raw') }}