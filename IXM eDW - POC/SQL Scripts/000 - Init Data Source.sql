CREATE DATABASE edwcore_external COLLATE Latin1_General_100_BIN2_UTF8;
GO;


USE edwcore_external;
GO;


CREATE SCHEMA aquarius_refined_landing;
GO;
CREATE SCHEMA aquarius_refined_staging;
GO;
CREATE SCHEMA aquarius_ldcustom_landing;
GO;
CREATE SCHEMA aquarius_ldcustom_staging;
GO;
CREATE SCHEMA core_vault;
GO;
CREATE SCHEMA core_vault_enriched;
GO;

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'mSkKrXHPMvwvwdLxvKVZUijkJTdSAyuZzat3qM/fL8nSEdUu+yqJ4AQ3uWECmVnJ3QFTSJw03z1a+AStk9sCJw==';


IF EXISTS ( SELECT *
              FROM sys.credentials
             WHERE NAME = 'DefaultLakeStorageCredentials' )
    DROP CREDENTIAL DefaultLakeStorageCredentials;

CREATE DATABASE SCOPED CREDENTIAL [DefaultLakeStorageCredentials]
  WITH IDENTITY = 'Managed Identity';


IF EXISTS ( SELECT *
              FROM sys.external_data_sources
             WHERE NAME = 'DefaultLakeDataSource' )
    DROP EXTERNAL DATA SOURCE DefaultLakeDataSource;

CREATE EXTERNAL DATA SOURCE [DefaultLakeDataSource]
  WITH ( LOCATION = 'https://datalakexfqecgy.dfs.core.windows.net/files/synapse/workspaces/synapse-all-labs-ws/warehouse',
         CREDENTIAL = [DefaultLakeStorageCredentials] );


IF EXISTS ( SELECT *
              FROM sys.external_data_sources
             WHERE NAME = 'ParquetFileFormat' )
    DROP EXTERNAL FILE FORMAT ParquetFileFormat;
CREATE EXTERNAL FILE FORMAT ParquetFileFormat
  WITH ( FORMAT_TYPE = PARQUET );

