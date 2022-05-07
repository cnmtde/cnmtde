with d_customers as (
    Select *
    from {{ ref('s_cust_duplicate_check') }} a
    join {{ ref('h_customers') }} c on c.hcust_hash = b.hcust_hash
)
select * from d_customers