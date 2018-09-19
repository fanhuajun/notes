#########################################################
# 构建 --> send file or execute commands over SSH --> SSH Publishers --> transfers
#########################################################
#!/bin/bash
cd /home

if [ ! -f "/home/apache-tomcat-8.5.32.tar.gz" ];then
	# http://mirrors.hust.edu.cn/apache/tomcat/tomcat-8/v8.5.33/src/apache-tomcat-8.5.33-src.tar.gz
wget http://mirrors.hust.edu.cn/apache/tomcat/tomcat-8/v8.5.33/bin/apache-tomcat-8.5.33.tar.gz
tar xvzf apache-tomcat-*.tar.gz
else
echo "存在"
fi


/home/apache-tomcat-*/bin/shutdown.sh
/home/apache-tomcat-*/bin/startup.sh

mkdir /home/sit
cd /home/sit
git clone https://git.vankeservice.com/DigitalServiceStudio/DigitalService.git

cd /home/sit/DigitalService/digital-user-app
mvn clean package install -U -Pdev -Dmaven.test.skip=true

