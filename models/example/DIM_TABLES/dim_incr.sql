{{ config(materialized='table') }}

with payment_data as 
(
    select * from {{source('raw','payments')}} 
    )
select * from payment_data