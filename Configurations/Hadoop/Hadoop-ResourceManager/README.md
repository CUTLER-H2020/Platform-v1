For the following files on the Hadoop-NameNode add the following lines


**~/.bashrc
(Note, SPARK and FLUME colocated on Hadoop cluster)**

\# Add JAVA_HOME\
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64/"

\# Set Hadoop-related environment variables\
export HADOOP_HOME=/home/hadoop/hadoop

\# Add Hadoop, Spark, Flume directories to PATH\
export PATH=$PATH:$HADOOP_HOME/bin


**/etc/hostname**

cutler-hadoop-rm

**/etc/hosts
(delete localhost line)**

x.x.x.x CUTLER-Hadoop-NN\
x.x.x.x CUTLER-Hadoop-RM\
x.x.x.x CUTLER-Hadoop-DN1\
x.x.x.x CUTLER-Hadoop-DN2\
x.x.x.x CUTLER-Hadoop-DN3
