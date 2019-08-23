ansible-playbook -i kafka-ansible/inventory.ini kafka-ansible/local_prepare.yml
ansible-playbook -i kafka-ansible/inventory.ini kafka-ansible/bootstrap.yml --ask-become-pass
ansible-playbook -i kafka-ansible/inventory.ini kafka-ansible/deploy.yml --ask-become-pass
#ansible-playbook -i kafka-ansible/inventory.ini kafka-ansible/start.yml --user=cutler --extra-vars 'ansible_become_pass=password'
ansible-playbook -i kafka-ansible/inventory.ini kafka-ansible/start.yml --ask-become-pass
ansible-playbook -i kafka-ansible/inventory.ini kafka-ansible/install_zk.yml --ask-become-pass
#ansible-playbook -i inventory.ini stop.yml
