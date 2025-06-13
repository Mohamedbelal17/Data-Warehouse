DROP TABLE IF EXISTS Silver.crm_prd_info;

create table Silver.crm_prd_info (
prd_id int ,
prd_key varchar(50),
cat_id varchar(50),
prd_nm varchar(50),
prd_cost int ,
prd_line varchar(50) ,
prd_start_dt date ,
prd_end_dt date
)


---insert in silve crm_prd_info table the cleaning data

insert into Silver.crm_prd_info([prd_id]
      ,[prd_key]
      ,[cat_id]
      ,[prd_nm]
      ,[prd_cost]
      ,[prd_line]
      ,[prd_start_dt]
      ,[prd_end_dt])
select [prd_id],
		SUBSTRING(prd_key,7,len(prd_key)) as prd_key,
      replace(SUBSTRING(prd_key,1,5) ,'-','_')as cat_id
      ,[prd_nm]
      ,(case
	  when prd_cost is null then 0
	  else prd_cost
	  end
	  ) as prd_cost
      ,(
	  case
	  when upper(prd_line)='R' then 'Road'
	  when upper(prd_line)='M' then 'Mountain'
	  when upper(prd_line)='S' then 'Other Sales'
	  when upper(prd_line)='T' then 'Touring'
	  else 'n/a'
	  end
	  ) as prd_line
      ,[prd_start_dt],
	  cast( DATEADD(day,-1,lead(prd_start_dt) over(partition by prd_key order by prd_start_dt))as date) as prd_end_dt 
		from Bronze.prd_info 


