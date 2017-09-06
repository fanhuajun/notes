-- 实时数据情况--
SELECT rtu.`app_id`, rtu.`project_code`, vanp.`PROJECT_NAME`, MAX(sigd.`acquisition_time`), rtu.`third_device_id`, COUNT(sigd.`data_id`) 实时数据
FROM rtu_info rtu, signal_info sig, signal_data_real sigd,vanke_project vanp
   WHERE sig.`rtu_id` = rtu.`rtu_id` AND sig.`signal_id` = sigd.`signal_info_id`
   AND rtu.`project_code` = vanp.`PROJECT_ID` GROUP BY rtu.`project_code`;

-- 实时数据总数--
SELECT COUNT(*) 数据总数 FROM signal_data_real;