#公用删除

killTomcat() {
      #可能存在多个进程
      PID=$(ps -ef | grep tomcat9 | grep -v grep | awk '{print $2}')
      echo pid is $PID

      # 删除方式1，只删除一个进程
      #判断字符串是否存，-z 不存在
#      if [ -z "$PID" ];then
#            echo Application is already stopped !!!! pid is empty
#       else
#           echo pid = $PID is killed !!!!...
#           kill $PID
#      fi

      # 删除方式2，for循环删除
      if [ -z "$PID" ]; then
          echo "Application is already stopped !!!! pid is empty"
      else
          for item in $PID
              do
                echo "杀死进程pid=" $item
                kill -9 $item
              done
          echo "tomcat pid ====>" $PID
      fi
}

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
su - tomcat  -c '/usr/local/tomcat9/bin/catalina.sh stop'
killTomcat
rm -f /usr/local/tomcat9/logs/catalina.out
#/usr/local/tomcat9/bin/catalina.sh start 进阶写法，如下； 等保测试要求使用非root账号启动tomcat
su - tomcat  -c '/usr/local/tomcat9/bin/catalina.sh start'
