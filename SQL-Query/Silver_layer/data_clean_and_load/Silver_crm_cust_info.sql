--Data Quality for cust_info table]


select [cst_id]
      ,[cst_key],
	   trim(cst_firstname)as cst_firstname,
	   trim(cst_lastname) as cst_lastname
      ,(case
	  when Upper(cst_marital_status)='M' then 'Married'
	  when upper(cst_marital_status)='S' then 'Single' 
	  else 'n/a' 
	  end) as cst_marital_status,
	  (case
	  when Upper(cst_gndr)='F' then 'Female'
	  when upper(cst_gndr)='M' then 'Male' 
	  else 'n/a' 
	  end) as cst_gndr
      ,[cst_create_date] from
(
select * , row_number() over (partition by cst_id order by cst_create_date desc) as f_rank 
from Bronze.cust_info
where cst_id is not null) as d
where f_rank =1

---Insert into Silver table
insert into Silver.crm_cust_info([cst_id]
      ,[cst_key]
      ,[cst_firstname]
      ,[cst_lastname]
      ,[cst_marital_status]
      ,[cst_gndr]
      ,[cst_create_date]) 
select [cst_id]
      ,[cst_key],
	   trim(cst_firstname)as cst_firstname,
	   trim(cst_lastname) as cst_lastname
      ,(case
	  when Upper(cst_marital_status)='M' then 'Married'
	  when upper(cst_marital_status)='S' then 'Single' 
	  else 'n/a' 
	  end) as cst_marital_status,
	  (case
	  when Upper(cst_gndr)='F' then 'Female'
	  when upper(cst_gndr)='M' then 'Male' 
	  else 'n/a' 
	  end) as cst_gndr
      ,[cst_create_date] from
(
select * , row_number() over (partition by cst_id order by cst_create_date desc) as f_rank 
from Bronze.cust_info
where cst_id is not null) as d
where f_rank =1

