#########################################################
# 构建 --> send file or execute commands over SSH --> SSH Publishers --> transfer 
#########################################################
https://www.cnblogs.com/Eivll0m/p/5446311.html
cd /home/apache-tomcat-8.5.33/lib
wget http://central.maven.org/maven2/org/apache/tomcat/tomcat-catalina-jmx-remote/8.5.33/tomcat-catalina-jmx-remote-8.5.33.jar

wget  http://repo.typesafe.com/typesafe/maven-releases/cmdline-jmxclient/cmdline-jmxclient/0.10.3/cmdline-jmxclient-0.10.3.jar

java -jar cmdline-jmxclient-0.10.3.jar 

java -jar cmdline-jmxclient-0.10.3.jar - 47.92.201.160:12345 java.lang:type=Memory NonHeapMemoryUsage




JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false"
JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.port=12345 -Djava.rmi.server.hostname=192.168.1.100"


wget https://raw.githubusercontent.com/fanhuajun/notes/master/jenkins/linux-soft/startupsh/tomcat-startup.sh