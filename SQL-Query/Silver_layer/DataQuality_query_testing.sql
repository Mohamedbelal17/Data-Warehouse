----Check the Data Quality 
select * from Bronze.loc_a101 

select c_id , count(*) from Bronze.loc_a101
group by c_id
having count(*) > 1 or c_id is null


select * ,SUBSTRING(c_id , 9,len(c_id)) as c_id from Bronze.cust_az12
---Check the whiteSpace

select * from Bronze.loc_a101
where trim(cntry) != cntry --or trim(cst_lastname) != cst_lastname

----Check the consistency of values

select distinct cntry from Bronze.loc_a101


---Check the number Quality by check the negative numbers and null

select * from Bronze.sales_details
where sls_price < 0 or sls_price is null

---Check the Date Quality
select * from Bronze.sales_details 

select * from Bronze.cust_az12
where b_date > '2030-10-12'

select * from Bronze.sales_details
where len(sls_order_dt ) !=8

select * from Bronze.sales_details
where len(sls_order_dt ) !=8


/*
select * from Bronze.prd_info
where prd_start_dt > prd_end_dt

SELECT *, 
       DATEADD(DAY, -1, LEAD(prd_start_dt) OVER (PARTITION BY prd_key ORDER BY prd_start_dt)) AS prd_end_calc
FROM Bronze.prd_info
WHERE prd_start_dt > prd_end_dt;
*/
