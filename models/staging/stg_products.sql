select
    base_price_ngn,
    category,
    product_id,
    product_name
from {{ source('raw', 'products_raw') }}