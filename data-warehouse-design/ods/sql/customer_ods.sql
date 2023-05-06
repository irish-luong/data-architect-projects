---------------------- CUSTOMER ----------------------
SELECT * FROM UDACITYEXERCISE.STAGING.CUSTOMER LIMIT 100;

DROP TABLE UDACITYEXERCISE.ODS.CUSTOMER;

CREATE TABLE IF NOT EXISTS UDACITYEXERCISE.ODS.CUSTOMER(
    customer_id VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255),
    yelping_since TIMESTAMP,
    average_stars DOUBLE,
    compliment_cool INT,
    compliment_cute INT,
    compliment_funny INT,
    compliment_hot INT,
    compliment_list INT,
    compliment_more INT,
    compliment_note INT,
    compliment_photos INT,
    compliment_plain INT,
    compliment_profile INT,
    compliment_writer INT,
    cool INT,
    elite INT,
    fans INT,
    funny INT,
    review_count INT,
    useful INT
    );


INSERT INTO UDACITYEXERCISE.ODS.CUSTOMER
SELECT
    TRIM(json_value:user_id) AS customer_id,
    json_value:name AS name,
    TRY_TO_TIMESTAMP(json_value:yelping_since::TEXT) AS yelping_since,
    TRY_TO_DOUBLE(json_value:average_stars::TEXT) AS average_stars,
    TRY_TO_NUMBER(json_value:compliment_cool::TEXT) AS compliment_cool,
    TRY_TO_NUMBER(json_value:compliment_cute::TEXT) AS compliment_cute,
    TRY_TO_NUMBER(json_value:compliment_funny::TEXT) AS compliment_funny,
    TRY_TO_NUMBER(json_value:compliment_hot::TEXT) AS compliment_hot,
    TRY_TO_NUMBER(json_value:compliment_list::TEXT) AS compliment_list,
    TRY_TO_NUMBER(json_value:compliment_more::TEXT) AS compliment_more,
    TRY_TO_NUMBER(json_value:compliment_note::TEXT) AS compliment_note,
    TRY_TO_NUMBER(json_value:compliment_photos::TEXT) AS compliment_photos,
    TRY_TO_NUMBER(json_value:compliment_plain::TEXT) AS compliment_plain,
    TRY_TO_NUMBER(json_value:compliment_profile::TEXT) AS compliment_profile,
    TRY_TO_NUMBER(json_value:compliment_writer::TEXT) AS compliment_writer,
    TRY_TO_NUMBER(json_value:cool::TEXT) AS cool,
    TRY_TO_NUMBER(json_value:elite::TEXT) AS elite,
    TRY_TO_NUMBER(json_value:fans::TEXT) AS fans,
    TRY_TO_NUMBER(json_value:funny::TEXT) AS funny,
    TRY_TO_NUMBER(json_value:review_count::TEXT) AS review_count,
    TRY_TO_NUMBER(json_value:useful::TEXT) AS useful
FROM UDACITYEXERCISE.STAGING.CUSTOMER;


---------------------- CUSTOMER ----------------------

DROP TABLE IF EXISTS UDACITYEXERCISE.ODS.CUSTOMER_FRIEND;

CREATE TABLE IF NOT EXISTS UDACITYEXERCISE.ODS.CUSTOMER_FRIEND(
    customer_id VARCHAR(255) NOT NULL REFERENCES UDACITYEXERCISE.ODS.CUSTOMER(customer_id),
    friend_id VARCHAR(255) NOT NULL
    );

INSERT INTO UDACITYEXERCISE.ODS.CUSTOMER_FRIEND
SELECT
    TRIM(origin.json_value:user_id) AS customer_id,
    TRIM(friend.value) AS friend_id
FROM UDACITYEXERCISE.STAGING.CUSTOMER origin,
    LATERAL FLATTEN(input => SPLIT(json_value:friends, ','), mode => 'array') friend;

------------------------ Verify ------------------------
SELECT * FROM UDACITYEXERCISE.ODS.CUSTOMER LIMIT 100;

SELECT * FROM UDACITYEXERCISE.ODS.CUSTOMER_FRIEND LIMIT 100