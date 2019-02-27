
CUTLER platform v1 deploys Spark across four nodes:
- 1 Spark Master
- 3 Spark Worker

The home directory for Spark on these nodes is /usr/local/spark

Apache Spark is colocated with Hadoop and Apache Spark


# Create the Spark Log directory in HDFS

hdfs dfs -mkdir /spark-logs

# Run the history server

$SPARK_HOME/sbin/start-history-server.sh