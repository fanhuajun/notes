
-- mqtt接收到的 实时数据总数--
SELECT COUNT(*) 数据总数 FROM signal_data_real rell WHERE acquisition_time > CURDATE();  -- 2017-09-19 11:00:00
SELECT COUNT(*) 数据总数 FROM signal_data_real rell WHERE acquisition_time > "2017-09-19 11:00:00";  -- 2017-09-19 11:00:00

-- 当天推到BI的数据总数
SELECT COUNT(*) 数据总数 FROM signal_data_real rell WHERE acquisition_time > CURDATE() AND rell.`status` = 1;

-- 当天各项目数据统计
EXPLAIN
SELECT rtu.`app_id`, vanp.`PROJECT_ID`, vanp.`PROJECT_NAME`, COUNT(real1.`data_id`) dataTotal
FROM rtu_info rtu, signal_data_real real1, signal_info sig, vanke_project vanp
WHERE acquisition_time > CURDATE()
AND sig.`signal_id` = real1.`signal_info_id`
AND sig.`rtu_id` = rtu.`rtu_id`
AND rtu.`project_code` = vanp.`PROJECT_ID`
GROUP BY rtu.`project_code`;

-- 当天各信号点数据情况
EXPLAIN;
SELECT vanp.`PROJECT_ID`, vanp.`PROJECT_NAME`, sig.`signal_name`, sig.`signal_id`, sig.`device_equipment_id`
FROM rtu_info rtu, signal_data_real real1, signal_info sig, vanke_project vanp
WHERE acquisition_time > CURDATE()
AND sig.`signal_id` = real1.`signal_info_id`
AND sig.`rtu_id` = rtu.`rtu_id`
AND rtu.`project_code` = vanp.`PROJECT_ID`
GROUP BY sig.`signal_id`;

-- -----------------

-- 查看某个项目的信号点信息
EXPLAIN;
SELECT vanp.`PROJECT_ID`, vanp.`PROJECT_NAME`, sig.`signal_name`, sig.`signal_id`, sig.`device_equipment_id`, equip.`equip_name`
FROM rtu_info rtu, signal_info sig, vanke_project vanp, vanke_equipment equip
WHERE sig.`rtu_id` = rtu.`rtu_id`
AND rtu.`project_code` = vanp.`PROJECT_ID`
AND equip.`equip_code` = sig.`device_equipment_id`
AND vanp.`PROJECT_NAME` LIKE "%杭州%";
-- -----------------


SELECT * FROM signal_info WHERE signal_id = 1414;

SELECT * FROM vanke_equipment WHERE EQUIP_CODE = "-000808639=060202+330110010200912000028B01";

SELECT * FROM signal_info WHERE rtu_id = 256;

SELECT * FROM gateway_info gateInfo, vanke_project vanp 
WHERE gateInfo.`project_id` = vanp.`PROJECT_ID` AND vanp.`PROJECT_NAME` LIKE "%杭州秋荷坊%"; 

SELECT * FROM rtu_info WHERE rtu_id = 256;

SELECT * FROM rtu_info WHERE project_code = 51010020;


SELECT CURDATE();

















