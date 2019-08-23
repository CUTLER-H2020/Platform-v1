ansible-playbook -i hadoop-ansible/hosts/host hadoop-ansible/master.yml
ansible-playbook -i hadoop-ansible/hosts/host hadoop-ansible/workers.yml -e "master_ip=192.x.x.x master_hostname=NameNode-Hostname"
ansible-playbook -i hadoop-ansible/hosts/host hadoop-ansible/install-spark-flume.yml