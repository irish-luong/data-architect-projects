---------------------- COVID ----------------------
SELECT * FROM UDACITYEXERCISE.STAGING.COVID LIMIT 100;

DROP TABLE IF EXISTS UDACITYEXERCISE.ODS.COVID;

CREATE TABLE IF NOT EXISTS UDACITYEXERCISE.ODS.COVID(
    business_id VARCHAR(255) REFERENCES UDACITYEXERCISE.ODS.BUSINESS(business_id),
    call_to_action_enabled BOOLEAN,
    covid_banner BOOLEAN,
    grubhub_enabled BOOLEAN,
    request_a_quote_enabled BOOLEAN,
    temporary_closed_until BOOLEAN,
    virtual_services_offered BOOLEAN,
    delivery_or_takeout BOOLEAN,
    highlights BOOLEAN
    );

INSERT INTO UDACITYEXERCISE.ODS.COVID
SELECT 
    *
FROM (
    SELECT
        TRIM(json_value:"business_id") AS business_id,
        TRY_TO_BOOLEAN(json_value:"Call To Action enabled"::TEXT) AS call_to_action_enabled,
        TRY_TO_BOOLEAN(json_value:"Covid Banner"::TEXT) AS covid_banner,
        TRY_TO_BOOLEAN(json_value:"Grubhub enabled"::TEXT) AS grubhub_enabled,
        TRY_TO_BOOLEAN(json_value:"Request a Quote Enabled"::TEXT) AS request_a_quote_enabled,
        TRY_TO_BOOLEAN(json_value:"Temporary Closed Until"::TEXT) AS temporary_closed_until,
        TRY_TO_BOOLEAN(json_value:"Virtual Services Offered"::TEXT) AS virtual_services_offered,
        TRY_TO_BOOLEAN(json_value:"delivery or takeout"::TEXT) AS delivery_or_takeout,
        TRY_TO_BOOLEAN(json_value:"highlights"::TEXT) AS highlights
    FROM UDACITYEXERCISE.STAGING.COVID
)
WHERE 1=1
    AND call_to_action_enabled IS NOT NULL
    AND covid_banner IS NOT NULL
    AND grubhub_enabled IS NOT NULL
    AND request_a_quote_enabled IS NOT NULL
    AND temporary_closed_until IS NOT NULL
    AND virtual_services_offered IS NOT NULL
    AND delivery_or_takeout IS NOT NULL
    AND highlights IS NOT NULL  
;

SELECT * FROM UDACITYEXERCISE.ODS.COVID LIMIT 100;