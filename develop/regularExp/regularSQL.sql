
# (?<=')\w*(?=')
(901,9,'月度考勤管理',4,'man/app/attendance/monthList',0,1,'-1-9-901-'),
(902,9,'个人月度考勤',4,'man/app/attendance/userMonthList',0,2,'-1-9-902-'),

# (?<==).*

DBUser=zabbix
DBHost=127.0.0.1


# (?<==).*
# User=zabbix

sed -i 's#Mandatory:no#hhhhh#g' zabbix_agentd.conf

sed -i 's#.*php_value date.timezone.*#php_value date.timezone Asia/Shanghai#g' /etc/php.ini