@REM vagrant plugin install vagrant-vbguest
@REM vagrant plugin install vagrant-scp
@REM vagrant plugin install vagrant-disksize

vagrant destroy -f controller siebel
vagrant up

@REM add siebel to the known_host file
vagrant ssh controller -c "ssh-keyscan -H siebel >> /home/vagrant/.ssh/known_hosts"

