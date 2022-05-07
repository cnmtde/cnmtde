insert into `gluon-mytoys-sandbox-d.cn_dbt_src.bdv_s_cust_duplicate_check` (lcustbadd_hash,
lcustbadd_hash_master,
duplicate_check_result,
load_dts)
(select lcustbadd_hash,
lcustbadd_hash_master,
duplicate_check_result,
load_dts
from {{ref('tmp_s_cust_duplicate_check')}})