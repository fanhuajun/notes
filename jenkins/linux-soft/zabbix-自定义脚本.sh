
# http://blog.51cto.com/dyc2005/2083880

mkdir -pv /etc/zabbix/bin
chown zabbix.zabbix /etc/zabbix/bin

echo init > /etc/zabbix/bin/tcp.sh

cat > /etc/zabbix/bin/tcp.sh << EOF
#!/bin/bash
result=`ps -ef | grep zabbix | grep -v grep`
if [ -n "$result" ]
then
        echo $result
else
        echo $result
fi

EOF

sed -i 's#.*UnsafeUserParameters.*#UnsafeUserParameters=1#' /etc/zabbix/zabbix_agentd.conf

# 由于zabbix server获取数据是通过自定义脚本基于agent 代理执行获取,因此需要修改sudo的配置以便执行/etc/sudoers中添加如下内容并注释如下行
cat << EOF >>/etc/sudoers
#Defaults    requiretty                               #不需要tty终端即可执行命令
zabbix ALL=(root)   NOPASSWD: /usr/sbin/ss
EOF


cat << EOF >/etc/zabbix/zabbix_agentd.d/tcp_conns.conf
UserParameter=tcp_status,/bin/bash /etc/zabbix/bin/tcp.sh
EOF

systemctl restart zabbix-agentd
# systemctl start zabbix-agent

yum -y install zabbix-get.x86_64
zabbix_get -s 127.0.0.1 -p 10050 -k "tcp_status"

# TCP_NUM=cat /proc/sys/kernel/threads-max