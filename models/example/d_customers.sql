{{
  config(
        materialized='incremental',
        incremental_strategy='merge',
        merge_update_columns = ['deduplicated_customer_id', 'deduplicated_customer_flag']
  )
}}

with d_customers as (
    Select distinct c.hcust_hash as customer_id,
    c.hcust_hash as deduplicated_customer_id,
    case when a.type_of_duplicate is null then 'Y' end as deduplicated_customer_flag 
    from {{ ref('s_cust_duplicate_check') }} a
    join {{ ref('l_cust_bill_addresses') }} b on b.lcustbadd_hash = a.lcustbadd_hash
    join {{ ref('h_customers') }} c on c.hcust_hash = b.hcust_hash
)
select * from d_customers