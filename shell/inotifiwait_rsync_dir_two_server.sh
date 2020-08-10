#!/bin/bash
# notifiwait_rsync_dir_two_server.sh
# 同步两台服务器的两个目录的文件,  linux shell 脚本
# 前置条件，两个服务器要设置linux信任关系
src=/data/db_backup/
inotifywait -mrq --timefmt '%d/%m/%y %H:%M' --format '%T %w%f %e' -e close_write,delete,create,attrib $src |\
while read file;
    do
    	  # 第一种 注意::和一个:意思完全不一样的; 两个冒号，表示b服务器的映射的一个目录（模块）。 命令亲测，可以，从A服务器的 /usr/local/sh copy 到 B服务器的 root用户下的 /usr/local/ftp/目录。 输入完成后，要手工输入B服务器密码。 【这里不需要873端口，通过的ftp 方式，需要账号、密码】
    	  # rsync -arzuq /usr/local/sh root@47.101.31.90:/usr/local/ftp/
    	  # 第二种 这种配置稍微麻烦; :: 后面跟着的是模块，模块在 目标机器定义；目标机器的密码也在目标机器配置文件定义，密码可以注释，不要密码配置。
    	  # [ftp]是目标服务器配置文件夹中配置的，模块名称，可以随便起名字。
    	  # 2.1 显示传输日志， 主动传输； 前提条件，看是否能 telnet对方B server;  telnet 101.132.189.38 873 ； 如果报错，注意查看 【@ERROR: 】后面的错误;  常见错误，见：上面参考 【Rsync 故障排查整理】
    	  # rsync -avP /usr/local/sh 101.132.189.38::ftp/
    	  # 2.2 后台运行
          rsync -arzuq $src 101.132.189.38::ftp/
          rsync -arzuq $src 47.52.240.121::ftp/
          echo "  ${file} was rsynced" >>/usr/local/sh/rsync.log 2>&1
    done
