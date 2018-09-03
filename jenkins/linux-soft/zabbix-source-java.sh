
cd /home/zabbix-*
./configure --prefix=/usr/local/zabbix --enable-java
make install

#zabbix_java  https://www.cnblogs.com/Eivll0m/p/5446311.html
sed -i '/^#/d;/^$/d' /usr/local/zabbix/sbin/zabbix_java/settings.sh
cat << EOF >>/usr/local/zabbix/sbin/zabbix_java/settings.sh
LISTEN_IP="0.0.0.0"       #监听地址
LISTEN_PORT=10052      #监听端口
START_POLLERS=5        # 开启的工作线程数（必须大于等于后面zabbix_server.conf文件的StartJavaPollers参数）
EOF

/usr/local/zabbix/sbin/zabbix_java/startup.sh
/usr/local/zabbix/sbin/zabbix_server

cat << EOF >>/usr/local/zabbix/etc/zabbix_server.conf
JavaGateway=127.0.0.1                     # JavaGateway 服务器地址，zabbix_server与zabbix_java_gateway在同一台主机
JavaGatewayPort=10052                    #端口
StartJavaPollers=5
EOF

/usr/local/zabbix/sbin/zabbix_server

