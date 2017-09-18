
-- mqtt接收到的 实时数据总数--
SELECT COUNT(*) 数据总数 FROM signal_data_real rell WHERE acquisition_time > CURDATE();

-- 当天推到BI的数据总数
SELECT COUNT(*) 数据总数 FROM signal_data_real rell WHERE acquisition_time > "2017-09-14 16:45:06.001" AND rell.`status` = 1;

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

















