-- 查询二进制文件
SHOW BINARY LOGS;
SHOW BINLOG EVENTS limit 100;
-- 查看从数据库状态
show slave status;
show relaylog events in 'slave-relay.000696';


SHOW PROCESSLIST;