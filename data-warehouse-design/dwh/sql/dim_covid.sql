---------------------- COVID ----------------------
DROP TABLE IF EXISTS UDACITYEXERCISE.PUBLIC.DIM_COVID;

CREATE TABLE IF NOT EXISTS UDACITYEXERCISE.PUBLIC.DIM_COVID(
    business_id VARCHAR(255) NOT NULL,
    call_to_action_enabled BOOLEAN,
    covide_banner BOOLEAN,
    grubhub_enabled BOOLEAN,
    request_a_quote_enabled BOOLEAN,
    temporary_closed_until BOOLEAN,
    virtual_services_offered BOOLEAN,
    delivery_or_takeout BOOLEAN,
    highlights BOOLEAN
    );

INSERT INTO UDACITYEXERCISE.PUBLIC.DIM_COVID
SELECT
    business_id,
    call_to_action_enabled,
    covid_banner,
    grubhub_enabled,
    request_a_quote_enabled,
    temporary_closed_until,
    virtual_services_offered,
    delivery_or_takeout,
    highlights
FROM UDACITYEXERCISE.ODS.COVID
;

SELECT * FROM UDACITYEXERCISE.PUBLIC.DIM_COVID LIMIT 100;