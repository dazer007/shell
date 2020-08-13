var mongo=new Mongo("10.105.0.6:47071");
var db=mongo.getDB("iot_gateway_mongo");

// 演示打印
printjson('---------开始打印-------');
printjson("数据条数：" + db.getCollection('Services-mw-carpark-jieshun-carout').count());

Date.prototype.Format = function (fmt) { // author: meizz
    var o = {
        "M+": this.getMonth() + 1, // 月份
        "d+": this.getDate(), // 日
        "h+": this.getHours(), // 小时
        "m+": this.getMinutes(), // 分
        "s+": this.getSeconds(), // 秒
        "q+": Math.floor((this.getMonth() + 3) / 3), // 季度
        "S": this.getMilliseconds() // 毫秒
    };
    if (/(y+)/.test(fmt))
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
};

Date.prototype.addDays = function(number) {
    var adjustDate = new Date(this.getTime() + 24 * 60 * 60 * 1000 * number);
    return adjustDate;
};


//获取30天前的时间 2020-08-12 11:35:35
var today30Ago =  new Date().addDays(10).Format("yyyy-MM-dd hh:mm:ss");
printjson("当前时间: " + today30Ago);

printjson("清理01-");
db.getCollection('Services-mw-bus-wanfeng-feederBusBooking').find({"createTime": {$lt: ''+ today30Ago +''}}).forEach(function(item){db.getCollection('Services-mw-bus-wanfeng-feederBusBooking').remove({"_id":item._id})});

printjson("清理02-");
db.getCollection('Services-mw-bus-wanfeng-feederBusTicket').find({"createTime": {$lt:''+ today30Ago +''}}).forEach(function(item){db.getCollection('Services-mw-bus-wanfeng-feederBusTicket').remove({"_id":item._id})});

printjson("清理03-");
db.getCollection('Services-mw-carpark-jieshun-carin').find({"createTime": {$lt:''+ today30Ago +''}}).forEach(function(item){db.getCollection('Services-mw-carpark-jieshun-carin').remove({"_id":item._id})});

printjson("清理04-");
db.getCollection('Services-mw-doorcontrol-jieshun-doorrecord').find({"createTime": {$lt:''+ today30Ago +''}}).forEach(function(item){db.getCollection('Services-mw-doorcontrol-jieshun-doorrecord').remove({"_id":item._id})});

printjson("清理05-");
db.getCollection('Services-mw-face-wanfeng-getReturnNumber').find({"createTime": {$lt:''+ today30Ago +''}}).forEach(function(item){db.getCollection('Services-mw-face-wanfeng-getReturnNumber').remove({"_id":item._id})});

printjson("清理06-");
db.getCollection('Services-mw-face-wanfeng-mqCousumer').find({"createTime": {$lt:''+ today30Ago +''}}).forEach(function(item){db.getCollection('Services-mw-face-wanfeng-mqCousumer').remove({"_id":item._id})});

printjson("清理07-");
db.getCollection('Services-mw-face-wanfeng-returnNumber').find({"createTime": {$lt:''+ today30Ago +''}}).forEach(function(item){db.getCollection('Services-mw-face-wanfeng-returnNumber').remove({"_id":item._id})});

printjson("清理08-");
db.getCollection('Services-mw-internetbehavior-sangfor-appRank').find({"createTime": {$lt:''+ today30Ago +''}}).forEach(function(item){db.getCollection('Services-mw-internetbehavior-sangfor-appRank').remove({"_id":item._id})});

printjson("清理09-");
db.getCollection('Services-mw-internetbehavior-sangfor-userRank').find({"createTime": {$lt:''+ today30Ago +''}}).forEach(function(item){db.getCollection('Services-mw-internetbehavior-sangfor-userRank').remove({"_id":item._id})});

printjson("清理10-");
db.getCollection('Services-mw-soilirrigation-splant-returnNumber').find({"createTime": {$lt:''+ today30Ago +''}}).forEach(function(item){db.getCollection('Services-mw-soilirrigation-splant-returnNumber').remove({"_id":item._id})});

printjson("清理11-");
db.getCollection('Services-mw-video-haikang-videoCatchcar').find({"createTime": {$lt:''+ today30Ago +''}}).forEach(function(item){db.getCollection('Services-mw-video-haikang-videoCatchcar').remove({"_id":item._id})});

printjson("清理12-");
db.getCollection('Services-mw-video-haikang-videoCatchface').find({"createTime": {$lt:''+ today30Ago +''}}).forEach(function(item){db.getCollection('Services-mw-video-haikang-videoCatchface').remove({"_id":item._id})});

printjson("清理13-");
db.getCollection('Services-mw-visualintercom-taichuan-returnNumber').find({"createTime": {$lt:''+ today30Ago +''}}).forEach(function(item){db.getCollection('Services-mw-visualintercom-taichuan-returnNumber').remove({"_id":item._id})});


