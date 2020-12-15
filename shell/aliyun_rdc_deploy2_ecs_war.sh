#!/bin/bash
# aliyun 云效部署代码 ecs
#https://rdc.aliyun.com/ec/app/148148/env/486545/deploy/config?spm=a2c40.app_config_env_services_strategy.page.16.2acc9984cxoycf
#参考脚本：云效==》基于SLB的滚动发布脚本示例  https://help.aliyun.com/document_detail/57399.html
echo '这里测试脚本是执行了....，使用的是tomcat用户执行的脚本'

PROG_NAME=$0
ACTION=$1

APP_START_TIMEOUT=120     # 等待应用启动的时间
APP_HOME=/home/tomcat/application  # 从package.tgz中解压出来的jar包放到这个目录下
TOMCAT_HOME=/usr/local/tomcat9/ #tomcat根目录
JAR_NAME=yuebaoxiao # jar包的名字 yuebaoxiao.war
HEALTH_CHECK_URL=http://127.0.0.1:8080/yuebaoxiao/docs  # 应用健康检查URL
HEALTH_CHECK_URL2=http://127.0.0.1:8080/yuebaoxiao/swagger-ui.html  # 应用健康检查URL
PID=$(ps -ef | grep tomcat9 | grep -v grep | awk '{print $2}') #查看指定应用的端口
PORT_LISTENING=$(netstat -tln|grep 8080) #查看指定端口是否在运行
PID_FILE=${APP_HOME}/pid   # 应用的pid会保存到这个文件中

usage() {
    echo "Usage: $PROG_NAME {start|stop|online|offline|restart|delete}"
    exit 2
}

health_check() {
    exptime=0
    echo "checking 01 ${HEALTH_CHECK_URL}"
    echo "checking 02 ${HEALTH_CHECK_URL2}"
    while true
    do
        status_code=`/usr/bin/curl -L -o /dev/null --connect-timeout 5 -s -w %{http_code}  ${HEALTH_CHECK_URL}`
        if [ x$status_code != x200 ];then
            sleep 1
            ((exptime++))
            echo -n -e "\r健康检测：Wait app to pass health check: $exptime..."
        else
            break
        fi
        if [ $exptime -gt ${APP_START_TIMEOUT} ]; then
            echo
            echo '健康检测：app start failed (持续两分钟进行检查，应用还是没有启动)，这里进行日志打印'
            echo ''
            echo ''
            echo '下面将开始打印所有tomcat日志'
            # cat -n catalina.out |tail -100  显示最后100行
            cat  ${TOMCAT_HOME}logs/catalina.out |tail -200
            exit 1
        fi
    done
    echo "健康检测：check ${HEALTH_CHECK_URL2} success"
}

start_application() {
    echo "准备启动tomcat start prepare tomcat"
    echo '准备启动tomcat start_application pid Listening = '${PORT_LISTENING}
    #判断字符串是否存，-z 不存在
    #kill -0 pid, 经常用来检查一个进程是否存在，存在返回0；不存在返回1
    if [ -z "$PORT_LISTENING" ];then
        #如果没有启动tomcat,我们直接删除 war, 并且启动 tomcat
       rm -rf ${TOMCAT_HOME}webapps/${JAR_NAME}*
       rm -rf ${APP_HOME}/${JAR_NAME}.war
       rm -rf ${TOMCAT_HOME}logs/*
       tar -zxvf /home/tomcat/package.tgz -C ${APP_HOME}
       cp ${APP_HOME}/${JAR_NAME}.war ${TOMCAT_HOME}webapps/${JAR_NAME}.war
       if [ -f  ${TOMCAT_HOME}webapps/${JAR_NAME}.war ];then
            echo "${TOMCAT_HOME}webapps/${JAR_NAME}.war 文件已经存在, copy sucess !!"
       fi
       #su - tomcat  -c "nohup ${TOMCAT_HOME}bin/startup.sh &"
       nohup ${TOMCAT_HOME}bin/startup.sh &
       echo $! > ${PID_FILE} #将上一步的进程号码保存起来
       echo "tomcat正在运行，Application is running, please wait 2 seconds "
    else
        echo "tomcat之前就是运行状态，目前直接退出；Application is running, exit"
    fi
}

stop_application() {
    echo 'stop_application pid = '${PID}
    echo 'stop_application pid Listening = '${PORT_LISTENING}
    echo "stop prepare tomcat"
    # shell编程——if语句 if -z -n -f -eq -ne -lt https://www.cnblogs.com/wangcp-2014/p/6704375.html
    # shell if -z  如果string 为空
    # if [! -z "$PID" ];  #感叹号是取反的意思
    if [ -z "$PORT_LISTENING" ]; then
        echo "tomcat 已经是停止，不用操作, do noting"
    else
        #停止tomcat
         echo "stop tomcat,stop tomcat ,stop tomcat...."
         ${TOMCAT_HOME}bin/catalina.sh stop
         #su - tomcat  -c "${TOMCAT_HOME}bin/catalina.sh stop"
         echo ''
         sleep 2
         echo "stop tomcat sucess(停止tomcat成功) "
    fi
}

start() {
    start_application
    echo 'start_application 执行完毕..'
    health_check
    echo 'health_check 执行完毕,应用是否启动，最好手工检测一下'
}

stop() {
    stop_application
}

restart() {
  start
  stop
}


#入口函数必须有
case "$ACTION" in
    start)
        start
    ;;
    stop)
        stop
    ;;
    online)
        online
    ;;
    offline)
        offline
    ;;
    restart)
        stop
        start
    ;;
    *)
        usage
    ;;
esac