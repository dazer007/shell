#!/bin/bash
# mysql自动备份功能
DATE=$(date +%F_%H-%M-%S)
HOST=localhost
USER=root
PASS=root007xX
#BACKUP_DIR=/data/db_backup
BACKUP_DIR=/usr/local2/mysql_backup
# egrep 是排除
DB_LIST=$(mysql -h$HOST -u$USER -p$PASS -s -e "show databases;" 2>/dev/null |egrep -v "Database|information_schema|mysql|performance_schema|sys")


# 1：第一种备份方式，按照数据库整个库进行备份；一个库 一个zip文件
# 优势：方便 ； 缺点： 整个库备份 文件比较大，出问题，不好查找单个库文件；
for DB in $DB_LIST; do
    BACKUP_NAME=$BACKUP_DIR/${DB}_${DATE}.sql
    ## 说明 /dev/null 是空设备，像一个垃圾桶，任何不要的东西都放进去。当然也可以变成自己的文件
    BACKUP_LOG_NAME=/usr/local/sh/db_error.txt
    if ! mysqldump -h$HOST -u$USER -p$PASS -B $DB > $BACKUP_NAME 2>$BACKUP_LOG_NAME; then
        echo "$BACKUP_NAME 备份失败!,请自行执行，查看错误日志"
   else
    	# 进行压缩成.zip
    	cd ${BACKUP_DIR};
    	zip ${DB}_${DATE}.sql.zip ${DB}_${DATE}.sql;
    	rm -rf $BACKUP_NAME
   fi
done


# 2：第二种方式备份，按照单库单张表进行备份；
