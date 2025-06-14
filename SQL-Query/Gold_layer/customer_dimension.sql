---create the dimension for the customers from cust_info, loc_a101 and cust_az12


create view gold_dim_customer as (
select
ROW_NUMBER() over(order by ci.cst_id) as cstomer_key,
ci.cst_id as customer_id ,
ci.cst_key as customer_number,
ci.cst_firstname as first_name ,
ci.cst_lastname as last_name,
ci.cst_marital_status as martial_status ,
case
when ci.cst_gndr != 'n/a'   then ci.cst_gndr
else ca.gen
end as gender ,
ca.b_date as birth_date ,
la.cntry as country ,
ci.cst_create_date as create_date 
from Silver.crm_cust_info ci
join Silver.erp_cust_az12 ca on ca.c_id=ci.cst_key
join Silver.erp_loc_a101 la on la.c_id=ci.cst_key )

--Check the gender so we know the crm data is more accurate than erp

select distinct
ci.cst_gndr , 
ca.gen ,
case
when ci.cst_gndr != 'n/a'   then ci.cst_gndr
else ca.gen
end
from Silver.crm_cust_info ci
join Silver.erp_cust_az12 ca on ca.c_id=cst_key
join Silver.erp_loc_a101 la on la.c_id=cst_key