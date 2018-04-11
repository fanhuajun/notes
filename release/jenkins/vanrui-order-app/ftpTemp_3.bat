rem ftp 操作start

rem 需要修改的变量
set DESTINATION_DIR="/data/app-6009-order"

rem 不需要修改的变量
set SOURCE_FILE_DIR="%cd%/target/*.zip"
set FTP_DIR="D:/ftp1.txt"
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