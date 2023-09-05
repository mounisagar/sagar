{{ config(materialized="incremental",
unique_ID="ID") }}
with order_data as 
(
    select * from {{ref('stg_orders')}} 
    {%if is_incremental()%}
     where order_date>= (select max(order_date) from {{this}})
     {%endif%}
    )
select * from  order_data