---------------------- CUSTOMER ----------------------
SELECT * FROM UDACITYEXERCISE.STAGING.CUSTOMER LIMIT 100;

DROP TABLE UDACITYEXERCISE.PUBLIC.DIM_CUSTOMER;

CREATE TABLE IF NOT EXISTS UDACITYEXERCISE.PUBLIC.DIM_CUSTOMER(
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


INSERT INTO UDACITYEXERCISE.PUBLIC.DIM_CUSTOMER
SELECT
    customer_id,
    name,
    yelping_since,
    average_stars,
    compliment_cool,
    compliment_cute,
    compliment_funny,
    compliment_hot,
    compliment_list,
    compliment_more,
    compliment_note,
    compliment_photos,
    compliment_plain,
    compliment_profile,
    compliment_writer,
    cool,
    elite,
    fans,
    funny,
    review_count,
    useful
FROM UDACITYEXERCISE.ODS.CUSTOMER;

DROP TABLE IF EXISTS UDACITYEXERCISE.PUBLIC.DIM_CUSTOMER_FRIEND;

CREATE TABLE IF NOT EXISTS UDACITYEXERCISE.PUBLIC.DIM_CUSTOMER_FRIEND(
    customer_id VARCHAR(255) REFERENCES UDACITYEXERCISE.PUBLIC.DIM_CUSTOMER(customer_id),
    friend_id VARCHAR(255) REFERENCES UDACITYEXERCISE.PUBLIC.DIM_CUSTOMER(customer_id)
    );

INSERT INTO UDACITYEXERCISE.PUBLIC.DIM_CUSTOMER_FRIEND
SELECT
    customer_id,
    friend_id
FROM UDACITYEXERCISE.ODS.CUSTOMER_FRIEND;

------------------------ Verify ------------------------
SELECT * FROM UDACITYEXERCISE.PUBLIC.DIM_CUSTOMER LIMIT 100;

SELECT * FROM UDACITYEXERCISE.PUBLIC.DIM_CUSTOMER_FRIEND LIMIT 100