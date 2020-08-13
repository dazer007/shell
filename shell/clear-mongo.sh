#!/bin/sh

# 删除MongoDB日志表
# 参考：MongoDB 定时删除数据 https://blog.csdn.net/CL_YD/article/details/79461528
# 参考：shell脚本传递参数给mongo命令 https://blog.csdn.net/fangfu123/article/details/104748183
# 里面课加载js,什么东西都可以写了。非常棒

mongo 10.105.0.6:47071<<EOF
use admin;
db.auth("iotMongoUserX",".123aB.iotMongoUserXpWD");
show dbs;

db.getCollection('RunLog-mw-airconditioning-hailin').drop();
db.getCollection('RunLog-mw-automobile-baidu').drop();
db.getCollection('RunLog-mw-bus-wanfeng').drop();
db.getCollection('RunLog-mw-carpark-jieshun').drop();
db.getCollection('RunLog-mw-doorcontrol-jieshun').drop();
db.getCollection('RunLog-mw-elevator-taichuan').drop();
db.getCollection('RunLog-mw-face-wanfeng').drop();
db.getCollection('RunLog-mw-informationpublish-chinashine').drop();
db.getCollection('RunLog-mw-internetbehavior-sangfor').drop();
db.getCollection('RunLog-mw-light-kuaisicong').drop();
db.getCollection('RunLog-mw-soilirrigation-splant').drop();
db.getCollection('RunLog-mw-video-haikang').drop();
db.getCollection('RunLog-mw-visualintercom-taichuan').drop();
db.getCollection('RunLog-mw-wifi-huawei').drop();

db.getCollection('Services-mw-bus-wanfeng-feederBusBooking').find({"createTime": {lt:'2020-08-12 11:35:35'}}).forEach(function(item){db.getCollection('Services-mw-bus-wanfeng-feederBusBooking').remove({"_id":item._id})});


load("clear-mongo.js")

exit;
EOF


#下面操作动态变量的MongoDB命令
#   echo `date       -d "-1 days ago"       '+%Y-%m-%d %H:%M:%S'`  #获取一天前的时间
#MIN_DATE=`date       -d "-10 days ago"       '+%Y-%m-%d %H:%M:%S'`; #'2020-08-12 11:35:35'；定义变量=和取值之间不能有空格；








