DROP TABLE IF EXISTS Bronze.cust_info;

create table Bronze.cust_info (
cst_id int ,
cst_key varchar(50),
cst_firstname varchar(50),
cst_lastname varchar(50),
cst_marital_status varchar(50),
cst_gndr varchar(50) ,
cst_create_date varchar(50) )


DROP TABLE IF EXISTS Bronze.prd_info;

create table Bronze.prd_info (
prd_id int ,
prd_key varchar(50),
prd_nm varchar(50),
prd_cost int ,
prd_line varchar(50) ,
prd_start_dt date ,
prd_end_dt date
)


DROP TABLE IF EXISTS Bronze.sales_details;

create table Bronze.sales_details(
sls_ord_num varchar(50),
sls_prd_key varchar(50),
sls_cust_id int ,
sls_order_dt int ,
sls_ship_dt int ,
sls_due_dt int ,
sls_sales int ,
sls_quantity int ,
sls_price int )



-----------

DROP TABLE IF EXISTS Bronze.cust_az12;

CREATE TABLE Bronze.cust_az12 (
    c_id VARCHAR(50),
    b_date date,
    gen VARCHAR(10)
);


DROP TABLE IF EXISTS Bronze.loc_a101;

CREATE TABLE Bronze.loc_a101 (
    c_id VARCHAR(50),
    cntry VARCHAR(50)
);


DROP TABLE IF EXISTS Bronze.px_cat_g1v2;

CREATE TABLE Bronze.px_cat_g1v2 (
    id VARCHAR(50),
    cat VARCHAR(50),
    subcat VARCHAR(50),
    maintenance VARCHAR(50)
);
