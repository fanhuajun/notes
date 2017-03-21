rem ftp 操作start

set FTP_DIR="D:/ftp1.txt"
set SOURCE_FILE_DIR="C:/Users/fanhuajun/.jenkins/workspace/Pro3/vanrui-user-app/target/vanrui*.zip"
set DESTINATION_DIR="/data/fan"

@Echo Off
Echo open 10.1.251.16 21>%FTP_DIR%
Echo root>>%FTP_DIR%
Echo Writ16@Pdwy>>%FTP_DIR%
Echo cd %DESTINATION_DIR% >>%FTP_DIR%
Echo put %SOURCE_FILE_DIR%>>%FTP_DIR%
Echo bye>>%FTP_DIR%
@Echo on
cd ..
ftp -s:%FTP_DIR%
del %FTP_DIR% /f
Pause