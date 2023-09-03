{{ config(materialized='table') }}
with customers_data as 
(
    select * from {{source('raw','customers')}} 
    )
select * from  customers_data