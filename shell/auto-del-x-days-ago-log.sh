# auto-del-x-days-ago-log.sh
# linux  删除日志文件
# 1：删除所有的tomcat超过1天的*.log日志
  find /usr/local/tomcat8/logs/ -mtime +1 -type f -name '*.log' -exec rm -rf {} \;
  find /usr/local/tomcat8/logs/ -mtime +1 -type f -name '*.txt' -exec rm -rf {} \;
  find /usr/local/tomcat8/logs/ -mtime +1 -type f -name '*.out' -exec rm -rf {} \;
  find /usr/local/tomcat8-8081/bin/logs/mall/ -mtime +5 -type f -name '*.gz' -exec rm -rf {} \; 

  find /usr/local/tomcat8-8081/logs/ -mtime +1 -type f -name '*.log' -exec rm -rf {} \;
  find /usr/local/tomcat8-8081/logs/ -mtime +1 -type f -name '*.txt' -exec rm -rf {} \;
  find /usr/local/tomcat8-8081/logs/ -mtime +1 -type f -name '*.out' -exec rm -rf {} \;
  find /usr/local/tomcat8-8081/bin/logs/mall/ -mtime +5 -type f -name '*.gz' -exec rm -rf {} \; 
# 2：删除所有qcuredb_开头的日志文件
find /data/db_backup/ -mtime +2 -name "*.sql.zip" -exec rm -rf {} \;  
# 3：删除所有类型文件包含文件夹 nginx 日志； * 比较危险，删除文件夹 或者 不是 日志文件也会被清理
find /usr/local/nginx/logs -mtime +10 -name "*.log" -exec rm -rf {} \;

