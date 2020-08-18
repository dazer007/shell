#!/bin/bash
#mongo-logRotate.sh
#Rotate the MongoDB logs to prevent a single logfile from consuming too much disk space.
#拆分MongoDB日志，避免日志文件过大

mongo 10.105.0.6:47071<<EOF
use admin;
db.auth("iotMongoUserX",".123aB.iotMongoUserXpWD");

db.runCommand({logRotate:1});

show dbs;
exit;
EOF