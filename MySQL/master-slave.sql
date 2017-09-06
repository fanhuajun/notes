
# 主 数据库配置
[mysqld]
datadir=/home/mysqldata/

server-id=1
sync_binlog=1
log-bin=/home/mysqldata/mysqlmaster-bin.log
port=3306

innodb_buffer_pool_size=512M
innodb_flush_log_at_trx_commit=1
sql_mode=NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES
lower_case_table_names=1
log_bin_trust_function_creators=1
binlog_format=mixed


GRANT REPLICATION SLAVE ON *.* TO 'root'@'114.215.47.79' IDENTIFIED BY '123456';




# 从 数据库配置
change master to master_host='10.1.251.17',master_user='root',master_password='123456',
master_log_file='mysqlmaster-bin.000028' ,master_log_pos=42075;

# 调试
mysql -u root -h 10.1.251.17 -p #连接测试