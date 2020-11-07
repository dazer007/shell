# 使用函数计算打包下载OSS文件

## 一：macos iterm重点调用

参考地址 [使用函数计算打包下载OSS文件](https://help.aliyun.com/document_detail/158322.html)，具体使用说明见博客

+ 执行
需要在本地下载源码，修改切换如下目录：/Users/duandazhi/Desktop/zip-oss-code
执行`curl -v -L -o /Users/duandazhi/Desktop/oss.zip -d @./event.json https://1358706221135415.cn-shanghai.fc.aliyuncs.com/2016-08-15/proxy/zip-service/zip-oss/`
含义：**第一个参数本地下载地址**、**第二个参数event.js读取json配置**、**第三个http地址**可以CNAME映射域名


## event.json sourse设置 示例

 `"source-dir": ""` #打包所有文件
 `"source-dir": "static/"` #打包指定目录**static**
 `"source-dir": "icon/"` #打包指定目录**icon**