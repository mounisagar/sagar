{{ config(materialized="incremental") }}
with order_data as 
(
    select * from {{ref('stg_orders')}} 
    {%if is_incremental()%}
     where order_date>= (select max(ORDER_DATE) from {{this}})
     {%endif%}
    )
select * from  order_data