#!/bin/bash
# 这里进杀死obama1进程； 【obama1】 进程名称
sudo kill -9 $(ps -ef|grep obama1|gawk '$0 !~/grep/ {print $2}' |tr -s '\n' ' ')

# 删除对应的执行目录  find / -name 'obama1'
rm -rf /usr/bin/obama1

