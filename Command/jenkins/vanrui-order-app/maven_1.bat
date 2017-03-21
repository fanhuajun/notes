@echo off
xcopy /s/i/y D:\03EBA\source\SAAS\system\vanrui-user\*  %cd%
cd vanrui-user-app/
rem maven操作
mvn clean package -P dev -U -Dmaven.test.skip=true