--cleaning the data 

select 
replace(c_id , '-','') as c_id  
      ,(case
	  when trim(cntry) in ('US','USA') then trim('United States')
	  when trim(cntry)='DE' then 'Germany'
	  when cntry is null or trim(cntry)='' then 'n/a'
	  else trim(cntry)
	  end
	  )as cntry from Bronze.loc_a101

---insert the cleaning data into silver talbe

insert into Silver.erp_loc_a101( [c_id]
      ,[cntry])select 
replace(c_id , '-','') as c_id  
      ,(case
	  when trim(cntry) in ('US','USA') then trim('United States')
	  when trim(cntry)='DE' then 'Germany'
	  when cntry is null or trim(cntry)='' then 'n/a'
	  else trim(cntry)
	  end
	  )as cntry from Bronze.loc_a101


