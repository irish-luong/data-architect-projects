DROP TABLE IF EXISTS UDACITYEXERCISE.PUBLIC.FACT_TABLE;


CREATE TABLE IF NOT EXISTS UDACITYEXERCISE.PUBLIC.FACT_TABLE(
    business_id VARCHAR(255),
    customer_id VARCHAR(255),
    date DATE,
    constraint fact_table_pkey PRIMARY KEY (business_id, customer_id, date)
);

INSERT INTO UDACITYEXERCISE.PUBLIC.FACT_TABLE
SELECT * FROM (
    SELECT 
        DISTINCT BUSINESS_ID, CUSTOMER_ID, DATE
    FROM UDACITYEXERCISE.ODS.REVIEW 
    UNION
    SELECT 
        DISTINCT BUSINESS_ID, CUSTOMER_ID, DATE
    FROM UDACITYEXERCISE.ODS.TIPS 
) a
ORDER BY 1, 2;


SELECT * FROM UDACITYEXERCISE.PUBLIC.FACT_TABLE LIMIT 1;

DESCRIBE TABLE UDACITYEXERCISE.PUBLIC.FACT_TABLE;