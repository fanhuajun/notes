-- 实时数据情况--
SELECT rtu.`third_device_id`,rtu.`app_id`, rtu.`project_code`, vanp.`PROJECT_NAME`, COUNT(sigd.`data_id`) 实时数据, MAX(sigd.`acquisition_time`)
FROM rtu_info rtu, signal_info sig,
 signal_data_real sigd,vanke_project vanp
   WHERE sig.`rtu_id` = rtu.`rtu_id`
   AND sig.`signal_id` = sigd.`signal_info_id`
   AND rtu.`project_code` = vanp.`PROJECT_ID`
   GROUP BY rtu.`project_code`;