{{ config(materialized='table') }}
with customers_data as 
(
    select * from {{source('raw','customer')}} 
    )
select * from  customers_data