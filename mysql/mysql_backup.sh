#!/bin/bash
# mysql_backup.sh: backup mysql databases and keep newest 5 days backup.  
#  
# ${db_user} is mysql username  
# ${db_password} is mysql password  
# ${db_host} is mysql host   
# —————————–  
#/root/mysql_backup.sh
# everyday 3:00 AM execute database backup
# 0 3 * * * /root/mysql_backup.sh
#/etc/cron.daily

db_user="permission"
db_password="permission"
db_host="localhost"
# the directory for story your backup file.  #
backup_dir="/home/data/mysql-backup/"
# 要备份的数据库名 #
#all_db="$(${mysql} -u ${db_user} -h ${db_host} -p${db_password} -Bse 'show databases')" #
all_db="gws_permission_db"
database1="gws_permission_db"
database2="gws_ssoServer_pro"

# 要保留的备份天数 #
backup_day=10

#数据库备份日志文件存储的路径
logfile="/var/log/mysql_backup.log"

###ssh端口号###
ssh_port=1204
###定义ssh auto key的文件###
id_rsa=/root/auth_key/id_rsa_153.141.rsa
###定义ssh auto username###
id_rsa_user=rsync
###定义要同步的远程服务器的目录路径（必须是绝对路径）###
clientPath="/home/backup/mysql"
###定义要镜像的本地文件目录路径 源服务器（必须是绝对路径）###
serverPath=${backup_dir}
###定义生产环境的ip###
web_ip="192.168.0.2"

# date format for backup file (dd-mm-yyyy)  #
time="$(date +"%Y-%m-%d")"

# mysql, ${mysqldump} and some other bin's path  #
mysql="mysql"
mysqldump="mysqldump"

# the directory for story the newest backup  #
test ! -d ${backup_dir} && mkdir -p ${backup_dir}

#备份数据库函数#
mysql_backup1()
{
    # 取所有的数据库名 #
    backname=${database1}.${time}
    dumpfile=${backup_dir}${backname}
    
    #将备份的时间、数据库名存入日志
    echo "------"$(date +'%Y-%m-%d %T')" Beginning database "${database1}" backup--------" >>${logfile}
    ${mysqldump} -u${db_user} -h${db_host} -p${db_password} --skip-extended-insert --databases ${database1} > ${backname}.sql 2>>${logfile} 2>&1
    
    #开始将压缩数据日志写入log
    echo $(date +'%Y-%m-%d %T')" Beginning zip ${dumpfile}.sql" >>${logfile}
    #将备份数据库文件库压成ZIP文件，并删除先前的SQL文件. #
    zip ${backname}.zip ${backname}.sql 2>&1 && rm ${backname}.sql 2>>${logfile} 2>&1 
    
    #将压缩后的文件名存入日志。
    echo "backup file name:"${dumpfile}".zip" >>${logfile}
    echo -e "-------"$(date +'%Y-%m-%d %T')" Ending database "${database1}" backup-------\n" >>${logfile}
}

mysql_backup2()
{
    # mysqldump -ussoServer -pssoServer --skip-extended-insert --databases gws_ssoServer_pro > "gws_ssoServer_pro.${time}".sql
    # 取所有的数据库名 #
    backname=${database2}.${time}
    dumpfile=${backup_dir}${backname}
    
    #将备份的时间、数据库名存入日志
    echo "------"$(date +'%Y-%m-%d %T')" Beginning database "${database2}" backup--------" >>${logfile}
    ${mysqldump} -ussoServer -pssoServer --skip-extended-insert --databases ${database2} --ignore-table=${database2}.sso_user_operate_log > ${backname}.sql 2>>${logfile} 2>&1
    
    #开始将压缩数据日志写入log
    echo $(date +'%Y-%m-%d %T')" Beginning zip ${dumpfile}.sql" >>${logfile}
    #将备份数据库文件库压成ZIP文件，并删除先前的SQL文件. #
    zip ${backname}.zip ${backname}.sql 2>&1 && rm ${backname}.sql 2>>${logfile} 2>&1 
    
    #将压缩后的文件名存入日志。
    echo "backup file name:"${dumpfile}".zip" >>${logfile}
    echo -e "-------"$(date +'%Y-%m-%d %T')" Ending database "${database2}" backup-------\n" >>${logfile}
}

delete_old_backup()
{    
    echo "delete backup file:" >>${logfile}
    # 删除旧的备份 查找出当前目录下七天前生成的文件，并将之删除
    find ${backup_dir} -type f -mtime +${backup_day} | tee delete_list.log | xargs rm -rf
    cat delete_list.log >>${logfile}
}

rsync_mysql_backup()
{
    # rsync 同步到其他Server中 #
    for j in ${web_ip}
    do                
        echo "mysql_backup_rsync to ${j} begin at "$(date +'%Y-%m-%d %T') >>${logfile}
        ### 同步 ###
        rsync -avz --progress --delete $serverPath -e "ssh -p "${ssh_port}" -i "${id_rsa} ${id_rsa_user}@${j}:$clientPath >>${logfile} 2>&1 
        echo "mysql_backup_rsync to ${j} done at "$(date +'%Y-%m-%d %T') >>${logfile}
    done
}

#进入数据库备份文件目录
cd ${backup_dir}

mysql_backup1
mysql_backup2
delete_old_backup
# rsync_mysql_backup

echo -e "========================mysql backup && rsync done at "$(date +'%Y-%m-%d %T')"============================\n\n">>${logfile}
cat ${logfile}
