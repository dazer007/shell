echo 'kaishi setting'
set APPLICATION_NAME=tianrongxin_SV_VPN
@REM 第一步，杀死应用程序...; /f：强制，/im：指定进程名称;
@REM taskkill /fi "imagename eq nginx.EXE" /f
taskkill /f /im SV_Client.exe 
echo '%APPLICATION_NAME%  have kill succes....'

@REM cd
C:
cd C:\Program Files (x86)\VONE\TopSecSV\
echo 'cd command success..'

@REM start是windows启动命令；
start SV_Client.exe
@REM success
echo '%APPLICATION_NAME% start success '
pause
exit
exit



