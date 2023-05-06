

DROP TABLE IF EXISTS UDACITYEXERCISE.STAGING.REVIEW;

CREATE TABLE UDACITYEXERCISE.STAGING.REVIEW(json_value variant);

-- Backup to remove data for re-running
REMOVE @UDACITYEXERCISE.STAGING.JSON_STAGE/yelp_academic_dataset_review_000.json.gz

-- Put local file to SnowFlake Stage
PUT file://Users/x/Downloads/Udacity/yelp/reviews/yelp_academic_dataset_review_000.json @UDACITYEXERCISE.STAGING.JSON_STAGE auto_compress=true;

-- Verify the input
LIST @UDACITYEXERCISE.STAGING.JSON_STAGE


-- Copy file from Blob storage to Staging table
COPY INTO UDACITYEXERCISE.STAGING.REVIEW FROM @UDACITYEXERCISE.STAGING.JSON_STAGE/yelp_academic_dataset_review_000.json.gz file_format=jsonformat on_error='skip_file';


SELECT * FROM UDACITYEXERCISE.STAGING.REVIEW LIMIT 10;




