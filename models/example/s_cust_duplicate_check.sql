{{
  config(
    materialized='table'
  )
}}

with s_cust_duplicate_check as (
    select distinct 
    a.lcustbadd_hash,
    a.lcustbadd_hash as lcustbadd_hash_master,
    'New Customer' as duplicate_check_result,
    null as type_of_duplicate,
    current_datetime() as load_dts,
    '31.12.9999 00:00:00'  load_dts_end
    from `gluon-mytoys-sandbox-d.cn_dbt_src.l_cust_bill_addresses` a
    join `gluon-mytoys-sandbox-d.cn_dbt_src.sl_order_headers` b on a.happsaddr_hash = b.HADDRINV_HASH
)
select * from s_cust_duplicate_check