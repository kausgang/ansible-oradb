echo "[TASK] Update /etc/hosts file"
cat >>/etc/hosts<<EOF
192.168.1.200   controller
192.168.1.210   siebel
EOF


echo "[TASK] - Install Ansible"
apt update -qq
apt install -y software-properties-common
apt-add-repository ppa:ansible/ansible
apt-get update
apt-get install -y ansible

echo "[TASK] - setup passwordless authentication"
cat /dev/zero | ssh-keygen -q -t rsa -f /home/vagrant/.ssh/id_rsa -N ""
cp /home/vagrant/.ssh/id_rsa.pub /vagrant_data/files/auth-key
chown -R vagrant:vagrant .ssh

# echo "[ANSIBLE]"
# ansible-playbook /vagrant_data/p.yml


echo "[TASK] ANSIBLE - setup hosts"
echo "siebel" >> /etc/ansible/hosts 


# echo "[TASK] ORACLEDB - setup response file"