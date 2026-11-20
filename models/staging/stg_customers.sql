select
    customer_id,
    signup_date,
    city,
    phone,
    is_business
from {{ source('raw', 'customers_raw') }}