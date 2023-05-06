---------------------- TIPS ----------------------
DROP TABLE IF EXISTS UDACITYEXERCISE.PUBLIC.DIM_TIPS;

CREATE TABLE IF NOT EXISTS UDACITYEXERCISE.PUBLIC.DIM_TIPS(
    business_id VARCHAR(255),
    customer_id VARCHAR(255),
    text TEXT,
    compliment_count INT,
    date DATE,
    timestamp TIMESTAMP
    );

INSERT INTO UDACITYEXERCISE.PUBLIC.DIM_TIPS
SELECT 
    business_id,
    customer_id,
    text,
    compliment_count,
    date,
    timestamp
FROM UDACITYEXERCISE.ODS.TIPS;


SELECT * FROM UDACITYEXERCISE.PUBLIC.DIM_TIPS LIMIT 100;