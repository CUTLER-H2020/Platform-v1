ansible-playbook -i hadoop-ansible/hosts/host hadoop-ansible/master.yml
ansible-playbook -i hadoop-ansible/hosts/host hadoop-ansible/workers.yml -e "master_ip=192.x.x.x master_hostname=NameNode-Hostname"
ansible-playbook -i hadoop-ansible/hosts/host hadoop-ansible/install-spark-flume.yml
ansible-playbook -i kafka-ansible/inventory.ini kafka-ansible/local_prepare.yml
ansible-playbook -i kafka-ansible/inventory.ini kafka-ansible/bootstrap.yml --ask-become-pass
ansible-playbook -i kafka-ansible/inventory.ini kafka-ansible/deploy.yml --ask-become-pass
#ansible-playbook -i kafka-ansible/inventory.ini kafka-ansible/start.yml --user=cutler --extra-vars 'ansible_become_pass=password'
ansible-playbook -i kafka-ansible/inventory.ini kafka-ansible/start.yml --ask-become-pass
ansible-playbook -i kafka-ansible/inventory.ini kafka-ansible/install_zk.yml --ask-become-pass
#ansible-playbook -i inventory.ini stop.yml
ansible-playbook -i hadoop-ansible/hosts/host hadoop-ansible/install-es.yml
ansible-playbook install-apache2/install.yml
ansible-playbook install-matlab/install.yml
