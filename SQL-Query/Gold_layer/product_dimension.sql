--- create view 

create view gold_dim_product as 
select
row_number() over (order by pi.prd_id ) as product_key ,
pi.prd_key as product_number, 
pi.prd_id as product_id ,
pi.cat_id as category_id ,
pc.subcat as subcategory ,
pi.prd_nm as product_name ,
pc.maintenance,
pi.prd_cost as cost ,
pi.prd_line as product_line ,
pi.prd_start_dt as start_date 
from Silver.crm_prd_info pi
join Silver.erp_px_cat_g1v2 pc on pc.id = pi.cat_id
where pi.prd_end_dt is null -- we make this condition to using the current data


