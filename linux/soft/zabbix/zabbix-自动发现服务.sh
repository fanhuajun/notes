# http://blog.51cto.com/7424593/1908930

top -b -n 1 > /tmp/.top.txt


cat << EOF >> /usr/local/zabbix/scripts/discovery_process.sh 
# cat discovery_process.sh 
#!/bin/bash
#system process discovery script
top -b -n 1 > /tmp/.top.txt && chown zabbix. /tmp/.top.txt
proc_array=(`tail -n +8 /tmp/.top.txt | awk '{a[$NF]+=$10}END{for(k in a)print a[k],k}'|sort -gr|head -10|cut -d" " -f2`)
length=${#proc_array[@]}
 
printf "{\n"
printf '\t'"\"data\":["
for ((i=0;i<$length;i++))
do
    printf "\n\t\t{"
    printf "\"{#PROCESS_NAME}\":\"${proc_array[$i]}\"}"
    if [ $i -lt $[$length-1] ];then
        printf ","
    fi
done
    printf "\n\t]\n"
printf "}\n"
EOF
chmod 777 /usr/local/zabbix/scripts/discovery_process.sh 




cat << EOF >> /usr/local/zabbix/scripts/process_check.sh 
#!/bin/bash
#system process CPU&MEM use information
#mail: mail@huangming.org
mode=$1
name=$2
process=$3
mem_total=$(cat /proc/meminfo | grep "MemTotal" | awk '{printf "%.f",$2/1024}')
cpu_total=$(( $(cat /proc/cpuinfo | grep "processor" | wc -l) * 100 ))
 
function mempre {
    mem_pre=`tail -n +8 /tmp/.top.txt | awk '{a[$NF]+=$10}END{for(k in a)print a[k],k}' | grep "\b${process}\b" | cut -d" " -f1`
    echo "$mem_pre"
}
 
function memuse {
    mem_use=`tail -n +8 /tmp/.top.txt | awk '{a[$NF]+=$10}END{for(k in a)print a[k]/100*'''${mem_total}''',k}' | grep "\b${process}\b" | cut -d" " -f1`
    echo "$mem_use" | awk '{printf "%.f",$1*1024*1024}'
}
 
function cpuuse {
    cpu_use=`tail -n +8 /tmp/.top.txt | awk '{a[$NF]+=$9}END{for(k in a)print a[k],k}' | grep "\b${process}\b" | cut -d" " -f1`
    echo "$cpu_use"
}
 
function cpupre {
    cpu_pre=`tail -n +8 /tmp/.top.txt | awk '{a[$NF]+=$9}END{for(k in a)print a[k]/('''${cpu_total}'''),k}' | grep "\b${process}\b" | cut -d" " -f1`
    echo "$cpu_pre"
}
 
 
case $name in
    mem)
        if [ "$mode" = "pre" ];then
            mempre
        elif [ "$mode" = "avg" ];then
            memuse
        fi
    ;;
    cpu)
        if [ "$mode" = "pre" ];then
            cpupre
        elif [ "$mode" = "avg" ];then
            cpuuse
        fi
    ;;
    *)
        echo -e "Usage: $0 [mode : pre|avg] [mem|cpu] [process]"
esac
EOF

chmod 777 /usr/local/zabbix/scripts/process_check.sh

mkdir /usr/local/zabbix/scripts

echo "# bash" > /usr/local/zabbix/etc/zabbix_agentd.conf.d/userparameter_script.conf
cat << EOF >> /usr/local/zabbix/etc/zabbix_agentd.conf.d/userparameter_script.conf
#!/bin/bash
UserParameter=discovery.process,/usr/local/zabbix/scripts/discovery_process.sh
UserParameter=process.check[*],/usr/local/zabbix/scripts/process_check.sh $1 $2 $3
EOF


killall zabbix_agentd
/usr/local/zabbix/sbin/zabbix_agentd

rpm -ivh http://repo.zabbix.com/zabbix/3.2/rhel/7/x86_64/zabbix-get-3.2.1-1.el7.x86_64.rpm

zabbix_get -s 47.92.201.160 -p 10050 -k "discovery.process"