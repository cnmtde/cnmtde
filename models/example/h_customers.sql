{{
  config(
    materialized='table'
  )
}}

with h_customers as(
    select customer_id
    from `gluon-mytoys-sandbox-d.cn_dbt_src.d_customers`
)
select * from h_customers