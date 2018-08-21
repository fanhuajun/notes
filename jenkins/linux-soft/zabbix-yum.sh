#########################################################
# 构建 --> send file or execute commands over SSH --> SSH Publishers --> transfer 
#########################################################

# 一、安装MariaDB
yum -y install mariadb mariadb-server
systemctl start mariadb.service
systemctl enable mariadb
# mysql_secure_installation

mysql -uroot -e" create database zabbix character set utf8 collate utf8_bin ";
mysql -uroot -e" grant all privileges on zabbix.* to zabbix@localhost identified by '123456' ";
mysql -uroot -e" flush privileges ";

# 二、安装/zabbix服务端
rpm -i https://repo.zabbix.com/zabbix/3.4/rhel/7/x86_64/zabbix-release-3.4-2.el7.noarch.rpm
yum -y install zabbix-server-mysql zabbix-web-mysql zabbix-agent
zcat /usr/share/doc/zabbix-server-mysql-*/create.sql.gz |mysql -uzabbix -p123456 -Dzabbix

# vim /etc/zabbix/zabbix_server.conf
sed -i '/^#/d;/^$/d' /etc/zabbix/zabbix_server.conf
sed -i '/DBHost\|DBName\|DBUser\|DBPassword/d' /etc/zabbix/zabbix_server.conf
cat << EOF >>/etc/zabbix/zabbix_server.conf
DBHost=localhost
DBName=zabbix
DBUser=zabbix
DBPassword=123456
EOF

# 关闭防火墙和selinux，不关闭，有可能出现无法启动zabbix的情况
systemctl restart zabbix-server zabbix-agent httpd
systemctl enable zabbix-server zabbix-agent httpd
# 三、zabbix web配置
yum -y install httpd php php-mysql php-mbstring php-gd php-bcmath php-ldap php-xml
sed -i 's#.*php_value date.timezone.*#php_value date.timezone Asia/Shanghai#g' /etc/httpd/conf.d/zabbix.conf

systemctl restart httpd.service
systemctl enable httpd.service
# 浏览器测试 http://47.92.128.86/

# http://47.92.171.176/zabbix/setup.php
# 账号密码 Admin   zabbix
