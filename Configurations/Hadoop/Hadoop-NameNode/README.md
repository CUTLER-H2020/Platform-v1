For the following files on the Hadoop-NameNode add the following lines


**~/.bashrc
(Note, SPARK and FLUME colocated on Hadoop cluster)**


\# Set Hadoop-related environment variables\
export HADOOP_HOME=/home/hadoop/hadoop

\# Set Spark environment variables\
export SPARK_HOME=/usr/local/spark

\# Add Flume bin/ directory to PATH\
export FLUME_HOME=/home/hadoop/flume/

\# Add Hadoop, Spark, Flume directories to PATH\
export PATH=$PATH:$SPARK_HOME/bin:$HADOOP_HOME/bin:$FLUME_HOME/bin/


**/etc/hostname**

cutler-hadoop-nn

**/etc/hosts
(delete localhost line)**

x.x.x.x CUTLER-Hadoop-NN\
x.x.x.x CUTLER-Hadoop-RM\
x.x.x.x CUTLER-Hadoop-DN1\
x.x.x.x CUTLER-Hadoop-DN2\
x.x.x.x CUTLER-Hadoop-DN3
