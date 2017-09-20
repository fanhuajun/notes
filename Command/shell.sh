### mosquitto
mosquitto_pub -t pub/test1 -h 112.74.58.249 -p 1884 -u mosquitto -P vanrui@123 -m helloWorld   #发布
mosquitto_sub -t pub/+ -h 112.74.58.249 -p 1884 -u mosquitto -P vanrui@123   #订阅

ps -ef | grep tomcat
kill  -9   33889
cd /data/
./script/tomcat-8087-man restart
./script/tomcat-8087-man restart


