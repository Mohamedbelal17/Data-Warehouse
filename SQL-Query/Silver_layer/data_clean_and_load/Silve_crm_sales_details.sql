--recreate the silver table for the cleaning data
DROP TABLE IF EXISTS Silver.crm_sales_details;

create table Silver.crm_sales_details(
sls_ord_num varchar(50),
sls_prd_key varchar(50),
sls_cust_id int ,
sls_order_dt date ,
sls_ship_dt date ,
sls_due_dt date ,
sls_sales int ,
sls_quantity int ,
sls_price int )

----insert the cleaning data
insert into Silver.crm_sales_details([sls_ord_num]
      ,[sls_prd_key]
      ,[sls_cust_id]
      ,[sls_order_dt]
      ,[sls_ship_dt]
      ,[sls_due_dt]
      ,[sls_sales]
      ,[sls_quantity]
      ,[sls_price])
select [sls_ord_num]
      ,[sls_prd_key]
      ,[sls_cust_id],
	  (case 
when len(sls_order_dt ) !=8 or sls_order_dt is null then null
else cast(cast(sls_order_dt as varchar(50)) as date)
end) sls_order_dt
      ,  (case 
when len(sls_ship_dt ) !=8 or sls_ship_dt is null then null
else cast(cast(sls_ship_dt as varchar(50)) as date)
end) sls_ship_dt
      ,(case 
when len(sls_due_dt ) !=8 or sls_due_dt is null then null
else cast(cast(sls_due_dt as varchar(50)) as date)
end) sls_due_dt
     ,
	  (
case
when sls_sales is null or sls_sales <= 0 or sls_sales != sls_price * sls_quantity
then abs(sls_price) * sls_quantity
else sls_sales
end
) as sls_sales
      ,[sls_quantity]
   ,
	    (
case
when sls_price is null or sls_price <= 0 then sls_sales / nullif(sls_quantity,0)
else sls_price
end
) as sls_price
	  from Bronze.sales_details