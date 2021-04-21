# IMAGE_NAME = "minimal/xenial64"

# N = 1

Vagrant.configure("2") do |config|

    config.vm.define "controller" do |master|

        master.vm.provider "virtualbox" do |v|
            v.name    = "controller"
            # v.memory = 1024
            # v.cpus = 1
        end

        master.vm.box = "ubuntu/trusty64"

        master.vm.box_check_update  = false
        master.vm.hostname = "controller"
        
        master.vm.network "public_network", ip: "192.168.1.200"

        master.vm.synced_folder ".", "/vagrant_data"

        master.vm.provision "shell",
        #     # inline: "bash <(wget -qO- https://raw.githubusercontent.com/kausgang/Kubernetes-Template/main/VAGRANT-auto-setup-WINDOWS/setup-master.sh)"
            path: "./files/controller-setup.sh"



        
    end



    config.vm.define "siebel" do |siebel|

    


        siebel.vm.box = "oracleLinux/7" # https://oracle.github.io/vagrant-projects/boxes/oraclelinux/8.json"
        siebel.vm.box_url = "https://oracle.github.io/vagrant-projects/boxes/oraclelinux/7.json"
        

        # siebel.vm.box = "ubuntu/trusty64"

        # master.vm.box_check_update  = false
        siebel.vm.hostname = "siebelvm"
        
        siebel.vm.network "public_network", ip: "192.168.1.210"

        siebel.vm.provider "virtualbox" do |vb|

            vb.name = "siebel"
            # Customize the amount of memory on the VM:
            vb.memory = "4096"
            vb.cpus = 2

            
            # https://coderwall.com/p/n2y79g/vagrant-virtualbox-ubuntu-no-internet-access
            vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
            vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]

          end

        # https://www.grzegorowski.com/resizing-vagrant-vm-disksize
        # siebel.disksize.size = '80GB'

        siebel.vm.synced_folder ".", "/vagrant_data"
        siebel.vm.synced_folder "./SHARED_FS", "/BINARIES"

        siebel.vm.provision "shell",
        #     # inline: "bash <(wget -qO- https://raw.githubusercontent.com/kausgang/Kubernetes-Template/main/VAGRANT-auto-setup-WINDOWS/setup-master.sh)"
            path: "./files/siebelvm-bootstrap.sh"
            
    end


    
  
end
