rem 需要修改的变量
set SOURCE_FILE="D:\03EBA\source\SAAS\system\vanrui-order\vanrui-order-app"

@echo off
xcopy /s/i/y %SOURCE_FILE%\*  %cd%
rem maven操作
mvn clean package -P dev -U -Dmaven.test.skip=true