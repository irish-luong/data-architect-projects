-- Create main database
create database if not exists UDACITYEXERCISE;

-- Create STAGING environment
create schema if not exists UDACITYEXERCISE.STAGING;

-- Create ODS environment
create schema if not exists UDACITYEXERCISE.ODS;

-- Create Production environment
create schema if not exists UDACITYEXERCISE.PUBLIC;


-- Login into the correct database
USE DATABASE UDACITYEXERCISE;


-- Create JSON format
create or replace file format jsonformat type='JSON';

-- Create Staging Area for JSON format
create or replace stage UDACITYEXERCISE.STAGING.JSON_STAGE file_format = jsonformat;

-- Create CSV format
create or replace file format csvformat  type='CSV' compression='auto' field_delimiter=',' record_delimiter = '\n' skip_header=1 error_on_column_count_mismatch=true null_if = ('NULL', 'null') empty_field_as_null = true;


-- Create Staging Area for CSV format
create or replace stage UDACITYEXERCISE.STAGING.CSV_STAGE file_format = csvformat;





