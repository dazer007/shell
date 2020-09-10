# auto-del-x-days-ago-log.sh
# linux  删除日志文件
# 1：删除所有的tomcat超过1天的*.log日志

find /usr/local/logs/iot-eureka/ -mtime +1 -type f -name '*.gz'  -exec rm -rf {} \;
find /usr/local/logs/iot-eureka/ -mtime +1 -type f -name '*.gz' -exec rm -rf {} \;
find /usr/local/logs/iot-eureka/ -mtime +1 -type f -name '*.tmp' -exec rm -rf {} \;

find /usr/local/logs/iot-gateway-alarmlinkage/ -mtime +1 -type f -name '*.gz'  -exec rm -rf {} \;
find /usr/local/logs/iot-gateway-alarmlinkage/ -mtime +1 -type f -name '*.gz' -exec rm -rf {} \;
find /usr/local/logs/iot-gateway-alarmlinkage/ -mtime +1 -type f -name '*.tmp' -exec rm -rf {} \;

find /usr/local/logs/iot-gateway-base/  -type f -name '*.gz'  -exec rm -rf {} \;
find /usr/local/logs/iot-gateway-base/  -type f -name '*.gz' -exec rm -rf {} \;
find /usr/local/logs/iot-gateway-base  -type f -name '*.tmp' -exec rm -rf {} \;

find /usr/local/logs/iot-gateway-schedulejob/  -type f -name '*.gz'  -exec rm -rf {} \;
find /usr/local/logs/iot-gateway-schedulejob/  -type f -name '*.gz' -exec rm -rf {} \;
find /usr/local/logs/iot-gateway-schedulejob/  -type f -name '*.tmp' -exec rm -rf {} \;

find /usr/local/logs/iot-gateway-syslog/ -type f -name '*.gz'  -exec rm -rf {} \;
find /usr/local/logs/iot-gateway-syslog/ -type f -name '*.gz' -exec rm -rf {} \;
find /usr/local/logs/iot-gateway-syslog/ -type f -name '*.tmp' -exec rm -rf {} \;


find /usr/local/logs/mw-airconditioning-hailin/ -mtime +1 -type f -name '*.gz'  -exec rm -rf {} \;
find /usr/local/logs/mw-airconditioning-hailin/ -mtime +1 -type f -name '*.gz' -exec rm -rf {} \;
find /usr/local/logs/mw-airconditioning-hailin/ -mtime +1 -type f -name '*.tmp' -exec rm -rf {} \;

find /usr/local/logs/mw-automobile-baidu/ -mtime +1 -type f -name '*.gz'  -exec rm -rf {} \;
find /usr/local/logs/mw-automobile-baidu/ -mtime +1 -type f -name '*.gz' -exec rm -rf {} \;
find /usr/local/logs/mw-automobile-baidu/ -mtime +1 -type f -name '*.tmp' -exec rm -rf {} \;

find /usr/local/logs/mw-bus-wanfeng/ -mtime +1 -type f -name '*.gz'  -exec rm -rf {} \;
find /usr/local/logs/mw-bus-wanfeng/ -mtime +1 -type f -name '*.gz' -exec rm -rf {} \;
find /usr/local/logs/mw-bus-wanfeng/ -mtime +1 -type f -name '*.tmp' -exec rm -rf {} \;

find /usr/local/logs/mw-carpark-jiehun/ -mtime +1 -type f -name '*.gz'  -exec rm -rf {} \;
find /usr/local/logs/mw-carpark-jiehun/ -mtime +1 -type f -name '*.gz' -exec rm -rf {} \;
find /usr/local/logs/mw-carpark-jiehun/ -mtime +1 -type f -name '*.tmp' -exec rm -rf {} \;

find /usr/local/logs/mw-face-wangfeng/ -mtime +1 -type f -name '*.gz'  -exec rm -rf {} \;
find /usr/local/logs/mw-face-wangfeng/ -mtime +1 -type f -name '*.gz' -exec rm -rf {} \;
find /usr/local/logs/mw-face-wangfeng/ -mtime +1 -type f -name '*.tmp' -exec rm -rf {} \;

find /usr/local/logs/mw-informationpublish-chinashine/ -mtime +1 -type f -name '*.gz'  -exec rm -rf {} \;
find /usr/local/logs/mw-informationpublish-chinashine/ -mtime +1 -type f -name '*.gz' -exec rm -rf {} \;
find /usr/local/logs/mw-informationpublish-chinashine/ -mtime +1 -type f -name '*.tmp' -exec rm -rf {} \;

find /usr/local/logs/mw-internetbehavior-sangfor/ -mtime +1 -type f -name '*.gz'  -exec rm -rf {} \;
find /usr/local/logs/mw-internetbehavior-sangfor/ -mtime +1 -type f -name '*.gz' -exec rm -rf {} \;
find /usr/local/logs/mw-internetbehavior-sangfor/ -mtime +1 -type f -name '*.tmp' -exec rm -rf {} \;

find /usr/local/logs/mw-light-kuaisicong/ -mtime +1 -type f -name '*.gz'  -exec rm -rf {} \;
find /usr/local/logs/mw-light-kuaisicong/ -mtime +1 -type f -name '*.gz' -exec rm -rf {} \;
find /usr/local/logs/mw-light-kuaisicong/ -mtime +1 -type f -name '*.tmp' -exec rm -rf {} \;

find /usr/local/logs/mw-soilirrigation-splant/ -mtime +1 -type f -name '*.gz'  -exec rm -rf {} \;
find /usr/local/logs/mw-soilirrigation-splant/ -mtime +1 -type f -name '*.gz' -exec rm -rf {} \;
find /usr/local/logs/mw-soilirrigation-splant/ -mtime +1 -type f -name '*.tmp' -exec rm -rf {} \;

find /usr/local/logs/mw-video-haikang/ -mtime +1 -type f -name '*.gz'  -exec rm -rf {} \;
find /usr/local/logs/mw-video-haikang/ -mtime +1 -type f -name '*.gz' -exec rm -rf {} \;
find /usr/local/logs/mw-video-haikang/ -mtime +1 -type f -name '*.tmp' -exec rm -rf {} \;

find /usr/local/logs/mw-visualintercom-taichuan/ -mtime +1 -type f -name '*.gz'  -exec rm -rf {} \;
find /usr/local/logs/mw-visualintercom-taichuan/ -mtime +1 -type f -name '*.gz' -exec rm -rf {} \;
find /usr/local/logs/mw-visualintercom-taichuan/ -mtime +1 -type f -name '*.tmp' -exec rm -rf {} \;

find /usr/local/logs/mw-wifi-huawei/ -mtime +1 -type f -name '*.gz'  -exec rm -rf {} \;
find /usr/local/logs/mw-wifi-huawei/ -mtime +1 -type f -name '*.gz' -exec rm -rf {} \;
find /usr/local/logs/mw-wifi-huawei/ -mtime +1 -type f -name '*.tmp' -exec rm -rf {} \;

find /usr/local/logs/iot-platform-base/ -type f -name '*.gz'  -exec rm -rf {} \;
find /usr/local/logs/iot-platform-base/ -type f -name '*.gz' -exec rm -rf {} \;
find /usr/local/logs/iot-platform-base/ -type f -name '*.tmp' -exec rm -rf {} \;

#find /usr/local/logs/iot-platform-syslog/ -type f -name '*.gz'  -exec rm -rf {} \;
#find /usr/local/logs/iot-platform-syslog/ -type f -name '*.gz' -exec rm -rf {} \;
#find /usr/local/logs/iot-platform-syslog/ -type f -name '*.tmp' -exec rm -rf {} \;

#find /usr/local/logs/iot-platform-alarmlinkage/ -mtime +1 -type f -name '*.gz'  -exec rm -rf {} \;
#find /usr/local/logs/iot-platform-alarmlinkage/ -mtime +1 -type f -name '*.gz' -exec rm -rf {} \;
#find /usr/local/logs/iot-platform-alarmlinkage/ -mtime +1 -type f -name '*.tmp' -exec rm -rf {} \;

# 2：删除所有qcuredb_开头的日志文件
find /usr/local2/mysql_backup/ -mtime +10 -name "*.sql.zip" -exec rm -rf {} \;

# 3：删除所有类型文件包含文件夹 nginx 日志； * 比较危险，删除文件夹 或者 不是 日志文件也会被清理
find /usr/local/nginx/logs -mtime +2 -name "*.log" -exec rm -rf {} \;

# 4: 定时清理海康 人脸抓拍图片
find /home/ftpuser/ftp/upload/videoCatchface -mtime +31 -name "*.png" -exec rm -rf {} \;
find /home/ftpuser/ftp/upload/videoCatchface -mtime +31 -name "*.jpeg" -exec rm -rf {} \;
find /home/ftpuser/ftp/upload/videoCatchface -mtime +31 -name "*.jpg" -exec rm -rf {} \;
find /home/ftpuser/ftp/upload/videoCatchface -mtime +31 -name "*.gif" -exec rm -rf {} \;


# 5： 删除MongoDB日志
find /var/log/mongodb  -mtime +2 -name "mongod.log.2020-*" -exec rm -rf {} \;
