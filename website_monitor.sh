#!/bin/bash
# /usr/local/sh/website_monitor.sh
#一个网站访问三次，三次都是失败，就发送警告邮件给管理员
URL_LIST="https://shop.dfww.com.cn/bobo/login.html https://www.jl-media.cn/hiber/login.html www.baidu.com"
for URL in $URL_LIST; do
    FAIL_COUNT=0
    for ((i=1;i<=10;i++)); do
        HTTP_CODE=$(curl -o /dev/null --connect-timeout 3 -s -w "%{http_code}" $URL)
        if [ $HTTP_CODE -eq 200 ]; then
            echo "$URL OK"
            break
        else
            echo "$URL retry $FAIL_COUNT"
            let FAIL_COUNT++
        fi
    done
    if [ $FAIL_COUNT -eq 10 ]; then
        echo "Warning: $URL Access failure!"
        echo "Warning: $URL Access failure!"|mail -s "monitor" 601026460@qq.com
        sleep 23h 59m 59s
    fi
done

