
Zabbix Servers 3.4 源代码编译安装

原文地址：https://renwole.com/archives/503，博主博客很有质量，值得优先参考


官介：
	Zabbix是一个企业级的分布式开源监控解决方案。它可以监控各种网络应用以及服务器健康性和完整性的软件。Zabbix服务器将其

数据存储在由MySQL、MariaDB、PostgreSQL或Oracle支持的关系型数据库中，Zabbix所有的报告、统计信息和配置参数都可以通过基于Web的

前端页面进行访问设置。而且Zabbix是开源免费的。


一、安装环境
	hostnamectl 
	   Static hostname: zabbix
	         Icon name: computer-vm
	           Chassis: vm
	        Machine ID: fd73dfefb69a4e4183fd3f
	           Boot ID: 747fb52d2f15431faf2445
	    Virtualization: xen
	  Operating System: CentOS Linux 7 (Core)
	       CPE OS Name: cpe:/o:centos:centos:7
	            Kernel: Linux 3.10.0-693.11.1.el7.x86_64
	      Architecture: x86-64

二、由于Zabbix UI前端使用 PHP 写的，所以必须运行在支持PHP脚本语言的Web服务器，即服务器需要具备php环境
	这里推荐一键安装的脚本安装lnmp环境，https://lnmp.org/或https://oneinstack.com/
	因为考虑后期需要启用zabbix-java-gateway，编译安装的时候指定了java，所以还需要配置java环境
	参考：https://renwole.com/archives/503


三、若您的服务器已具备 PHP和JAVA 环境，请略过第三步，继续以下配置：
	配置 php.ini 必须满足以下要求:
		max_execution_time = 300
		max_input_time = 300
		memory_limit = 128M
		post_max_size = 32M
		date.timezone = Asia/Shanghai
		mbstring.func_overload=2
		#Zabbix PHP LDAP 认证开启（可选）
		extension = "/usr/local/php/lib/php/extensions/no-debug-zts-20160303/ldap.so"

四、安装依赖包并创建组&用户
		yum -y install epel-release && yum -y update
		yum install -y net-snmp-devel OpenIPMI-devel libssh2-devel iksemel-devel
		
		yum -y install wget vim pcre pcre-devel openssl openssl-devel libicu-devel gcc gcc-c++ autoconf libjpeg 

yum -y install libjpeg-devel libpng libpng-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glibc glibc-devel glib2 

yum -y install glib2-devel ncurses ncurses-devel curl curl-devel krb5-devel libidn libidn-devel openldap openldap-devel nss_ldap 

yum -y install jemalloc-devel cmake boost-devel bison automake libevent libevent-devel gd gd-devel libtool* libmcrypt libmcrypt-devel 

yum -y install mcrypt mhash libxslt libxslt-devel readline readline-devel gmp gmp-devel libcurl libcurl-devel openjpeg-devel

		groupadd zabbix
		useradd -g zabbix zabbix

五、编译安装 Zabbix Server
	下载地址：https://www.zabbix.com/download_sources
	说明：服务端和客户端都可以通过该源码包编

		tar zxvf zabbix-3.4.10.tar.gz
		cd zabbix-3.4.10
./configure --prefix=/usr/local/zabbix \
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

	注意：–enable-agent 可选，此参数主要用于客户端（被监控者）
	注意：如你未安装JAVA环境，请去掉 –enable-java 选项，主要用于监控Tomcat

六、创建日志目录并将 Zabbix 安装目录设置于zabbix的权限
	mkdir -p /usr/local/zabbix/logs
	chown -R zabbix:zabbix /usr/local/zabbix



七、将 Zabbix UI 前端程序源码拷贝到 Nginx Web 目录
	cp -rf 解压出来的zabbix源码目录zabbix-3.4.10/frontends/php/*  nginx的站点目录/zabbix
	chown -R www.www  nginx的站点目录/zabbix


八、创建数据库名：zabbix 用户：zabbix 密码：12345678 并赋予用户拥有该数据库所有权限
	$ mysql -uroot -p
	Enter password:（输入root数据库密码回车）
	MariaDB [(none)]> create database zabbix character set utf8 collate utf8_bin;
	MariaDB [(none)]> grant all privileges on zabbix.* to zabbix@"%" identified by '12345678';
	MariaDB [(none)]> flush privileges;
	MariaDB [(none)]> quit;


九、将Zabbix相关结构表文件按顺序依次导入zabbix数据库
	导入顺序 schema.sql 表结构 > images.sql 图片库 > data.sql 初始脚
	说明：这些表结构在zabbix源码目录zabbix-3.4.2/database/mysql下

	mysql -uzabbix -p12345678 zabbix < schema.sql
	mysql -uzabbix -p12345678 zabbix < images.sql
	mysql -uzabbix -p12345678 zabbix < data.sql


十、配置 zabbix_server.conf
	说明：这里的数据在同一台机器，不在同一台机器，请修改对应ip
	cat /usr/local/zabbix/etc/zabbix_server.conf
		LogFile=/usr/local/zabbix/logs/zabbix_server.log
		PidFile=/usr/local/zabbix/zabbix_server.pid
		LogFileSize=0
		DBHost=127.0.0.1
		DBName=zabbix
		DBUser=zabbix
		DBPassword=12345678
		JavaGateway=10.10.10.2
		JavaGatewayPort=10052
		StartJavaPollers=5
		StartPingers=4
		Timeout=4
		AlertScriptsPath=/usr/local/zabbix/share/zabbix/alertscripts
		LogSlowQueries=3000
		Include=/usr/local/zabbix/etc/zabbix_server.conf.d/

	注意：由于每个生产环境的参数配置不同，所以配置文件我只列出基本常用的，更多请参考官网：

https://www.zabbix.com/documentation/3.4/zh/manual/appendix/config/zabbix_server


十一、创建 systemctl 系统 zabbix servers 单元文件，以达到开机自启动的目的
	cat /usr/lib/systemd/system/zabbix.service
		[Unit]
		Description=Zabbix Server
		After=syslog.target
		After=network.target

		[Service]
		Environment="CONFFILE=/usr/local/zabbix/etc/zabbix_server.conf"
		EnvironmentFile=-/usr/local/zabbix/etc/zabbix_server.conf.d
		Type=forking
		Restart=on-failure
		PIDFile=/usr/local/zabbix/zabbix_server.pid
		KillMode=control-group
		ExecStart=/usr/local/zabbix/sbin/zabbix_server -c $CONFFILE
		ExecStop=/bin/kill -SIGTERM $MAINPID
		RestartSec=10s
		TimeoutSec=0

		[Install]
		WantedBy=multi-user.target


十二、启动 zabbix 并加入开机自起动
	systemctl start zabbix
	systemctl enable zabbix


十三、Firewalld 防火墙设置
	firewall-cmd --permanent --add-port=10051/tcp
	firewall-cmd --permanent --add-port=80/tcp
	firewall-cmd --reload

十四、浏览器访问
	访问地址：服务器ip/zabbix,然后请根据 Zabbix Server Web 向导提示设置即可
	设置完成后，zabbix默认账号：Admin 密码：zabbix（注意账号区分大小写）登录后是英文界面， 只需点击右上角的小人图标（当

前用户设置）定位到 Language 项，选择 Chinese (zh_CN)，点击 Update 即可切换为中文界面。