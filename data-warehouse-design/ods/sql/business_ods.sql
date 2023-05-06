
SELECT * FROM UDACITYEXERCISE.STAGING.BUSINESS LIMIT 1;


---------------------- BUSINESS ----------------------
DROP TABLE IF EXISTS UDACITYEXERCISE.ODS.BUSINESS;

CREATE TABLE IF NOT EXISTS UDACITYEXERCISE.ODS.BUSINESS(
    business_id VARCHAR(255) PRIMARY KEY,
    address VARCHAR(255),
    city VARCHAR(255),
    hours VARIANT,
    is_open BOOLEAN,
    latitude DOUBLE,
    longitude DOUBLE,
    name VARCHAR(255),
    postal_code INT,
    review_count INT,
    stars DOUBLE,
    state VARCHAR(50)
);

INSERT INTO UDACITYEXERCISE.ODS.BUSINESS
SELECT 
    TRIM(json_value:business_id) AS business_id, 
    TRIM(json_value:address) AS address,
    TRIM(json_value:city) AS city,
    json_value:hours::VARIANT AS hours,
    TRY_TO_BOOLEAN(json_value:is_open::TEXT) AS is_open, 
    TRY_TO_DOUBLE(json_value:latitude::TEXT) AS latitude, 
    TRY_TO_DOUBLE(json_value:longitude::TEXT) AS longitude,
    TRIM(json_value:name) AS name,
    TRY_TO_NUMBER(json_value:postal_code::TEXT) AS postal_code,
    TRY_TO_NUMBER(json_value:review_count::TEXT) AS review_count,
    TRY_TO_DOUBLE(json_value:stars::TEXT) AS stars,
    TRIM(json_value:state) AS state
FROM UDACITYEXERCISE.STAGING.BUSINESS
WHERE TRIM(json_value:business_id) IS NOT NULL;


---------------------- BUSINESS_ATTRIBUTES ----------------------

DROP TABLE IF EXISTS UDACITYEXERCISE.ODS.BUSINESS_ATTRIBUTES;

CREATE TABLE IF NOT EXISTS UDACITYEXERCISE.ODS.BUSINESS_ATTRIBUTES(
    business_id VARCHAR(255) REFERENCES UDACITYEXERCISE.ODS.BUSINESS(business_id),
    key VARCHAR(100),
    value TEXT
    );

INSERT INTO UDACITYEXERCISE.ODS.BUSINESS_ATTRIBUTES
SELECT
    TRIM(origin.json_value:business_id) AS business_id,
    attr.key AS key, 
    attr.value AS value
FROM UDACITYEXERCISE.STAGING.BUSINESS origin,
    LATERAL FLATTEN(input => json_value:attributes, mode => 'object') attr
    ;


---------------------- BUSINESS_CATEGRORIES ----------------------

DROP TABLE IF EXISTS UDACITYEXERCISE.ODS.BUSINESS_CATEGRORIES;

CREATE TABLE IF NOT EXISTS UDACITYEXERCISE.ODS.BUSINESS_CATEGRORIES(
    business_id VARCHAR(255) REFERENCES UDACITYEXERCISE.ODS.BUSINESS(business_id),
    index INT,
    value VARCHAR(255)
    );

INSERT INTO UDACITYEXERCISE.ODS.BUSINESS_CATEGRORIES
SELECT  
    origin.json_value:business_id AS business_id,
    category.index AS index,
    TRIM(category.value) AS value
FROM 
    UDACITYEXERCISE.STAGING.BUSINESS origin, 
    LATERAL FLATTEN(input => SPLIT(json_value:categories, ','), mode => 'array') category;
