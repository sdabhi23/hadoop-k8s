# install necessary tools
apt-get -qq update
apt-get -qq install -y ssh pdsh wget > /dev/null

# retrieve and unpack hadoop
# wget https://downloads.apache.org/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
tar xzf hadoop-3.3.0.tar.gz
rm -rf hadoop-3.3.0.tar.gz

# apply settings for single node cluster
cp ./config/etc/hadoop/* ./hadoop-3.3.0/etc/hadoop/
cp ./config/sbin/* ./hadoop-3.3.0/sbin/

# setup passphraseless ssh
/etc/init.d/ssh start
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys

# working directory
cd hadoop-3.3.0

# format the filesystem
bin/hdfs namenode -format

# start all daemons
sbin/start-all.sh

# Make the HDFS directories required to execute MapReduce jobs
bin/hdfs dfs -mkdir /user
bin/hdfs dfs -mkdir /user/