with d_customers as (
    Select *
    from {{ ref('s_cust_duplicate_check') }} a
    join {{ ref('l_cust_bill_addresses') }} b on b.lcustbadd_has = a.lcustbadd_has
    join {{ ref('h_customers') }} c on c.hcust_hash = b.hcust_hash
)
select * from d_customers