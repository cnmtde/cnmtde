with h_customers as(
    select *
    from `gluon-mytoys-sandbox-d.cn_dbt_src.h_customers`
)
select * from h_customers