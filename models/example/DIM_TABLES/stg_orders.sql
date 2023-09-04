{{ config(materialized='table') }}
with order_data as 
(
    select * from {{source('raw','orders')}} 
    )
select * from order_data