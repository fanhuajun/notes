#!/bin/bash
# This shell script takes care of starting and stopping program.
#
# chkconfig: - 90 10
# processname: app-6005-user

# Source function library.
. /etc/rc.d/init.d/functions


ttl_version="2.1.0"
prog=tomcat-8080-api
prog_web=/data/web-8080-api
prog_keyword=tomcat-8080-api
prog_port=8080
prog_dir=/usr/local/tomcat8/tomcat-8080-api
prog_log_dir=$prog_dir/logs
prog_std_log="/dev/null"
prog_gc_log=$prog_log_dir/gc.log
java_work_dir=$prog_dir/work

[ -d $prog_dir ] || exit 1

RETVAL=0


##########################################################################################
JAVA_HOME=/usr/local/jdk1.8
CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME/jre/lib
MAINCLASS=ooh/bravo/container/spring/Startup
BASE_OPTS="-Dserver.home=$prog_dir -Dlogback.configurationFile=$prog_dir/conf/logback.xml -Djms.clientId=$prog_keyword"
TLIB_OPTS="-Xbootclasspath/a:$prog_dir/lib/transmittable-thread-local-$ttl_version.jar -javaagent:$prog_dir/lib/transmittable-thread-local-$ttl_version.jar"
JAVA_OPTS="$JAVA_OPTS -server -Xms256m -Xmx512m -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=256m -Xss256k"
JAVA_OPTS="$JAVA_OPTS -XX:+UseG1GC -XX:MaxGCPauseMillis=200 -XX:InitiatingHeapOccupancyPercent=55 -XX:G1ReservePercent=15"
JAVA_OPTS="$JAVA_OPTS -XX:MaxTenuringThreshold=15 -XX:ParallelGCThreads=8 -XX:+UnlockExperimentalVMOptions"
JAVA_OPTS="$JAVA_OPTS -XX:+DisableExplicitGC -XX:+UseFastAccessorMethods -XX:SoftRefLRUPolicyMSPerMB=0"
JAVA_OPTS="$JAVA_OPTS -XX:+PrintGC -XX:+PrintHeapAtGC -XX:+PrintGCDetails -XX:+PrintGCDateStamps"
JAVA_OPTS="$JAVA_OPTS -XX:+PrintGCTimeStamps -XX:+PrintGCCause"
JAVA_OPTS="$JAVA_OPTS -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=$prog_log_dir/"
JAVA_OPTS="$JAVA_OPTS -Xloggc:$prog_gc_log"
JAVA_OPTS="$JAVA_OPTS $BASE_OPTS $TLIB_OPTS"
##########################################################################################

if [ ! -d $JAVA_HOME ];then
     echo "JAVA_HOME Not defined";
     exit 1
fi


start() {
    prog_pid=`ps ax | grep -v grep | grep "clientId=$prog_keyword" | awk '{print $1}'`
    prog_num=`ps ax | grep -v grep | grep "clientId=$prog_keyword" | wc -l`
    if [ $prog_num != "0" ];then
        echo $prog" already running...."
        exit 1
    fi

    [ -d $prog_log_dir ] || mkdir -p $prog_log_dir

#    [ -f $prog_std_log ] && rm -rf $prog_std_log || touch $prog_std_log

    [ -f $prog_gc_log ] && rm -rf $prog_gc_log || touch $prog_gc_log


    echo -n $"Starting $prog "
    cd $prog_dir/bin
    nohup $JAVA_HOME/bin/java $JAVA_OPTS $MAINCLASS start > $prog_std_log 2>&1 &
    sleep 3s
    prog_num=`ps ax | grep -v grep | grep java | grep "clientId=$prog_keyword" | wc -l`
    if [ $prog_num != "0" ];then
        RETVAL=0
        success
        echo
    else
        RETVAL=1
        failure
        echo
    fi
    return $RETVAL
}



stop() {
    prog_pid=`ps ax | grep -v grep | grep "clientId=$prog_keyword" | awk '{print $1}'`
    prog_num=`ps ax | grep -v grep | grep "clientId=$prog_keyword" | wc -l`
    echo -n $"Shutting down $prog "
    if [ $prog_num = "0" ];then
          RETVAL="1"
    else
          cd $APP_ROOT/bin
          $JAVA_HOME/bin/java $BASE_OPTS $MAINCLASS stop > $prog_std_log 2>&1 &
          sleep 3s
          prog_num=`ps ax | grep -v grep | grep "clientId=$prog_keyword" | wc -l`
          if [ $prog_num != "0" ];then
               kill -9 $prog_pid 2>&1 > /dev/null
               RETVAL=$?
          else
               RETVAL=0
          fi
    fi
    if [ $RETVAL -eq 0 ];then
#          [ -f $prog_std_log ] && rm -rf $prog_std_log || touch $prog_std_log
          [ -f $prog_gc_log ] && rm -rf $prog_gc_log || touch $prog_gc_log
          success
          echo
    else
          failure
           echo
    fi
    return $RETVAL
}


status() {
    prog_pid=`ps ax | grep -v grep | grep "clientId=$prog_keyword" | awk '{print $1}'`
    prog_num=`ps ax | grep -v grep | grep "clientId=$prog_keyword" | wc -l`
    if [ $prog_num != "0" ];then
          echo "$prog (pid $prog_pid) is running..."
          return 0
    else
          echo "$prog is stopped"
          return 3
    fi
}


case "$1" in
        start)
            start
            ;;
        stop)
            stop
            ;;
        status)
            status
            ;;
        restart)
            stop
            start
            ;;
        *)
            echo "Usage: $0 {start|stop|status|restart}"
            exit 1
esac
exit $RETVAL
