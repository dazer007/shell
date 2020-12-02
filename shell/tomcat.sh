#使用子账号，启动tomcat
chown -R tomcat:tomcat /usr/local/tomcat9

su - tomcat  -c '/usr/local/tomcat9/bin/catalina.sh stop'
su - tomcat  -c '/usr/local/tomcat9/bin/catalina.sh start'
su - tomcat  -c '/usr/local/tomcat9/bin/catalina.sh run'
su - tomcat  -c '/usr/local/tomcat9/bin/shutdown.sh'
su - tomcat  -c 'nohup /usr/local/tomcat9/bin/startup.sh &'