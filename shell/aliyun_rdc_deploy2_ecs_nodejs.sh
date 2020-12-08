#!/bin/bash
#打包&上传nodejs包 到服务器 进行部署

echo 'hello 这里是发布 nodejs 项目之间 到 ecs 脚本'

rm -rf /home/nginx/application/*.js
rm -rf /home/nginx/application/*.html
rm -rf /home/nginx/application/*.md
rm -rf /home/nginx/application/public/
rm -rf /home/nginx/application/tests/
rm -rf /home/nginx/application/src/
rm -rf /home/nginx/application/functions/
rm -rf /home/nginx/application/config/
rm -rf /home/nginx/application/mock/
rm -rf /home/nginx/application/*docker*
rm -rf /home/nginx/application/dist
echo '历史文件删除完毕....'

tar -zxvf /home/nginx/package.tgz -C /home/nginx/application
echo '解压缩文件完毕..'

echo '-----重新部署nginx start ---------'
rm -rf /usr/share/nginx/html*
rm -rf /usr/share/nginx/html2*
echo '删除nginx /usr/share/nginx/html 完毕'
cp -rf /home/nginx/application/dist /usr/share/nginx/
echo 'cp dist 目录到 nginx 目录完毕'
cp -rf /usr/share/nginx/dist /usr/share/nginx/html
mv /usr/share/nginx/dist /usr/share/nginx/html2
echo '-----重新部署nginx end success ---------'
chmod -R 755 /usr/share/nginx/
echo '给nginx目录添加权限'
nginx -s reload
echo '重新加载nginx......'
echo ' '
echo ' '

#echo '-----部署到tomcat start---------'
#rm -rf /usr/local/tomcat9/webapps/ROOT/*.js
#rm -rf /usr/local/tomcat9/webapps/ROOT/*.css
#rm -rf /usr/local/tomcat9/webapps/ROOT/*.json
#rm -rf /usr/local/tomcat9/webapps/ROOT/static
#rm -rf /usr/local/tomcat9/webapps/ROOT/icons
#rm -rf /usr/local/tomcat9/webapps/ROOT/workbox-v3.6.3
#\cp -rf /home/nginx/application/dist/* /usr/local/tomcat9/webapps/ROOT
#echo '-----部署到tomcat 目录 /usr/local/tomcat9/webapps/ROOT/ ---------'
#echo '-----部署到tomcat end success ---------'
