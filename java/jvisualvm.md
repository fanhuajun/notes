# javademo

# file
## Install instruction
The module is a standard file operate. You can download the latest version of file-operate from [here](https://github.com/357724264/java-demo/releases), and execute jar by 
- java -jar file-0.0.1-SNAPSHOT-jar-with-dependencies.jar. 

After run the file, then you can see the hello world print on screen

# jmx
## instruction
- jvisualvm  脚本参数
```ruby
JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote"
JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.ssl=false"
JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.authenticate=false"
JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.port=10086"
JAVA_OPTS="$JAVA_OPTS -Djava.rmi.server.hostname=192.168.1.12"   #配置本机IP
```
- 脚本启动命令
```shell
nohup $JAVA_HOME/bin/java $JAVA_OPTS $MAINCLASS start
```

