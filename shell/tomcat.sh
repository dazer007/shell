#使用子账号，启动tomcat
#新增tomcat用户
useradd tomcat
#将tomcat目录owner改为tomcat
chown -R tomcat:tomcat /usr/local/tomcat9  #把已有的目录变成tomcat的权限
#切换到小权限用户
su - tomcat

su - tomcat  -c '/usr/local/tomcat9/bin/catalina.sh stop'
su - tomcat  -c '/usr/local/tomcat9/bin/catalina.sh start'
su - tomcat  -c '/usr/local/tomcat9/bin/catalina.sh run'
su - tomcat  -c '/usr/local/tomcat9/bin/shutdown.sh'
su - tomcat  -c 'nohup /usr/local/tomcat9/bin/startup.sh &'  #打印日志到