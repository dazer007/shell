#!/bin/bash
# aliyun 云效部署代码 ecs
#https://rdc.aliyun.com/ec/app/148148/env/486545/deploy/config?spm=a2c40.app_config_env_services_strategy.page.16.2acc9984cxoycf
#参考脚本：云效==》基于SLB的滚动发布脚本示例  https://help.aliyun.com/document_detail/57399.html
echo '这里测试脚本是执行了....'

PROG_NAME=$0
ACTION=$1

APP_START_TIMEOUT=120     # 等待应用启动的时间
APP_HOME=/home/admin/application  # 从package.tgz中解压出来的jar包放到这个目录下
JAR_NAME=yuebaoxiao.war # jar包的名字
HEALTH_CHECK_URL=http://127.0.0.1:8080/yuebaoxiao/docs  # 应用健康检查URL
HEALTH_CHECK_URL2=http://127.0.0.1:8080/yuebaoxiao/swagger-ui.html  # 应用健康检查URL
PID=$(ps -ef | grep tomcat9 | grep -v grep | awk '{print $2}')

usage() {
    echo "Usage: $PROG_NAME {start|stop|online|offline|restart}"
    exit 2
}

health_check() {
    exptime=0
    echo "checking ${HEALTH_CHECK_URL}"
    while true
    do
        status_code=`/usr/bin/curl -L -o /dev/null --connect-timeout 5 -s -w %{http_code}  ${HEALTH_CHECK_URL}`
        if [ x$status_code != x200 ];then
            sleep 1
            ((exptime++))
            echo -n -e "\rWait app to pass health check: $exptime..."
        else
            break
        fi
        if [ $exptime -gt ${APP_START_TIMEOUT} ]; then
            echo
            echo 'app start failed'
            exit 1
        fi
    done
    echo "check ${HEALTH_CHECK_URL2} success"
}

start_application() {
    echo "start prepare tomcat"
    PID=$(ps -ef | grep tomcat9 | grep -v grep | awk '{print $2}')
    #判断字符串是否存，-z 不存在
    #kill -0 pid, 经常用来检查一个进程是否存在，存在返回0；不存在返回1
    if [ -f "$PID" ]  && kill -0 "$(cat ${PID_FILE})"  ;then
        echo "Application is running, exit"
        exit 0
    else
       #如果没有启动tomcat,我们直接删除 war, 并且启动 tomcat
       rm -rf /usr/local/tomcat9/${JAR_NAME}*
       rm -rf ${APP_HOME}/${JAR_NAME}
       tar -zxvf /home/tomcat/package.tgz -C ${APP_HOME}
       cp ${APP_HOME}/${JAR_NAME} /usr/localtomcat9/webapp/${JAR_NAME}
       su - tomcat  -c 'nohup /usr/local/tomcat9/bin/startup.sh &'
       echo "Application is running, please wait 2 seconds "
    fi
}

stop_application() {
    PID=$(ps -ef | grep tomcat9 | grep -v grep | awk '{print $2}')
    echo 'pid = '${PID}
    echo "stop prepare tomcat"
    # shell编程——if语句 if -z -n -f -eq -ne -lt https://www.cnblogs.com/wangcp-2014/p/6704375.html
    # shell if -z  如果string 为空
    # if [! -z "$PID" ];  #感叹号是取反的意思
    if [ -z "$PID" ]; then
        echo "tomcat 已经是停止，不用操作, do noting"
    else
        #停止tomcat
         echo "stop tomcat,stop tomcat ,stop tomcat...."
        /usr/local/tomcat9/bin/catalina.sh stop
    fi
}

start() {
    start_application
    health_check
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