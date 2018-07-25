
-- mqtt接收到的 实时数据总数--
SELECT COUNT(*) 数据总数 FROM signal_data_real rell WHERE acquisition_time > CURDATE();  -- 2017-09-19 11:00:00
SELECT COUNT(*) 数据总数 FROM signal_data_real rell WHERE acquisition_time > "2017-09-19 11:00:00";  -- 2017-09-19 11:00:00

-- 当天推到BI的数据总数
SELECT COUNT(*) 数据总数 FROM signal_data_real rell WHERE acquisition_time > CURDATE() AND rell.`status` = 1;

-- 当天各项目数据统计
EXPLAIN;
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


-- 复制数据库表 到 firefighting --


-- 去除`device_running_info`
SET @table1 = "fire_prj_bi_tmp";
SELECT * FROM @table1;

DROP TABLE IF EXISTS `firefighting_test`.`fire_prj_bi_tmp`;
CREATE TABLE `firefighting_test`.`fire_prj_bi_tmp` LIKE `firefighting`.`fire_prj_bi_tmp`;
INSERT INTO `firefighting_test`.fire_prj_bi_tmp SELECT * FROM `firefighting`.`fire_prj_bi_tmp`;  
###
`fire_prj_tmp`
DROP TABLE IF EXISTS `firefighting_test`.`fire_prj_tmp`;
CREATE TABLE `firefighting_test`.`fire_prj_tmp` LIKE `firefighting`.`fire_prj_tmp`;
INSERT INTO `firefighting_test`.fire_prj_tmp SELECT * FROM `firefighting`.`fire_prj_tmp`;
###
`fire_user`
DROP TABLE IF EXISTS `firefighting_test`.`fire_prj_tmp`;
CREATE TABLE `firefighting_test`.`fire_prj_tmp` LIKE `firefighting`.`fire_prj_tmp`;
INSERT INTO `firefighting_test`.fire_prj_tmp SELECT * FROM `firefighting`.`fire_prj_tmp`;
###
`firesignal`
DROP TABLE IF EXISTS `firefighting_test`.`fire_prj_tmp`;
CREATE TABLE `firefighting_test`.`fire_prj_tmp` LIKE `firefighting`.`fire_prj_tmp`;
INSERT INTO `firefighting_test`.fire_prj_tmp SELECT * FROM `firefighting`.`fire_prj_tmp`;
###
`gateway_info`
DROP TABLE IF EXISTS `firefighting_test`.`fire_prj_tmp`;
CREATE TABLE `firefighting_test`.`fire_prj_tmp` LIKE `firefighting`.`fire_prj_tmp`;
INSERT INTO `firefighting_test`.fire_prj_tmp SELECT * FROM `firefighting`.`fire_prj_tmp`;
###
`gateway_info_warn`
DROP TABLE IF EXISTS `firefighting_test`.`fire_prj_tmp`;
CREATE TABLE `firefighting_test`.`fire_prj_tmp` LIKE `firefighting`.`fire_prj_tmp`;
INSERT INTO `firefighting_test`.fire_prj_tmp SELECT * FROM `firefighting`.`fire_prj_tmp`;
###
`job_execution_log`
DROP TABLE IF EXISTS `firefighting_test`.`fire_prj_tmp`;
CREATE TABLE `firefighting_test`.`fire_prj_tmp` LIKE `firefighting`.`fire_prj_tmp`;
INSERT INTO `firefighting_test`.fire_prj_tmp SELECT * FROM `firefighting`.`fire_prj_tmp`;
###
`job_status_trace_log`
DROP TABLE IF EXISTS `firefighting_test`.`fire_prj_tmp`;
CREATE TABLE `firefighting_test`.`fire_prj_tmp` LIKE `firefighting`.`fire_prj_tmp`;
INSERT INTO `firefighting_test`.fire_prj_tmp SELECT * FROM `firefighting`.`fire_prj_tmp`;
###
`project_data_status`
DROP TABLE IF EXISTS `firefighting_test`.`fire_prj_tmp`;
CREATE TABLE `firefighting_test`.`fire_prj_tmp` LIKE `firefighting`.`fire_prj_tmp`;
INSERT INTO `firefighting_test`.fire_prj_tmp SELECT * FROM `firefighting`.`fire_prj_tmp`;
###
`report_temp`
DROP TABLE IF EXISTS `firefighting_test`.`fire_prj_tmp`;
CREATE TABLE `firefighting_test`.`fire_prj_tmp` LIKE `firefighting`.`fire_prj_tmp`;
INSERT INTO `firefighting_test`.fire_prj_tmp SELECT * FROM `firefighting`.`fire_prj_tmp`;
###
`rtu_info`
DROP TABLE IF EXISTS `firefighting_test`.`fire_prj_tmp`;
CREATE TABLE `firefighting_test`.`fire_prj_tmp` LIKE `firefighting`.`fire_prj_tmp`;
INSERT INTO `firefighting_test`.fire_prj_tmp SELECT * FROM `firefighting`.`fire_prj_tmp`;
###
-- 去除`signal_data_real`
`signal_data_real_warn`
DROP TABLE IF EXISTS `firefighting_test`.`fire_prj_tmp`;
CREATE TABLE `firefighting_test`.`fire_prj_tmp` LIKE `firefighting`.`fire_prj_tmp`;
INSERT INTO `firefighting_test`.fire_prj_tmp SELECT * FROM `firefighting`.`fire_prj_tmp`;
###
`signal_data_real_warn_log`
DROP TABLE IF EXISTS `firefighting_test`.`fire_prj_tmp`;
CREATE TABLE `firefighting_test`.`fire_prj_tmp` LIKE `firefighting`.`fire_prj_tmp`;
INSERT INTO `firefighting_test`.fire_prj_tmp SELECT * FROM `firefighting`.`fire_prj_tmp`;
###
`signal_equipment_ref`
DROP TABLE IF EXISTS `firefighting_test`.`fire_prj_tmp`;
CREATE TABLE `firefighting_test`.`fire_prj_tmp` LIKE `firefighting`.`fire_prj_tmp`;
INSERT INTO `firefighting_test`.fire_prj_tmp SELECT * FROM `firefighting`.`fire_prj_tmp`;
###
`signal_info`
DROP TABLE IF EXISTS `firefighting_test`.`fire_prj_tmp`;
CREATE TABLE `firefighting_test`.`fire_prj_tmp` LIKE `firefighting`.`fire_prj_tmp`;
INSERT INTO `firefighting_test`.fire_prj_tmp SELECT * FROM `firefighting`.`fire_prj_tmp`;
###
`synch_equip_task_log`
DROP TABLE IF EXISTS `firefighting_test`.`fire_prj_tmp`;
CREATE TABLE `firefighting_test`.`fire_prj_tmp` LIKE `firefighting`.`fire_prj_tmp`;
INSERT INTO `firefighting_test`.fire_prj_tmp SELECT * FROM `firefighting`.`fire_prj_tmp`;
###
`vanke_equip_type_dictionary`
DROP TABLE IF EXISTS `firefighting_test`.`fire_prj_tmp`;
CREATE TABLE `firefighting_test`.`fire_prj_tmp` LIKE `firefighting`.`fire_prj_tmp`;
INSERT INTO `firefighting_test`.fire_prj_tmp SELECT * FROM `firefighting`.`fire_prj_tmp`;
###
`vanke_equipment`
DROP TABLE IF EXISTS `firefighting_test`.`fire_prj_tmp`;
CREATE TABLE `firefighting_test`.`fire_prj_tmp` LIKE `firefighting`.`fire_prj_tmp`;
INSERT INTO `firefighting_test`.fire_prj_tmp SELECT * FROM `firefighting`.`fire_prj_tmp`;
###
`vanke_equipment_room`
DROP TABLE IF EXISTS `firefighting_test`.`fire_prj_tmp`;
CREATE TABLE `firefighting_test`.`fire_prj_tmp` LIKE `firefighting`.`fire_prj_tmp`;
INSERT INTO `firefighting_test`.fire_prj_tmp SELECT * FROM `firefighting`.`fire_prj_tmp`;
###
`vanke_equipment_tmp`
DROP TABLE IF EXISTS `firefighting_test`.`fire_prj_tmp`;
CREATE TABLE `firefighting_test`.`fire_prj_tmp` LIKE `firefighting`.`fire_prj_tmp`;
INSERT INTO `firefighting_test`.fire_prj_tmp SELECT * FROM `firefighting`.`fire_prj_tmp`;
###
`vanke_equipment_zt_tmp`
DROP TABLE IF EXISTS `firefighting_test`.`fire_prj_tmp`;
CREATE TABLE `firefighting_test`.`fire_prj_tmp` LIKE `firefighting`.`fire_prj_tmp`;
INSERT INTO `firefighting_test`.fire_prj_tmp SELECT * FROM `firefighting`.`fire_prj_tmp`;
###
`vanke_project`
DROP TABLE IF EXISTS `firefighting_test`.`fire_prj_tmp`;
CREATE TABLE `firefighting_test`.`fire_prj_tmp` LIKE `firefighting`.`fire_prj_tmp`;
INSERT INTO `firefighting_test`.fire_prj_tmp SELECT * FROM `firefighting`.`fire_prj_tmp`;
###
`vanke_project_test`
DROP TABLE IF EXISTS `firefighting_test`.`fire_prj_tmp`;
CREATE TABLE `firefighting_test`.`fire_prj_tmp` LIKE `firefighting`.`fire_prj_tmp`;
INSERT INTO `firefighting_test`.fire_prj_tmp SELECT * FROM `firefighting`.`fire_prj_tmp`;
###














