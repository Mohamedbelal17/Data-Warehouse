--create the fact table 

create view gold_fact_sales as 
select 
dc.cstomer_key,
dp.product_key,
sd.sls_ord_num as order_number ,
sd.sls_sales as total_sales ,
sd.sls_quantity as quantity ,
sd.sls_price as price ,
sd.sls_order_dt as order_date ,
sd.sls_ship_dt as ship_date ,
sd.sls_due_dt as due_date
from Silver.crm_sales_details sd
 join dbo.gold_dim_customer dc on sd.sls_cust_id=dc.customer_id
 join dbo.gold_dim_product dp on sd.sls_prd_key = dp.product_number


