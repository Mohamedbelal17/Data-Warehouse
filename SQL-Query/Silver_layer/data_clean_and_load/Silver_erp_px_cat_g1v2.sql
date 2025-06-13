---in px_cat_g1v2 talbe the data is cleaning so we will insert the data only 

insert into Silver.erp_px_cat_g1v2 ( [id]
      ,[cat]
      ,[subcat]
      ,[maintenance])
	  select * from Bronze.px_cat_g1v2