--insert cust_info cvs file 
BEGIN
    TRUNCATE TABLE Bronze.cust_info;
END

BULK INSERT Bronze.cust_info
FROM 'C:\Users\Belal\Desktop\Data_Warejouse Project\datasets\source_crm\cust_info.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

--insert prd_info cvs file 
BEGIN
    TRUNCATE TABLE Bronze.prd_info;
END

BULK INSERT Bronze.prd_info
FROM 'C:\Users\Belal\Desktop\Data_Warejouse Project\datasets\source_crm\prd_info.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

--insert sales_details cvs file 
BEGIN
    TRUNCATE TABLE Bronze.sales_details;
END

BULK INSERT Bronze.sales_details
FROM 'C:\Users\Belal\Desktop\Data_Warejouse Project\datasets\source_crm\sales_details.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

--insert cust_az12 cvs file 
BEGIN
    TRUNCATE TABLE Bronze.cust_az12;
END

BULK INSERT Bronze.cust_az12
FROM 'C:\Users\Belal\Desktop\Data_Warejouse Project\datasets\source_erp\cust_az12.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

--insert loc_a101 cvs file 
BEGIN
    TRUNCATE TABLE Bronze.loc_a101;
END

BULK INSERT Bronze.loc_a101
FROM 'C:\Users\Belal\Desktop\Data_Warejouse Project\datasets\source_erp\loc_a101.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

--insert px_cat_g1v2 cvs file 
BEGIN
    TRUNCATE TABLE Bronze.px_cat_g1v2;
END

BULK INSERT Bronze.px_cat_g1v2
FROM 'C:\Users\Belal\Desktop\Data_Warejouse Project\datasets\source_erp\px_cat_g1v2.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);