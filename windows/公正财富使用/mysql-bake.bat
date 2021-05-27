@echo off
echo 导出开始
echo 脚本来源  Windows下MySQL数据库备份计划 https://blog.csdn.net/qq_17302255/article/details/81396508
set yy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%
if /i %time:~0,2% lss 10 set hh=0%time:~1,1%
if /i %time:~0,2% geq 10 set hh=%time:~0,2%
set mn=%time:~3,2%
set ss=%time:~6,2%
set date=%yy%%mm%%dd%
set time=%hh%%mn%%ss%
set filename=%date%_%time%
mysqldump.exe -uroot -pgzcf2019..xx --opt --default-character-set=utf8mb4 -e --triggers -R --hex-blob --flush-logs -x gzcfdb> C:/soft/script/db_backup/gzcfdb_%filename%.sql
echo 导出已经完成
#pause