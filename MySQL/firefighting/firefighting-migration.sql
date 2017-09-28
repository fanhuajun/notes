-- 去除`device_running_info`
SET @table1 = "fire_prj_bi_tmp";
SELECT * FROM @table1;

DROP TABLE IF EXISTS `firefighting_test`.`fire_prj_bi_tmp`;
CREATE TABLE `firefighting_test`.`fire_prj_bi_tmp` LIKE `firefighting`.`fire_prj_bi_tmp`;
INSERT INTO `firefighting_test`.fire_prj_bi_tmp SELECT * FROM `firefighting`.`fire_prj_bi_tmp`;  
###
`fire_prj_tmp`;
DROP TABLE IF EXISTS `firefighting_test`.`fire_prj_tmp`;
CREATE TABLE `firefighting_test`.`fire_prj_tmp` LIKE `firefighting`.`fire_prj_tmp`;
INSERT INTO `firefighting_test`.`fire_prj_tmp` SELECT * FROM `firefighting`.`fire_prj_tmp`;
###
`fire_user`;
DROP TABLE IF EXISTS `firefighting_test`.`fire_user`;
CREATE TABLE `firefighting_test`.`fire_user` LIKE `firefighting`.`fire_user`;
INSERT INTO `firefighting_test`.`fire_user` SELECT * FROM `firefighting`.`fire_user`;
###
`firesignal`;
DROP TABLE IF EXISTS `firefighting_test`.`firesignal`;
CREATE TABLE `firefighting_test`.`firesignal` LIKE `firefighting`.`firesignal`;
INSERT INTO `firefighting_test`.`firesignal` SELECT * FROM `firefighting`.`firesignal`;
###
`gateway_info`;
DROP TABLE IF EXISTS `firefighting_test`.`gateway_info`;
CREATE TABLE `firefighting_test`.`gateway_info` LIKE `firefighting`.`gateway_info`;
INSERT INTO `firefighting_test`.`gateway_info` SELECT * FROM `firefighting`.`gateway_info`;
###
`gateway_info_warn`;
DROP TABLE IF EXISTS `firefighting_test`.`gateway_info_warn`;
CREATE TABLE `firefighting_test`.`gateway_info_warn` LIKE `firefighting`.`gateway_info_warn`;
INSERT INTO `firefighting_test`.`gateway_info_warn` SELECT * FROM `firefighting`.`gateway_info_warn`;
###
`job_execution_log`;
DROP TABLE IF EXISTS `firefighting_test`.`job_execution_log`;
CREATE TABLE `firefighting_test`.`job_execution_log` LIKE `firefighting`.`job_execution_log`;
INSERT INTO `firefighting_test`.`job_execution_log` SELECT * FROM `firefighting`.`job_execution_log`;
###
-- `job_status_trace_log`;
DROP TABLE IF EXISTS `firefighting_test`.`job_status_trace_log`;
CREATE TABLE `firefighting_test`.`job_status_trace_log` LIKE `firefighting`.`job_status_trace_log`;
INSERT INTO `firefighting_test`.`job_status_trace_log` SELECT * FROM `firefighting`.`job_status_trace_log`;
###
-- `project_data_status`;
DROP TABLE IF EXISTS `firefighting_test`.`project_data_status`;
CREATE TABLE `firefighting_test`.`project_data_status` LIKE `firefighting`.`project_data_status`;
INSERT INTO `firefighting_test`.`project_data_status` SELECT * FROM `firefighting`.`project_data_status`;
###
-- `report_temp`;
DROP TABLE IF EXISTS `firefighting_test`.`report_temp`;
CREATE TABLE `firefighting_test`.`report_temp` LIKE `firefighting`.`report_temp`;
INSERT INTO `firefighting_test`.`report_temp` SELECT * FROM `firefighting`.`report_temp`;
###
-- `rtu_info`;
DROP TABLE IF EXISTS `firefighting_test`.`rtu_info`;
CREATE TABLE `firefighting_test`.`rtu_info` LIKE `firefighting`.`rtu_info`;
INSERT INTO `firefighting_test`.`rtu_info` SELECT * FROM `firefighting`.`rtu_info`;
###
-- 去除`signal_data_real`
DROP TABLE IF EXISTS `firefighting_test`.`signal_data_real`;
CREATE TABLE `firefighting_test`.`signal_data_real` LIKE `firefighting`.`signal_data_real`;
###
-- `signal_data_real_warn`;
DROP TABLE IF EXISTS `firefighting_test`.`signal_data_real_warn`;
CREATE TABLE `firefighting_test`.`signal_data_real_warn` LIKE `firefighting`.`signal_data_real_warn`;
INSERT INTO `firefighting_test`.`signal_data_real_warn` SELECT * FROM `firefighting`.`signal_data_real_warn`;
###
-- `signal_data_real_warn_log`;
DROP TABLE IF EXISTS `firefighting_test`.`signal_data_real_warn_log`;
CREATE TABLE `firefighting_test`.`signal_data_real_warn_log` LIKE `firefighting`.`signal_data_real_warn_log`;
INSERT INTO `firefighting_test`.`signal_data_real_warn_log` SELECT * FROM `firefighting`.`signal_data_real_warn_log`;
###
`signal_equipment_ref`;
DROP TABLE IF EXISTS `firefighting_test`.`signal_equipment_ref`;
CREATE TABLE `firefighting_test`.`signal_equipment_ref` LIKE `firefighting`.`signal_equipment_ref`;
INSERT INTO `firefighting_test`.`signal_equipment_ref` SELECT * FROM `firefighting`.`signal_equipment_ref`;
###
`signal_info`;
DROP TABLE IF EXISTS `firefighting_test`.`signal_info`;
CREATE TABLE `firefighting_test`.`signal_info` LIKE `firefighting`.`signal_info`;
INSERT INTO `firefighting_test`.`signal_info` SELECT * FROM `firefighting`.`signal_info`;
###
`synch_equip_task_log`;
DROP TABLE IF EXISTS `firefighting_test`.`synch_equip_task_log`;
CREATE TABLE `firefighting_test`.`synch_equip_task_log` LIKE `firefighting`.`synch_equip_task_log`;
INSERT INTO `firefighting_test`.`synch_equip_task_log` SELECT * FROM `firefighting`.`synch_equip_task_log`;
###
`vanke_equip_type_dictionary`;
DROP TABLE IF EXISTS `firefighting_test`.`vanke_equip_type_dictionary`;
CREATE TABLE `firefighting_test`.`vanke_equip_type_dictionary` LIKE `firefighting`.`vanke_equip_type_dictionary`;
INSERT INTO `firefighting_test`.`vanke_equip_type_dictionary` SELECT * FROM `firefighting`.`vanke_equip_type_dictionary`;
###
`vanke_equipment`;
DROP TABLE IF EXISTS `firefighting_test`.`vanke_equipment`;
CREATE TABLE `firefighting_test`.`vanke_equipment` LIKE `firefighting`.`vanke_equipment`;
INSERT INTO `firefighting_test`.`vanke_equipment` SELECT * FROM `firefighting`.`vanke_equipment`;
###
`vanke_equipment_room`;
DROP TABLE IF EXISTS `firefighting_test`.`vanke_equipment_room`;
CREATE TABLE `firefighting_test`.`vanke_equipment_room` LIKE `firefighting`.`vanke_equipment_room`;
INSERT INTO `firefighting_test`.`vanke_equipment_room` SELECT * FROM `firefighting`.`vanke_equipment_room`;
###
`vanke_equipment_tmp`;
DROP TABLE IF EXISTS `firefighting_test`.`vanke_equipment_tmp`;
CREATE TABLE `firefighting_test`.`vanke_equipment_tmp` LIKE `firefighting`.`vanke_equipment_tmp`;
INSERT INTO `firefighting_test`.`vanke_equipment_tmp` SELECT * FROM `firefighting`.`vanke_equipment_tmp`;
###
`vanke_equipment_zt_tmp`;
DROP TABLE IF EXISTS `firefighting_test`.`vanke_equipment_zt_tmp`;
CREATE TABLE `firefighting_test`.`vanke_equipment_zt_tmp` LIKE `firefighting`.`vanke_equipment_zt_tmp`;
INSERT INTO `firefighting_test`.`vanke_equipment_zt_tmp` SELECT * FROM `firefighting`.`vanke_equipment_zt_tmp`;
###
`vanke_project`;
DROP TABLE IF EXISTS `firefighting_test`.`vanke_project`;
CREATE TABLE `firefighting_test`.`vanke_project` LIKE `firefighting`.`vanke_project`;
INSERT INTO `firefighting_test`.`vanke_project` SELECT * FROM `firefighting`.`vanke_project`;
###
`vanke_project_test`;
DROP TABLE IF EXISTS `firefighting_test`.`vanke_project_test`;
CREATE TABLE `firefighting_test`.`vanke_project_test` LIKE `firefighting`.`vanke_project_test`;
INSERT INTO `firefighting_test`.`vanke_project_test` SELECT * FROM `firefighting`.`vanke_project_test`;
###