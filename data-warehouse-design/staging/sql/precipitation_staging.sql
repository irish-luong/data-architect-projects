

DROP TABLE IF EXISTS UDACITYEXERCISE.STAGING.PRECIPITATION;

-- date,precipitation,precipitation_normal
-- 19480906,0.00,2.87
CREATE TABLE IF NOT EXISTS UDACITYEXERCISE.STAGING.PRECIPITATION(
    date bigint not null,
    precipitation double,
    precipitation_normal double
    );

-- Put local file to SnowFlake Stage
PUT file://Users/x/Downloads/Udacity/climate/usw00023169-las-vegas-mccarran-intl-ap-precipitation-inch.csv @UDACITYEXERCISE.STAGING.CSV_STAGE auto_compress=true;

-- Verify the input
LIST @UDACITYEXERCISE.STAGING.CSV_STAGE


-- Copy file from Blob storage to Staging table
COPY INTO UDACITYEXERCISE.STAGING.PRECIPITATION FROM @UDACITYEXERCISE.STAGING.CSV_STAGE/usw00023169-las-vegas-mccarran-intl-ap-precipitation-inch.csv.gz file_format=csvformat ON_ERROR = 'CONTINUE' PURGE = TRUE;


SELECT * FROM UDACITYEXERCISE.STAGING.PRECIPITATION LIMIT 10;




