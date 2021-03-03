#!/usr/bin/env bash
# docker私有仓库-碧桂园潼湖部署

mvn clean package -Dmaven.test.skip=true -U

docker build -t iotrancher.bgysmartcity.com:5000/bgytonghu/yuebaoxiao:0.01 .

docker push iotrancher.bgysmartcity.com:5000/bgytonghu/yuebaoxiao:0.01
