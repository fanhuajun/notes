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

yum install -y net-snmp-devel OpenIPMI-devel libssh2-devel iksemel-devel
yum -y install wget vim pcre pcre-devel openssl openssl-devel libicu-devel gcc gcc-c++ autoconf libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glibc glibc-devel glib2 glib2-devel ncurses ncurses-devel curl curl-devel krb5-devel libidn libidn-devel openldap openldap-devel nss_ldap jemalloc-devel cmake boost-devel bison automake libevent libevent-devel gd gd-devel libtool* libmcrypt libmcrypt-devel mcrypt mhash libxslt libxslt-devel readline readline-devel gmp gmp-devel libcurl libcurl-devel openjpeg-devel
groupadd zabbix
useradd -g zabbix zabbix


# 二、安装/zabbix服务端-----------------------------------------------------------------------------------------------
wget https://sourceforge.net/projects/zabbix/files/ZABBIX%20Latest%20Stable/3.4.12/zabbix-3.4.12.tar.gz
tar zxvf zabbix-3.4.12.tar.gz 
cd zabbix-3.4.12

./configure --prefix=/usr/local/zabbix-3.4.12 \
--sysconfdir=/usr/local/zabbix/etc \
--enable-server \
--enable-agent \
--with-mysql=/usr/local/mysql/bin/mysql_config \
--with-net-snmp \
--with-libcurl \
--with-libxml2 \
--enable-proxy \
--enable-ipv6 \
--enable-java \
--with-ssh2 \
--with-iconv \
--with-openipmi \
--with-ldap \
--with-openssl \
--with-jabber

make
make install
ln -s /usr/local/zabbix-3.4.10 /usr/local/zabbix

# 关闭防火墙和selinux，不关闭，有可能出现无法启动zabbix的情况
systemctl restart zabbix-server zabbix-agent httpd
systemctl enable zabbix-server zabbix-agent httpd
# 浏览器测试 http://47.92.128.86/

# http://47.92.171.176/zabbix/setup.php
# 账号密码 Admin   zabbix
