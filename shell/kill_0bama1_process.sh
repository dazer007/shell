#!/bin/bash
step=1  #间隔的秒数，不能大于60

for (( i = 0; i < 60; i=(i+step) )); do

  ## 1: 杀死cpu 占用超过75%的进程; 病毒会变名称，一直在变进程名称
  /bin/ps axf -o "pid %cpu" | awk '{if($2>=75.0) print $1}' | while read procid
  do
    kill -9 $procid
    echo '成功杀死cpu占用过高的进程'
  done

   # 杀死指定进程名称
    sudo kill -9 $(ps -ef|grep playstation|gawk '$0 !~/grep/ {print $2}' |tr -s '\n' ' ')
    # 这里进杀死obama1进程； 【obama1】 进程名称
    sudo kill -9 $(ps -ef|grep obama1|gawk '$0 !~/grep/ {print $2}' |tr -s '\n' ' ')
    # 删除对应的执行目录  find / -name 'obama1'
    rm -rf /usr/bin/obama1
    sleep $step
done

