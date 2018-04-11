SET Obj_Length=2
  
SET Obj[0].Name=Test1
SET Obj[0].Value=Hello World
  
SET Obj[1].Name=Test2
SET Obj[1].Value=blahblah


SET Obj_Index=0
  
:LoopStart
IF %Obj_Index% EQU %Obj_Length% GOTO :EOF
SET Obj_Current.Name=0
SET Obj_Current.Value=0

FOR /F "usebackq delims=.= tokens=1-3" %%I IN (`SET Obj[%Obj_Index%]`) DO (
  SET Obj_Current.%%J=%%K
)

@ECHO Name = %Obj_Current.Name%
@ECHO Value = %Obj_Current.Value%
SET /A Obj_Index=%Obj_Index% + 1
@echo %Obj_Index%
set orderPOM=\03EBA\source\SAAS\system\vanrui-order\vanrui-order-app
d: 
cd %orderPOM%
mvn clean package -P test -U -Dmaven.test.skip=true	

GOTO LoopStart

:EOF


