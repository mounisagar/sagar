{{ config(materialized='incremental') }}
with order as 
(
    select * from {{ref('stg_orders')}} 
    {%if is_incremental()%}
     where order_data>= (select max(order_date)from {this})
     {%endif%%}
    )
select * from  order_data