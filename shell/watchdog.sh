FILE_THIS="./oomLog"
FILE_LAST="./oomTemp"
FOLDER="./back"
DIR=`pwd `
IP=`/sbin/ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:" `

while :; do
    if [ -e "$FILE_THIS" ]; then
        # mv "$FILE_THIS" "$FILE_LAST"
        # ls "$FOLDER" > "$FILE_THIS"
        
        diff "$FILE_THIS" "$FILE_LAST"
        if [ $? == 0 ]; then
            echo Not changed
        else
            echo Changed
             ./stop.sh
            ./start.sh
            MTIME=`ls -l --time-style="long-iso" $FILE_THIS |awk '{ print \$6 "-" \$7}' `
            # SMS="http://193.0.10.197:8084/skynet/collect?infoId=13\&text=oom_error$MTIME\&phone=18758363171\&title=watchdog"
            SMS="http://193.0.10.197:8084/skynet/collect?infoId=4&text=oom_error$IP$DIR$MTIME&phone=18758363171&title=watchdog"
             curl $SMS
             cp "$FILE_THIS" "$FILE_LAST"
             mv "$FILE_THIS" "./back/$FILE_THIS.$MTIME"
        fi
    else
       # ls "$FOLDER" > "$FILE_THIS"
        echo "$(date "+%Y%m%d%H%M%S") $FILE_THIS is not  exists "
        # echo "hello world" > "$FILE_THIS"
         if [ -e "$FILE_LAST" ]; then
            echo "$(date "+%Y%m%d%H%M%S") $FILE_LAST is   exists "
         else
            echo "$(date "+%Y%m%d%H%M%S") $FILE_LAST is not  exists "
            echo "hello world" > "$FILE_LAST"
         fi
    fi
    # 可以通过调整sleep的时间来更改监控频率
    sleep 10
done