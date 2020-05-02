#!/bin/sh
# 批量删除docker日志文件
# du -sh /usr/local/docker/containers/*
# du -sh /var/lib/docker/containers/*
echo "======== start clean docker containers logs ========"
logs=$(find /usr/local/docker/containers/ -name *-json.log)

for log in $logs
        do
                echo "clean logs : $log"
                cat /dev/null > $log
        done

echo "======== end clean docker containers logs ========"

