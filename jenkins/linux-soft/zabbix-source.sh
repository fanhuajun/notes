#########################################################
# 构建 --> send file or execute commands over SSH --> SSH Publishers --> transfer 
#########################################################
# https://www.cnblogs.com/kowloon/p/7771495.html

# 一、安装MariaDB
yum -y install mariadb mariadb-server
systemctl start mariadb.service
systemctl enable mariadb
# mysql_secure_installation

mysql -uroot -e" create database zabbix character set utf8 collate utf8_bin ";
mysql -uroot -e" grant all privileges on zabbix.* to zabbix@localhost identified by '123456' ";
mysql -uroot -e" flush privileges ";

# 二、安装/zabbix服务端
# https://sourceforge.net/projects/zabbix/files/ZABBIX%20Latest%20Stable/3.4.13/zabbix-3.4.13.tar.gz
wget https://sourceforge.net/projects/zabbix/files/ZABBIX%20Latest%20Stable/3.4.13/zabbix-3.4.13.tar.gz
tar -zxvf zabbix-3.4.13.tar.gz
yum -y install net-snmp-devel libxml2-devel libcurl-deve libevent libevent-devel libcurl
yum -y install mysql-devel curl-devel libxml2-devel

cd zabbix-3.4.13/
mkdir /usr/local/zabbix
./configure --prefix=/usr/local/zabbix/ --enable-server --enable-agent --with-mysql --with-net-snmp --with-libcurl --with-libxml2


groupadd zabbix
useradd -g zabbix zabbix
mkdir -p /usr/local/zabbix/logs
chown -R zabbix:zabbix /usr/local/zabbix

make install
cat /root/zabbix-*/database/mysql/schema.sql |mysql -uzabbix -p123456 -Dzabbix
cat /root/zabbix-*/database/mysql/images.sql |mysql -uzabbix -p123456 -Dzabbix
cat /root/zabbix-*/database/mysql/data.sql |mysql -uzabbix -p123456 -Dzabbix


sed -i '/^#/d;/^$/d' /root/zabbix-*/conf/zabbix_server.conf
sed -i '/DBHost\|DBName\|DBUser\|DBPassword/d' /root/zabbix-*/conf/zabbix_server.conf
cat << EOF >>/root/zabbix-*/conf/zabbix_server.conf
DBHost=localhost
DBName=zabbix
DBUser=zabbix
DBPassword=123456
EOF

/usr/local/zabbix/sbin/zabbix_server
/usr/local/zabbix/sbin/zabbix_agentd


# 三、zabbix web配置
yum -y install httpd php php-mysql php-mbstring php-gd php-bcmath php-ldap php-xml
sed -i 's#.*php_value date.timezone.*#php_value date.timezone Asia/Shanghai#g' /etc/php.ini

sed -i '/^;/d;/^$/d' /etc/php.ini
sed -i '/post_max_size/d;/max_execution_time/d;/max_input_time/d;/date.timezone/d' /etc/php.ini

cat << EOF >>/etc/php.ini
post_max_size=16M
max_execution_time=300
max_input_time=300
date.timezone=Asia/Shanghai
EOF




cp -r /root/zabbix*/frontends/php/* /var/www/html

systemctl restart httpd.service
systemctl enable httpd.service
# 浏览器测试 http://47.92.128.86/

# http://47.92.171.176/zabbix/setup.php
# 账号密码 Admin   zabbix

cat << EOF >/var/www/html/conf/zabbix.conf.php
<?php
// Zabbix GUI configuration file
global $DB;
$DB['TYPE']     = 'MYSQL';
$DB['SERVER']   = 'localhost';
$DB['PORT']     = '3306';
$DB['DATABASE'] = 'zabbix';
$DB['USER']     = 'zabbix';
$DB['PASSWORD'] = '123456';
// SCHEMA is relevant only for IBM_DB2 database
$DB['SCHEMA'] = '';
$ZBX_SERVER      = 'localhost';
$ZBX_SERVER_PORT = '10051';
$ZBX_SERVER_NAME = 'localhost';
$IMAGE_FORMAT_DEFAULT = IMAGE_FORMAT_PNG;
?>
EOF