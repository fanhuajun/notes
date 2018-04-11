-- ----------------------------------------------------------------------
-- 查询表占用的内存
-- ----------------------------------------------------------------------
USE information_schema;
SELECT CONCAT(ROUND(SUM(DATA_LENGTH/1024/1024), 2), 'MB')  DATA FROM TABLES;
SELECT TABLE_NAME, CONCAT(ROUND(DATA_LENGTH/1024/1024, 2), 'MB') data1 FROM TABLES ORDER BY DATA_LENGTH DESC;