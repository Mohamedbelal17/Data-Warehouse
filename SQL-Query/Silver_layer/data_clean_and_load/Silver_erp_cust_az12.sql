---Cleaning the data 

select 
SUBSTRING(c_id , 4,len(c_id)) as c_id 
      ,
	  (case
	  when b_date > getdate()  then null 
	  else b_date 
	  end) as b_date
      ,
	  (case 
when upper(gen)='F' or upper(gen)='Female' then 'Female'
when upper(gen)='M' or upper(gen)='Male' then 'Male'
else 'n/a'
end 
)as gen
	  from Bronze.cust_az12

--insert the cleaning the data
insert into Silver.erp_cust_az12([c_id]
      ,[b_date]
      ,[gen])
select 
SUBSTRING(c_id , 4,len(c_id)) as c_id 
      ,
	  (case
	  when b_date > getdate()  then null 
	  else b_date 
	  end) as b_date
      ,
	  (case 
when upper(gen)='F' or upper(gen)='Female' then 'Female'
when upper(gen)='M' or upper(gen)='Male' then 'Male'
else 'n/a'
end 
)as gen
	  from Bronze.cust_az12