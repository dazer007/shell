#1、docker 运行 nacos
#访问nacos http://localhost:8848/nacos/
docker run --name nacos-standalone -e MODE=standalone -d -p 8848:8848 nacos/nacos-server:1.1.4

#docker 运行