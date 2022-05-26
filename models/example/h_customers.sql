{{
  config(
    materialized='table'
  )
}}

with h_customers as(
    select customer_id as hcust_hash
    from `gluon-mytoys-sandbox-d.cn_dbt_src.d_customers`
)
select * from h_customers