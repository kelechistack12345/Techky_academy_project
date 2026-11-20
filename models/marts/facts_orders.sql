{{config(materalized='view',schema='marts')}}

select
    actual_delivery_minutes,
    channel,
    a.customer_id,
    delivery_fee_ngn,
    discount_ngn,
    items_count,
    order_id,
    order_ts,
    monthname(order_ts) as month_name,
    'Week ' || cast(
    case
        when day(order_ts) <= 7 then 1
        when day(order_ts) <= 14 then 2
        when day(order_ts) <= 21 then 3
        else 4
    end as varchar
) as week_label,
    dayofweekiso(order_ts) as weekday_number,
    dayname(order_ts) as day_name,
    date_part('hour', order_ts) ||'-' || 'hour' as order_hour,
    case
    when promo_code is not null then 'Promo'
    else 'Non-Promo'
end as promo_type,
  case
    when promised_delivery_minutes is null 
        then 'No Promised Delivery Time'
    when promised_delivery_minutes < actual_delivery_minutes 
        then 'Missed SLA Delivery'
    else 'SLA Met'
end as delivery_sla_status,
    payment_method,
    promised_delivery_minutes,
    promo_code,
    qty_total,
    store_id,
    subtotal_ngn,
    tax_ngn,
    total_amount_ngn

from {{ ref('stg_orders') }} a

left join {{ ref('dim_customers') }} b
    on a.customer_id = b.customer_id

/*group by
    b.customer_id*/






