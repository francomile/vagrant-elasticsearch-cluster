# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
   config.vm.provider "virtualbox" do |vb|
     vb.gui = true
     vb.memory = "512"
   end
  config.vm.box_check_update = false

  # Define nodes configuration.
  config.vm.define :node1 do |node1_config|
     node1_config.vm.box = "ubuntu/trusty64"
     node1_config.vm.network "public_network", ip: "192.168.1.101", bridge: "en1: Wi-Fi (AirPort)"
     config.vm.hostname = "node1"
     config.vm.provision "shell", path: "provision.sh"
     config.vm.provision "puppet" do |puppet|
       puppet.manifests_path = "manifests"
       puppet.manifest_file = "node1.pp"
     end
   end
   config.vm.define :node2 do |node2_config|
      node2_config.vm.box = "ubuntu/trusty64"
      node2_config.vm.network "public_network", ip: "192.168.1.102", bridge: "en1: Wi-Fi (AirPort)"
      config.vm.hostname = "node2"
      config.vm.provision "shell", path: "provision.sh"
      config.vm.provision "puppet" do |puppet|
        puppet.manifests_path = "manifests"
        puppet.manifest_file = "node2.pp"
      end
    end
    config.vm.define :node3 do |node3_config|
       node3_config.vm.box = "ubuntu/trusty64"
       node3_config.vm.network "public_network", ip: "192.168.1.103", bridge: "en1: Wi-Fi (AirPort)"
       config.vm.hostname = "node3"
       config.vm.provision "shell", path: "provision.sh"
       config.vm.provision "puppet" do |puppet|
         puppet.manifests_path = "manifests"
         puppet.manifest_file = "node3.pp"
       end
     end
     config.vm.define :node4 do |node4_config|
        node4_config.vm.box = "ubuntu/trusty64"
        node4_config.vm.network "public_network", ip: "192.168.1.104", bridge: "en1: Wi-Fi (AirPort)"
        config.vm.hostname = "node4"
        config.vm.provision "shell", path: "provision.sh"
        config.vm.provision "puppet" do |puppet|
          puppet.manifests_path = "manifests"
          puppet.manifest_file = "node4.pp"
        end
      end
      config.vm.define :node5 do |node5_config|
         node5_config.vm.box = "ubuntu/trusty64"
         node5_config.vm.network "public_network", ip: "192.168.1.105", bridge: "en1: Wi-Fi (AirPort)"
         config.vm.hostname = "node5"
         config.vm.provision "shell", path: "provision.sh"
         config.vm.provision "puppet" do |puppet|
           puppet.manifests_path = "manifests"
           puppet.manifest_file = "node5.pp"
         end
      end
end
