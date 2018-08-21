#execute shell

#!/bin/bash

MAVENBIN='/opt/apache-maven-3.3.3/bin/mvn'
MAVENBUILDCMD="$MAVENBIN clean package install -U -Pdev -Dmaven.test.skip=true"
WORKSPACE='/opt/jenkins/apps/jenkins/jenkins_home/jobs/VKDIGITAL_API_BI_DEV/workspace'
WORKSPACE_BI_INTERFACE="$WORKSPACE/digital-bi-interface"
RELEASEPATH="/opt/jenkins/apps/jenkins/jenkins_home/jobs/VKDIGITAL_API_BI_DEV/workspace/release"

rm -rf $RELEASEPATH
mkdir -p $RELEASEPATH
cd $WORKSPACE_BI_INTERFACE
$MAVENBUILDCMD

cd $WORKSPACE/digital-bi-app
$MAVENBUILDCMD


cp -f $WORKSPACE/digital-bi-app/target/digital-bi-app*.zip $RELEASEPATH/digital-bi-app.zip

# send files or execute commands over ssh
#!/bin/bash

RELEASEPATH="/home/digtaladm/release/digital-bi-app"
AppPath="/data/app-6008-bi"

sudo rm -rf $RELEASEPATH
sudo mkdir -p $RELEASEPATH

if [ ! -f "/home/digtaladm/release/digital-bi-app.zip" ]
then
	echo "The digital-bi-app file doesn't exist, exit now!"
	exit
fi

sudo mv /home/digtaladm/release/digital-bi-app.zip $RELEASEPATH
cd $RELEASEPATH
sudo unzip digital-bi-app.zip

IsActiveServer=`ps -ef | grep app-6008-bi | grep -v grep | wc -l | tail -n 1`
if [ "$IsActiveServer" != "0" ]
then
	sudo /data/script/app-6008-bi stop
fi

IsActiveServer=`ps -ef | grep app-6008-bi | grep -v grep | wc -l | tail -n 1`
if [ "$IsActiveServer" != "0" ]
then
	ps -ef | grep app-6008-bi | grep -v grep | awk '{print $2}' | 
	while read LINE
	do
		if [ "$LINE" != "" ]
		then
			sudo kill -9 $LINE
		fi		
	done  
fi

sudo rm -rf $AppPath/*
sudo cp -rf /home/digtaladm/release/digital-bi-app/digital-bi-app*/* $AppPath
sudo /data/script/app-6008-bi start

