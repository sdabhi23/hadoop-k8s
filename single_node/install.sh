C='\033[0;32m'
NC='\033[0m'

echo "${ORANGE}===================> install necessary tools <===================${NC}"

echo "${C}===================> install necessary tools <===================${NC}"
apt-get -qq update
apt-get -qq install -y ssh pdsh wget > /dev/null

echo "${C}===================> retrieve and unpack hadoop <===================${NC}"
# wget https://downloads.apache.org/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
tar xzf hadoop-3.3.0.tar.gz
rm -rf hadoop-3.3.0.tar.gz

echo "${C}===================> apply settings for single node cluster <===================${NC}"
cp ./config/etc/hadoop/* ./hadoop-3.3.0/etc/hadoop/
cp ./config/sbin/* ./hadoop-3.3.0/sbin/