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

SELECT * FROM bronze.crm_cust_info;