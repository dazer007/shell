#!/usr/bin/env bash
#说明：docker构建的两种方式
#1：使用docker mvn插件'docker-maven-plugin'配置好serverId,直接通过插件完成build、push、tag的操作；不需要dockerfile
#2：一步步执行docker命令操作
#3：运行方式 ./dockerBuild.sh 或者 sh dockerBuild.sh

mvn clean package -Dmaven.test.skip=true -U

# 冒号指定版本0.01， 如果不指定， 就是 latest
docker build -t registry.cn-shenzhen.aliyuncs.com/dazer1992/yuebaoxiao:0.01 .

docker push registry.cn-shenzhen.aliyuncs.com/dazer1992/yuebaoxiao:0.01

#以交互方式运行一个镜像，运行完成之后，直接删除掉容器; 注意端口 【外部映射端口：内部端口】
docker run -it --rm -p 8881:8881 registry.cn-shenzhen.aliyuncs.com/dazer1992/yuebaoxiao:0.01

