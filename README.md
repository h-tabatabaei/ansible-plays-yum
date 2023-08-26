# ansible-plays-yum
Ansible playbook for yum update.

in order to distribute your public key to server:
1) use ssh-keygen to create public/private key

2) update ansible-plays-yum/sshPassLess/servers and add your servers ip in each line

3) run ansible-plays-yum/sshPassLess/copy-id.sh



to update you os based on your enabled repositories do as follow/:
1) update the inventory files. dont forget to send you public key to those servers.
	ansible-plays-yum/environments/inventory

2) to update the host part in playbook
Note: I put two type of modules in task folder.
	1) playbook running yum module (recommanded)	yum.yaml
	2) playbook runnng yum with shell modules	yumUpdate.yaml

	
3) in order to double check the effected servers run this command:
ansible-playbook -i .../inventory ansible-plays-userManagement/roles/user_management/tasks/yum.yaml --list-hosts

4) in order to verify the playbook syntax:
ansible-playbook -i .../inventory ansible-plays-userManagement/roles/user_management/tasks/yum.yaml --syntax-check -vv

5) in order to run the playbook and save the stdout for future reference:
ansible-playbook -i .../inventory ansible-plays-userManagement/roles/user_management/tasks/yum.yaml -vv 2>&1> result.out


