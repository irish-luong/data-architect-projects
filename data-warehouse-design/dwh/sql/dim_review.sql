---------------------- REVIEW ----------------------

DROP TABLE IF EXISTS UDACITYEXERCISE.PUBLIC.DIM_REVIEW;

CREATE TABLE IF NOT EXISTS UDACITYEXERCISE.PUBLIC.DIM_REVIEW(
    review_id VARCHAR(255) PRIMARY KEY,
    business_id VARCHAR(255),
    customer_id VARCHAR(255),
    text TEXT,
    cool INT,
    date DATE,
    timestamp TIMESTAMP,
    funny INT,
    useful INT,
    stars INT
    );

INSERT INTO UDACITYEXERCISE.PUBLIC.DIM_REVIEW
SELECT
    review_id,
    business_id,
    customer_id,
    text,
    cool,
    date,
    timestamp,
    funny,
    useful,
    stars
FROM UDACITYEXERCISE.ODS.REVIEW;

SELECT *  FROM UDACITYEXERCISE.PUBLIC.DIM_REVIEW LIMIT 100;