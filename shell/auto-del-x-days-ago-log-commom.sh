#公用删除

# 删除所有qcuredb_开头的日志文件
find /data/db_backup/ -mtime +5 -name "qcuredb_*" -exec rm -rf {} \;

# 1：# linux  删除日志文件
find /var/log/nginx -mtime +3 -name "*.log_" -exec rm -rf {} \;

# 2: 删除rsyncd 备份两台服务器数据的记录日志,在A-->B, 在服务器B 上面进行删除日志.
rm -rf /var/log/rsyncd.log


# 3: tomcat相关的日志清理
find /usr/local/tomcat9/logs/ -mtime +1 -type f -name '*.log'  -exec rm -rf {} \;
find /usr/local/tomcat9/logs/ -mtime +1 -type f -name '*.gz' -exec rm -rf {} \;
find /usr/local/tomcat9/logs/ -mtime +1 -type f -name '*.tmp' -exec rm -rf {} \;
find /usr/local/tomcat9/logs/ -mtime +1 -type f -name '*.txt' -exec rm -rf {} \;
find /usr/local/tomcat9/bin/logs/qcure/ -mtime +1 -type f -name '*.gz' -exec rm -rf {} \;


# 3-2： 半夜凌晨 关闭tomcat 删除日志，然后重新启动
rm -f /usr/local/tomcat9/logs/catalina.out
#/usr/local/tomcat9/bin/catalina.sh start 进阶写法，如下； 等保测试要求使用非root账号启动tomcat
su - tomcat  -c '/usr/local/tomcat9/bin/catalina.sh start'