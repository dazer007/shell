# auto-del-x-days-ago-log.sh
# linux  ɾ����־�ļ�
# 1��ɾ�����е�tomcat����1���*.log��־
  find /usr/local/tomcat8/logs/ -mtime +1 -type f -name '*.log' -exec rm -rf {} \;
  find /usr/local/tomcat8/logs/ -mtime +1 -type f -name '*.txt' -exec rm -rf {} \;
  find /usr/local/tomcat8/logs/ -mtime +1 -type f -name '*.out' -exec rm -rf {} \;
  find /usr/local/tomcat8-8081/bin/logs/mall/ -mtime +5 -type f -name '*.gz' -exec rm -rf {} \; 

  find /usr/local/tomcat8-8081/logs/ -mtime +1 -type f -name '*.log' -exec rm -rf {} \;
  find /usr/local/tomcat8-8081/logs/ -mtime +1 -type f -name '*.txt' -exec rm -rf {} \;
  find /usr/local/tomcat8-8081/logs/ -mtime +1 -type f -name '*.out' -exec rm -rf {} \;
  find /usr/local/tomcat8-8081/bin/logs/mall/ -mtime +5 -type f -name '*.gz' -exec rm -rf {} \; 
# 2��ɾ������qcuredb_��ͷ����־�ļ�
find /data/db_backup/ -mtime +2 -name "*.sql.zip" -exec rm -rf {} \;  
# 3��ɾ�����������ļ������ļ��� nginx ��־�� * �Ƚ�Σ�գ�ɾ���ļ��� ���� ���� ��־�ļ�Ҳ�ᱻ����
find /usr/local/nginx/logs -mtime +10 -name "*.log" -exec rm -rf {} \;

