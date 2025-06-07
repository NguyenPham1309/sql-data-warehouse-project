/*
===========================================================
Create Database and Schemas
===========================================================
Script purpose:
1. This script creates a new database named 'DataWarehouse' after checking if it already exists.
2. If the database exists, it is dropped and recreated. 
3. Additionally, the script sets up three schemas within the database: 'bronze', 'silver', and 'gold'.

WARNING:
1. Running this script will drop the entire 'DataWarehouse' database if it exists
All data in the database will be permanently delted. Proceed with caution
2. and ensure you have proper backups before running this script. 
*/


USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name ='DataWarehouse')
BEGIN 
	ALTER DATABASE Datawarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

-- Create Database 'DataWarehouse'
CREATE DATABASE DataWarehouse;

USE DataWarehouse; 
GO
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO