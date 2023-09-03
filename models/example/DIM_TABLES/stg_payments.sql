{{ config(materialized='table') }}
(select * from DBT_DATABASE.PUBLIC.PAYMENTS)