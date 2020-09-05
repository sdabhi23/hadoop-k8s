#!/bin/sh

C='\033[0;32m'
NC='\033[0m'

version=$1

echo "${C}===================> setup passphraseless ssh <===================${NC}"
/etc/init.d/ssh start
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys

echo "${C}===================> change working directory <===================${NC}"
cd "hadoop-${version}"

echo "${C}===================> format the filesystem <===================${NC}"
bin/hdfs namenode -format

echo "${C}===================> starting all daemons <===================${NC}"
sbin/start-all.sh