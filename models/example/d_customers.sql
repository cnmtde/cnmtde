{{
  config(
    materialized='table'
  )
}}

with d_customers as (
    Select distinct *
    from {{ ref('s_cust_duplicate_check') }} a
    join {{ ref('l_cust_bill_addresses') }} b on b.lcustbadd_hash = a.lcustbadd_hash
    join {{ ref('h_customers') }} c on c.hcust_hash = b.hcust_hash
)
select * from d_customers