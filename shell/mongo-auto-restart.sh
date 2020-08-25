#!/bin/bash
#检查是否是root用户
 
if [ $(id -u) != "0" ]
then
echo "Not the root user! Try using sudo command!"
exit 1
fi
#监控服务是是否存活，这里是通过监控端口来监控服务，这里也可以替换为其他服务
netstat -anop | grep 0.0.0.0:47071
if [ $? -ne 1 ]
then
exit
fi
 
echo $(date +%T%n%F)" Restart mongodb Services " >> mongodb.log
#重启服务
systemctl restart mongod.service  
