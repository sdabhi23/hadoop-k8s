#!/bin/sh

C='\033[0;32m'
NC='\033[0m'
mode=$1
version=$2

echo "\033[0;36m$mode mode\033[0m"

echo "${C}===================> install necessary tools <===================${NC}"
apt-get -qq update
apt-get -qq install -y ssh pdsh wget > /dev/null

echo "${C}===================> retrieve and unpack hadoop <===================${NC}"
if [ $mode = "prod" ]
then
    wget "https://downloads.apache.org/hadoop/common/hadoop-${version}/hadoop-${version}.tar.gz"
fi
tar xzf "hadoop-${version}.tar.gz"
rm -rf "hadoop-${version}.tar.gz"
mv "hadoop-${version}/" "hadoop"
echo "~/"
ls
echo "hadoop/"
ls hadoop

echo "${C}===================> apply settings for single node cluster <===================${NC}"
cp ./config/etc/hadoop/* ./hadoop/etc/hadoop/
cp ./config/sbin/* ./hadoop/sbin/