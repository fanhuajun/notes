-- 查询二进制文件
SHOW BINARY LOGS;
SHOW BINLOG EVENTS limit 100;
-- 查看从数据库状态
show slave status;
show relaylog events in 'slave-relay.000696';


SHOW PROCESSLIST;


分库/分片



ALTER TABLE `tbl_manage_project_change_record` ADD question_comment VARCHAR(512) DEFAULT NULL COMMENT '有问题的列';
ALTER TABLE `tbl_user_project_permission` ADD is_common ENUM('公有','非公有') DEFAULT '非公有' COMMENT '是否公有';
ALTER TABLE `tbl_user_project_permission` ADD permission_range ENUM('大区权限','管理中心权限','项目权限') DEFAULT '项目权限' NULL COMMENT '权限范围';
ALTER TABLE `tbl_manage_project_parter_change` ADD staff_id BIGINT(20) DEFAULT NULL COMMENT '合伙人ID';