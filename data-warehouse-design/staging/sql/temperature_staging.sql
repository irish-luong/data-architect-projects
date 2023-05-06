

DROP TABLE IF EXISTS UDACITYEXERCISE.STAGING.TEMPERATURE;

-- date,min,max,normal_min,normal_max
-- 19480906,105.0,61.0,97.7,74.9
CREATE TABLE IF NOT EXISTS UDACITYEXERCISE.STAGING.TEMPERATURE(
    date bigint not null,
    min double,
    max double,
    normal_min double,
    normal_max double
    );

-- Backup to remove data for re-running
-- REMOVE @UDACITYEXERCISE.STAGING.JSON_STAGE/yelp_academic_dataset_business.json.gz

-- Put local file to SnowFlake Stage
PUT file://Users/x/Downloads/Udacity/climate/usw00023169-temperature-degreef.csv @UDACITYEXERCISE.STAGING.CSV_STAGE auto_compress=true;

-- Verify the input
LIST @UDACITYEXERCISE.STAGING.CSV_STAGE


-- Copy file from Blob storage to Staging table
COPY INTO UDACITYEXERCISE.STAGING.TEMPERATURE FROM @UDACITYEXERCISE.STAGING.CSV_STAGE/usw00023169-temperature-degreef.csv.gz file_format=csvformat ON_ERROR = 'CONTINUE' PURGE = TRUE;


SELECT * FROM UDACITYEXERCISE.STAGING.TEMPERATURE LIMIT 10;




