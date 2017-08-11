rem git 定时任务
set CMD_BAT="cmd /c %cd%\git-task.bat"

schtasks /create /tn "name" /tr %CMD_BAT% /sc daily /st 11:49