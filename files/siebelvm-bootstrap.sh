echo "[TASK] Update /etc/hosts file"
cat >>/etc/hosts<<EOF
192.168.1.200   controller
192.168.1.210   siebel
EOF

echo "[USERADD/GROUPADD]"
groupadd oinstall
groupadd dba
useradd -m -g oinstall -G dba oracle

# echo -e "Kolkata#1"| passwd oracle


echo "[TASK] add the key to authorized_key"
# for vagrant
cat /vagrant_data/files/auth-key >> /home/vagrant/.ssh/authorized_keys 
chown -R vagrant:vagrant /home/vagrant/.ssh/ 

# for root - needed when you install package
mkdir .ssh
cat /vagrant_data/files/auth-key >> /root/.ssh/authorized_keys

# passwordless authentication needs to be setup from controller to siebel with oracle user
mkdir /home/oracle/.ssh
cat /vagrant_data/files/auth-key >> /home/oracle/.ssh/authorized_keys 
chown -R oracle:oinstall /home/oracle/.ssh/
# rm /vagrant_data/auth-key

echo "[TASK] create /u01"
mkdir /u01
chown oracle:oinstall /u01




