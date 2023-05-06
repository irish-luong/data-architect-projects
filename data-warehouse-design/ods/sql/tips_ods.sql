---------------------- TIPS ----------------------
DROP TABLE IF EXISTS UDACITYEXERCISE.ODS.TIPS;

CREATE TABLE IF NOT EXISTS UDACITYEXERCISE.ODS.TIPS(
    business_id VARCHAR(255) REFERENCES UDACITYEXERCISE.ODS.BUSINESS(business_id),
    customer_id VARCHAR(255) REFERENCES UDACITYEXERCISE.ODS.CUSTOMER(customer_id),
    text TEXT,
    compliment_count INT,
    date DATE,
    timestamp TIMESTAMP
    );

INSERT INTO UDACITYEXERCISE.ODS.TIPS
SELECT 
    TRIM(json_value:business_id) AS business_id,
    TRIM(json_value:user_id) AS customer_id,
    TRIM(json_value:text) AS text,
    TO_NUMBER(json_value:compliment_count::TEXT) AS compliment_count,
    TRY_TO_DATE(json_value:date::TEXT) AS date,
    TRY_TO_TIMESTAMP(json_value:date::TEXT) AS timestamp
FROM UDACITYEXERCISE.STAGING.TIPS;


SELECT * FROM UDACITYEXERCISE.ODS.TIPS LIMIT 100;