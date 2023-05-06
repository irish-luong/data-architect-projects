SELECT 
    db.name AS business_name,
    dc.max AS max_temperature,
    dc.min AS min_temperature,
    dc.normal_min AS normal_min_temperature,
    dc.normal_max AS normal_max_temperature,
    dc.precipitation AS precipitation,
    dc.precipitation_normal AS precipitation_normal,
    dr.stars AS rating
FROM UDACITYEXERCISE.PUBLIC.FACT_TABLE ft 
    LEFT JOIN UDACITYEXERCISE.PUBLIC.DIM_BUSINESS db ON ft.business_id = db.business_id
    LEFT JOIN UDACITYEXERCISE.PUBLIC.DIM_CLIMATE dc ON ft.date = dc.date
    INNER JOIN UDACITYEXERCISE.PUBLIC.DIM_REVIEW dr 
        ON ft.business_id = dr.business_id 
            AND ft.customer_id = dr.customer_id
            AND ft.date = dr.date
LIMIT 100