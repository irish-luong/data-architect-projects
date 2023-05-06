

DROP TABLE IF EXISTS UDACITYEXERCISE.STAGING.COVID;

CREATE TABLE UDACITYEXERCISE.STAGING.COVID(json_value variant);

-- Backup to remove data for re-running
-- REMOVE @UDACITYEXERCISE.STAGING.JSON_STAGE/yelp_academic_dataset_business.json.gz

-- Put local file to SnowFlake Stage
PUT file://Users/x/Downloads/Udacity/yelp/yelp_academic_dataset_covid_features.json @UDACITYEXERCISE.STAGING.JSON_STAGE auto_compress=true;

-- Verify the input
LIST @UDACITYEXERCISE.STAGING.JSON_STAGE


-- Copy file from Blob storage to Staging table
COPY INTO UDACITYEXERCISE.STAGING.COVID FROM @UDACITYEXERCISE.STAGING.JSON_STAGE/yelp_academic_dataset_covid_features.json.gz file_format=jsonformat on_error='skip_file';


SELECT * FROM UDACITYEXERCISE.STAGING.COVID LIMIT 10;




