# Kafka & Zookeeper Cluster Configuration

Cluster: 3 nodes running Kafka & Zookeeper

Installation:
- Kafka 2.2.1
  - Downloaded and untared to */home/{user}/kafka*
- Zookeeper 3.5.5
  - Downloaded and untared to */home/{user}/zookeeper*
- Update the property files in /kafka/config on each node with the files here

The following need to be in the PATH...

**export ZOO_LOG_DIR=/var/log/zookeeper**

**export KAFKA_HOME=/home/{user}/kafka**

**export PATH=$PATH:$KAFKA_HOME/bin/**
