#Create By inetsurfer
# nginx-split-log.ps1
#Nginx_for Windows 日志定时备份脚本
#为了执行未签名脚本,要在powershell里设置Set-ExecutionPolicy RemoteSigned.
#如需改回默认策略,Set-ExecutionPolicy Restricted,可用Get-ExecutionPolicy查看
#在任务计划中添加 powershell -file Nginx_access_log_Auto_Backup.ps1
#执行时间设置为每天凌晨0:0:0 并勾选“不管用户是否登录都要运行
 

$today = Get-Date
$yesterday = $today.AddDays(-1).Tostring('yyyy-MM-dd')
$Source_File="C:\soft\nginx-1.14.2\logs\access.log"
$Target_File="C:\soft\nginx-1.14.2\logs\history\"+$yesterday+".log"
Remove-Item  $Target_file;
move-Item $Source_file $Target_file
taskkill /fi "imagename eq nginx.EXE" /f

cd C:\soft\nginx-1.14.2\
.\nginx.exe
