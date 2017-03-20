@echo off
SET Obj_Length=2
  
SET Obj[0].Name=Test1
SET Obj[0].Value=Hello World
 
SET Obj[1].Name=Test2
SET Obj[1].Value=blahblah
SET Obj_Index=0

for /L %%i in (1,1,5) do (
	SET /A Obj_Index=%Obj_Index% + 1
	@echo %Obj_Index%
	@echo %Obj[1].Name%
	)

pause


