
------------ Check Loading -----------------------
SELECT 
    file_name, table_name, row_parsed, row_count
FROM UDACITYEXERCISE.INFORMATION_SCHEMA.LOAD_HISTORY
WHERE status = 'LOADED';


SELECT 
   table_schema ,table_name, row_count, bytes
FROM UDACITYEXERCISE.INFORMATION_SCHEMA.TABLES

WHERE table_schema IN ('ODS', 'PUBLIC', 'STAGING')
ORDER BY 2;