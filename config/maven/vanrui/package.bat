rem 项目POM文件目录
rem SET Obj[0].PomPath1=\03EBA\source\SAAS\system\vanrui-man\vanrui-man-web
rem SET Obj[0].PomPath2=\03EBA\source\SAAS\system\vanrui-portal

rem SET Obj[0].PomPath3=\03EBA\source\SAAS\system\vanrui-man\vanrui-man-app
SET Obj[0].PomPath4=\03EBA\source\SAAS\system\vanrui-message\vanrui-message-app
rem SET Obj[0].PomPath5=\03EBA\source\SAAS\system\vanrui-order\vanrui-order-app
rem SET Obj[0].PomPath6=\03EBA\source\SAAS\system\vanrui-org\vanrui-org-app
rem SET Obj[0].PomPath7=\03EBA\source\SAAS\system\vanrui-partner\vanrui-partner-app
rem SET Obj[0].PomPath8=\03EBA\source\SAAS\system\vanrui-user\vanrui-user-app


rd /s /q d:\vanrui-package	
md d:\vanrui-package

FOR /F "usebackq delims=.= tokens=1-3" %%I IN (`SET Obj[0]`) DO (
	@echo %%k
  	d:  	
	cd %%K
	mvn clean package -P dev -U -Dmaven.test.skip=true
	
	xcopy target\*  \vanrui-package /c/q/e/y
	rem pause
)


