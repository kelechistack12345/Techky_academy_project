{{config(materalized='table',schema='marts')}}

select * 
from {{ref('stg_stores')}}