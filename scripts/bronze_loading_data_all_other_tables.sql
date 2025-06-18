CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	-- Making the table empty before full load
	TRUNCATE TABLE bronze.crm_cust_info;
	-- BULK INSERT (AS A WHOLE) 
	BULK INSERT bronze.crm_cust_info
	-- Full path to the file with the exact name
	FROM 'C:\Users\Khoi Nguyen\Documents\GitHub\sql-data-warehouse-project\datasets\sources.crm\cust_info.csv'
	-- How can handle the file 
	WITH (
		FIRSTROW = 2, -- First row from the 2nd row, the real 1st row contains headers
		FIELDTERMINATOR = ',', -- Split data by the seperator
		TABLOCK -- Lock the whole table while loading the data into
	);

	TRUNCATE TABLE bronze.crm_prd_info;
	BULK INSERT bronze.crm_prd_info
	FROM 'C:\Users\Khoi Nguyen\Documents\GitHub\sql-data-warehouse-project\datasets\sources.crm\prd_info.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',', 
		TABLOCK 
	);

	TRUNCATE TABLE bronze.crm_sales_details;
	BULK INSERT bronze.crm_sales_details
	FROM 'C:\Users\Khoi Nguyen\Documents\GitHub\sql-data-warehouse-project\datasets\sources.crm\sales_details.csv'
	WITH (
		FIRSTROW = 2, 
		FIELDTERMINATOR = ',', 
		TABLOCK 
	);

	TRUNCATE TABLE bronze.erp_cust_az12;
	BULK INSERT bronze.erp_cust_az12
	FROM 'C:\Users\Khoi Nguyen\Documents\GitHub\sql-data-warehouse-project\datasets\sources.erp\cust_az12.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK 
	);

	TRUNCATE TABLE bronze.erp_loc_a101;
	BULK INSERT bronze.erp_loc_a101
	FROM 'C:\Users\Khoi Nguyen\Documents\GitHub\sql-data-warehouse-project\datasets\sources.erp\loc_a101.csv'
	WITH (
		FIRSTROW = 2, 
		FIELDTERMINATOR = ',', 
		TABLOCK 
	);

	TRUNCATE TABLE bronze.erp_px_cat_g1v2;
	BULK INSERT bronze.erp_px_cat_g1v2
	FROM 'C:\Users\Khoi Nguyen\Documents\GitHub\sql-data-warehouse-project\datasets\sources.erp\px_cat_g1v2.csv'
	WITH (
		FIRSTROW = 2, 
		FIELDTERMINATOR = ',', 
		TABLOCK 
	);
END