---------------------- REVIEW ----------------------
SELECT *  FROM UDACITYEXERCISE.STAGING.REVIEW LIMIT 100;

DROP TABLE IF EXISTS UDACITYEXERCISE.ODS.REVIEW;

CREATE TABLE IF NOT EXISTS UDACITYEXERCISE.ODS.REVIEW(
    review_id VARCHAR(255) PRIMARY KEY,
    business_id VARCHAR(255) REFERENCES UDACITYEXERCISE.ODS.BUSINESS(business_id),
    customer_id VARCHAR(255) REFERENCES UDACITYEXERCISE.ODS.CUSTOMER(customer_id),
    text TEXT,
    cool INT,
    date DATE,
    timestamp TIMESTAMP,
    funny INT,
    useful INT,
    stars INT
    );

INSERT INTO UDACITYEXERCISE.ODS.REVIEW
SELECT
    TRIM(json_value:review_id) AS review_id,
    TRIM(json_value:business_id) AS business_id,
    TRIM(json_value:user_id) AS customer_id,
    TRIM(json_value:"text") AS text,
    TRY_TO_NUMBER(json_value:cool::TEXT) AS cool,
    TRY_TO_DATE(json_value:date::TEXT) AS date,
    TRY_TO_TIMESTAMP(json_value:date::TEXT) AS timestamp,
    TRY_TO_NUMBER(json_value:funny::TEXT) AS funny,
    TRY_TO_NUMBER(json_value:useful::TEXT) AS useful,
    TRY_TO_NUMBER(json_value:stars::TEXT) AS stars
FROM UDACITYEXERCISE.STAGING.REVIEW;

SELECT *  FROM UDACITYEXERCISE.ODS.REVIEW LIMIT 100;