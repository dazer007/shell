#!/usr/bin/env bash

## 1： 查看进程id,示例1
## echo `ps -ef | grep $CATALINA_HOME/bin/tomcat-juli.jar | grep -v grep | tr -s " "|cut -d" " -f2`
## 1： 查看进程id,示例2
## echo `ps -ef | grep tomcat8-8081 | grep -v grep | awk '{print $2}'`


PID=$(ps -ef | grep tomcat8-8081 | grep -v grep | awk '{print $2}')
#判断字符串是否存，-z 不存在
if [ -z "$PID" ];then
    echo Application is already stopped !!!! pid is empty
else
    echo pid = $PID is killed !!!!...
    kill $PID
fi


#sleep 1
#ping -i 1 -c 1 127.0.0.1 > null

##删除之前的日志
rm -rf /usr/local/tomcat8-8081/logs/*
rm -rf /usr/local/tomcat8-8081/bin/logs/mall/*
echo logs delete success !!!
#sleep 1
#ping -i 1 -c 1 127.0.0.1 > null


#这里可以先进行备份以前的jar包
#currentTime = $(date + '%Y%m%d%H%M%S')

## 启动.jar文件 示例
## nohup java -jar /root/javademo/javademo-0.0.1-SNAPSHOT.jar > nohup.log 2>&1 &
## 启动 .war文件 示例
#nohup ./usr/local/tomcat8-8081/bin/startup.sh &
#./catalicat.sh run
systemctl stop  tomcat8-8081.service
systemctl start tomcat8-8081.service
systemctl status tomcat8-8081.service
#sleep 1
#ping -i 1 -c 1 127.0.0.1 > null
echo application startup dazer !!!!....
echo .
echo .
echo .


##最后我们需要的话，查看日志
##tail -f /usr/local/tomcat8-8081/logs/catalina.out
##tail -f /usr/local/tomcat8-8081/bin/logs/mall/mall_business.log
##tail -f /usr/local/tomcat8-8081/webapps/logs/mall/mall_business.log

#下面命令是copy和查看日志，下面全部放到目前脚本执行完毕，在idea上传完毕，就执行该语句
#sleep 30
#ping -i 1 -c 120 127.0.0.1 > null
#echo 1
#echo 1
#echo i am move copy tomcat8-8081 war to tomcat8
#rm -rf /usr/local/tomcat8/webapps/mall.war
#cp /usr/local/tomcat8-8081/webapps/mall.war /usr/local/tomcat8/webapps/mall.war
#echo copy sucesss!!!


#clean package  -Dmaven.test.skip=true
#tail -f /usr/local/tomcat8-8081/bin/logs/mall/mall_business.log
#下面是执行当前该shell脚本的命令
#sudo chmod 777 /usr/local/sh/tomcat-restart.sh;
#sh /usr/local/sh/tomcat-restart.sh