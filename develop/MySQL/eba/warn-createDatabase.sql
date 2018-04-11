### 网关
DROP TABLE IF EXISTS `warn`.`gateway_info`;
CREATE TABLE `warn`.`gateway_info` LIKE `firefighting`.`gateway_info`;

### rtu
DROP TABLE IF EXISTS `warn`.`rtu_info`;
CREATE TABLE `warn`.`rtu_info` LIKE `firefighting`.`rtu_info`;

### 信号点
DROP TABLE IF EXISTS `warn`.`signal_info`;
CREATE TABLE `warn`.`signal_info` LIKE `firefighting`.`signal_info`;

### 实时数据`signal_data_real`
DROP TABLE IF EXISTS `warn`.`signal_data_real`;
CREATE TABLE `warn`.`signal_data_real` LIKE `firefighting`.`signal_data_real`;


## 清除实时数据
TRUNCATE TABLE warn.`signal_data_real`;

TRUNCATE TABLE warn.`signal_data_real_new`;

CREATE TABLE warn.`signal_data_real_new` LIKE warn.`signal_data_real`;


SELECT sdr.data_id, si.signal_id, si.value_type, si.min_value, si.max_value, si.unit, si.signal_name, 
sdr.signal_value, sdr.acquisition_time, sdr.signal_info_id
	   FROM signal_data_real_new sdr, signal_info si 
	   WHERE sdr.signal_info_id = si.signal_id 
	   AND si.signal_id IN(40);



