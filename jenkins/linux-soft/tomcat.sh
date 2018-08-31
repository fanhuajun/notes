#########################################################
# 构建 --> send file or execute commands over SSH --> SSH Publishers --> transfer 
#########################################################
#!/bin/bash
cd /home

if [ ! -f "/home/apache-tomcat-8.5.32.tar.gz" ];then
wget http://mirrors.shu.edu.cn/apache/tomcat/tomcat-8/v8.5.32/bin/apache-tomcat-8.5.32.tar.gz
tar xvzf apache-tomcat-8.5.32.tar.gz
else
echo "存在"
fi

/home/apache-tomcat-8.5.32/bin/startup.sh