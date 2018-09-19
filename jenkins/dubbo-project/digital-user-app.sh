# 构建 --> 执行shell --> 命令
#!/bin/bash

MAVENBIN='/usr/share/apache-maven-3.5.4/bin/mvn'
MAVENBUILDCMD="$MAVENBIN clean package install -U -Ptest -Dmaven.test.skip=true"
WORKSPACE='/data/workspace'
WORKSPACE_BI_INTERFACE="$WORKSPACE/digital-bi-interface"
WORKSPACE_USER_INTERFACE="$WORKSPACE/digital-user-interface"
RELEASEPATH="/data/workspace/release"

rm -rf $RELEASEPATH
mkdir -p $RELEASEPATH

cd $WORKSPACE_BI_INTERFACE
$MAVENBUILDCMD

cd $WORKSPACE_USER_INTERFACE
$MAVENBUILDCMD

cd $WORKSPACE/digital-mgtcenter-interface
$MAVENBUILDCMD

cd $WORKSPACE/digital-user-app
$MAVENBUILDCMD

cp -f $WORKSPACE/digital-user-app/target/digital-user-app*.zip $RELEASEPATH/digital-user-app.zip



# 构建 --> send file or execute commands over SSH --> SSH Publishers --> transfers	

#!/bin/bash

RELEASEPATH="/home/luoh03/release/digital-user-app"
AppPath="/data/app-6001-user"

sudo rm -rf $RELEASEPATH
sudo mkdir -p $RELEASEPATH

if [ ! -f "/data/digital-user-app.zip" ]
then
	echo "The digital-user-app file doesn't exist, exit now!"
	exit
fi

IsActiveServer=`ps -ef | grep app-6001-user | grep -v grep | wc -l | tail -n 1`
if [ "$IsActiveServer" != "0" ]
then
	sudo /data/script/app-6001-user stop
fi

IsActiveServer=`ps -ef | grep app-6001-user | grep -v grep | wc -l | tail -n 1`
if [ "$IsActiveServer" != "0" ]
then
	ps -ef | grep app-6001-user | grep -v grep | awk '{print $2}' | 
	while read LINE
	do
		if [ "$LINE" != "" ]
		then
			sudo kill -9 $LINE
		fi		
	done  
fi
cd /data
sudo rm -rf $AppPath/*
sudo mkdir -p $AppPath
sudo unzip digital-user-app.zip
sudo cp -rf /data/digital-user-app*/* $AppPath
sudo /data/script/app-6001-user start
sudo rm -rf  digital-user-app*