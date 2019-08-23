# Cutler Platform Installation
- Install on 64 bit Ubuntu 16.x or higher
- Hadoop 3.2.0
- Flume 1.9.0
- Spark 2.4.3
- Kafka 2.12-2.3.0
- Zookeeper 3.4.14
- Elasticsearch 7.1.1
- Kibana 7.3
- MatLab R2018a
- Apache2 2.4

## Prerequisites

- Ansible management server (install ansible on Ubuntu machine)
- jmespath installed on Ansible management server (install using apt or other)
- 11 ubuntu machines (4 for Hadoop cluster, 3 for Kafka cluster, 4 for ES cluster)
- Add hostname of each machine to Ansible server /etc/hosts file (test ping by hostnames)
- Update Ansible server /etc/Ansible/hosts file with host information
- Generate SSH keys on ansible server and copy to each deployment machine
- Make sure all machines are accessible via SSH by the Ansible server
- Test 'ansible all -m ping' command to ensure all hosts are reachable by Ansible server

## Configuration
The following files must be edited to reflect your environment:
- hadoop-ansible/hosts/host (add IP addresses)
- install-matlab/hosts/host (add IP addresses)
- install-apache2/install.yml (add ansible host)
- kafka-ansible/inventory.ini (add IPs to zookeeper_servers, use these same IPs for kafka_servers )

## Running the playbooks
The top level directory contains four shell scripts
- cutler-install-all.sh (installs all clusters)
- cutler-install-cluster-1.sh (installs Hadoop cluster only)
- cutler-install-cluster-2.sh (installs Kafka cluster only)
- cutler-install-cluster-3.sh (installs Elasticsearch cluster only)


## Handling issues
- Flume can sometimes throw errors when installing using the shell script, if this happens
  simply change directory to 'hadoop-ansible' and run the install-spark-flume.yml playbook using: 
  ansible-playbook -i hadoop-ansible/hosts/host hadoop-ansible/install-spark-flume.yml
  
- The timeout on 'wait_for_kafka_up' in the Kafka service has been removed, the service should come up in its own
  time, if this does not happen then the service must be started manually on the target machine. The
  scripts to do start Kafka manually are in the bin folder of the Kafka deployment directory.
  
- Several of the playbooks require sudo access; at mmultiple times a promt for password
  input will appear, meaning that the installation isn't unattended. If an unattended installation is
  require then the occurences of following parameter: '--ask-become-pass', in 'cutler-install-all.sh'
  can be changed to: ' --extra-vars 'ansible_become_pass=password' '. Note that this alternative is
  neither secure, nor reccomended.
  
  
The following playbooks/roles have been leveraged:

https://github.com/pippozq/hadoop-ansible
https://github.com/pingcap/thirdparty-ops
https://github.com/elastic/ansible-elasticsearch
https://github.com/geerlingguy/ansible-role-kibana
https://github.com/grycap/ansible-role-spark
https://github.com/mplachter/ansible-role-flume
https://github.com/weareinteractive/ansible-apache2
https://github.com/AwaNoodle/ansible-matlab-runtime
https://github.com/AnsibleShipyard/ansible-zookeeper
