#!/bin/sh

C='\033[0;32m'
NC='\033[0m'

echo "${C}===================> setup passphraseless ssh <===================${NC}"
/etc/init.d/ssh start
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys

echo "${C}===================> change working directory <===================${NC}"
cd hadoop

echo "${C}===================> format the filesystem <===================${NC}"
bin/hdfs namenode -format

echo "${C}===================> starting dfs daemons <===================${NC}"
sbin/start-dfs.sh
sleep 10

echo "${C}===================> starting yarn daemons <===================${NC}"
sbin/start-yarn.sh
sleep 10

while true
do
    echo "${C}###### [$(date "+%D %T %Z")] jps #####${NC}"
    jps
    sleep 10
    echo "${C}###### [$(date "+%D %T %Z")] dfs admin report #####${NC}"
    bin/hdfs dfsadmin -report
    sleep 30m
done