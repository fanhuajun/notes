
-- 实时数据总数--
SELECT COUNT(*) 数据总数 FROM signal_data_real WHERE acquisition_time > "2017-09-08 00:00:00";

-- 当天各项目数据统计
EXPLAIN;
SELECT rtu.`app_id`, vanp.`PROJECT_ID`, vanp.`PROJECT_NAME`, COUNT(real1.`data_id`) dataTotal
FROM rtu_info rtu, signal_data_real real1, signal_info sig, vanke_project vanp
WHERE acquisition_time > CURDATE()
AND sig.`signal_id` = real1.`signal_info_id`
AND sig.`rtu_id` = rtu.`rtu_id`
AND rtu.`project_code` = vanp.`PROJECT_ID`
GROUP BY rtu.`project_code`;

SELECT CURDATE();


SELECT DISTINCT PROJECT_ID FROM gateway_info WHERE report_time > "2017-08-26 00:00:00";

SELECT DISTINCT gate.PROJECT_ID, vanp.`PROJECT_NAME` 
FROM gateway_info gate, vanke_project vanp
WHERE report_time > "2017-08-26 00:00:00"
AND gate.PROJECT_ID = vanp.`PROJECT_ID`
AND gate.PROJECT_ID NOT IN(
SELECT rtu.`app_id`, vanp.`PROJECT_ID`, vanp.`PROJECT_NAME`, COUNT(real1.`data_id`) dataTotal
FROM rtu_info rtu, signal_data_real real1, signal_info sig, vanke_project vanp
WHERE acquisition_time > CURDATE()
AND sig.`signal_id` = real1.`signal_info_id`
AND sig.`rtu_id` = rtu.`rtu_id`
AND rtu.`project_code` = vanp.`PROJECT_ID`
GROUP BY rtu.`project_code`;

)
;















