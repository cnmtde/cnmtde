{{
  config(
    materialized='table'
  )
}}

with tmp_duplicate_check as (
    select distinct 
    a.lcustbadd_hash,
    a.lcustbadd_hash as lcustbadd_hash_master,
    'New Customer' as duplicate_check_result,
    null as type_of_duplicate,
    current_datetime() as load_dts,
    '31.12.9999 00:00:00'  load_dts_end
    from `gluon-mytoys-sandbox-d.cn_dbt_src.rdv_l_cust_bill_adr` a
    join `gluon-mytoys-sandbox-d.cn_dbt_src.rdv_sl_order_headers` b on a.happsaddr_hash = b.HADDRINV_HASH
)
select * from tmp_duplicate_check