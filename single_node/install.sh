C='\033[0;32m'
NC='\033[0m'
mode=$1

echo "\033[0;36m$mode mode\033[0m"

echo "${C}===================> install necessary tools <===================${NC}"
apt-get -qq update
apt-get -qq install -y ssh pdsh wget > /dev/null

echo "${C}===================> retrieve and unpack hadoop <===================${NC}"
if [ $mode = "prod" ]
then
    wget https://downloads.apache.org/hadoop/common/hadoop-3.3.0/hadoop-3.3.0.tar.gz
fi
tar xzf hadoop-3.3.0.tar.gz
rm -rf hadoop-3.3.0.tar.gz

echo "${C}===================> apply settings for single node cluster <===================${NC}"
cp ./config/etc/hadoop/* ./hadoop-3.3.0/etc/hadoop/
cp ./config/sbin/* ./hadoop-3.3.0/sbin/