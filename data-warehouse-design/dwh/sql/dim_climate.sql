---------------------- PRECIPITATION ----------------------

DROP TABLE IF EXISTS UDACITYEXERCISE.PUBLIC.DIM_CLIMATE;

CREATE TABLE IF NOT EXISTS UDACITYEXERCISE.PUBLIC.DIM_CLIMATE(
    date DATE PRIMARY KEY,
    min DOUBLE,
    max DOUBLE,
    normal_min DOUBLE,
    normal_max DOUBLE,
    precipitation DOUBLE,
    precipitation_normal DOUBLE
    );

INSERT INTO UDACITYEXERCISE.PUBLIC.DIM_CLIMATE
SELECT 
    COALESCE(p.date, t.date) as date,
    t.min,
    t.max,
    t.normal_min,
    t.normal_max,
    p.precipitation,
    p.precipitation_normal
 FROM UDACITYEXERCISE.ODS.PRECIPITATION p 
    FULL OUTER JOIN UDACITYEXERCISE.ODS.TEMPERATURE t
        ON p.date = t.date;

SELECT * FROM UDACITYEXERCISE.PUBLIC.DIM_CLIMATE ORDER BY date LIMIT 100;