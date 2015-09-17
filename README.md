# Vagrant ElasticSearch Cluster
___

<br/>

## The Cluster

| Node hostname | IP address    |
|:--------------|:--------------|
| node1         | 192.168.1.101 |
| node2         | 192.168.1.102 |
| node3         | 192.168.1.103 |
| node4         | 192.168.1.104 |
| node5         | 192.168.1.105 |

<br/>   

## Installation   

Before starting, note that this guide was made having in mind \*nix systems, all this has been tested in a Mac OSX machine, so if you're running Windowzz have a look at the Vagrant and VirtualBox documentation.    


First things first: Install **[Vagrant](https://www.vagrantup.com)** and **[VirtualBox](https://www.virtualbox.org)** in your machine if you haven't done it yet.    

Clone the repo to your local machine: `$ git@github.com:francomile/vagrant-elasticsearch-cluster.git`   

Open a terminal, go to the cloned folder, and run `vagant up`:    

<br/>   

```

$ cd ~/challenge_francomile
$ vagrant up

Bringing machine 'node1' up with 'virtualbox' provider...
Bringing machine 'node2' up with 'virtualbox' provider...
Bringing machine 'node3' up with 'virtualbox' provider...
Bringing machine 'node4' up with 'virtualbox' provider...
Bringing machine 'node5' up with 'virtualbox' provider...
==> node1: Importing base box 'ubuntu/trusty64'...
==> node1: Matching MAC address for NAT networking...
==> node1: Checking if box 'ubuntu/trusty64' is up to date...
==> node1: Setting the name of the VM: challenge_francomile_node1_1441557787316_46206
==> node1: Clearing any previously set forwarded ports...
==> node1: Clearing any previously set network interfaces...
==> node1: Preparing network interfaces based on configuration...
    node1: Adapter 1: nat
    node1: Adapter 2: bridged
==> node1: Forwarding ports...
    node1: 22 => 2222 (adapter 1)
==> node1: Running 'pre-boot' VM customizations...
==> node1: Booting VM...
==> node1: Waiting for machine to boot. This may take a few minutes...
    node1: SSH address: 127.0.0.1:2222
    node1: SSH username: vagrant
...

```    

<br>    

Go take a long coffee because Vagrant will take some time in doing it's thing.
When you come back, you'll have a 5 node ElasticSeach cluster running.    


You can see your cluster status and all nodes by entering [http://192.168.1.101:9200/_plugin/head/](http://192.168.1.101:9200/_plugin/head) in your browser.    

![image](http://i60.tinypic.com/51dif6.png)   

<br/>   

## Tweaking for your needs

You can and shoud tweak some settings for adapting the cluster to your needs.   

### Vagrantfile:     

**`vb.memory = "512"`**  Here you can set the amount of ram you wish to give each node by changing the value.    

**`node1_config.vm.network "public_network", ip: "192.168.1.101", bridge: "en1: Wi-Fi (AirPort)"`** Public network `ip:` should be changed to your  network, and assigned a IP of your choice within your available range. `bridge:` should be set to your chosen interface. Vagrant by default already configures a host-only nat interface (**eth0**), and the `public_network` interface is set to be the virtual machine's (**eth1**) interface, which we'll be using to give our node's IP.    

**`config.vm.hostname = "node2"`** Will give your node a hostname, so if you don't like the default ones, be my guest! 😄    

### The `provision.sh` file:    

If you wish to change the hostnames or IPs of your nodes, you can do in the `Vagrantfile` in all code blocks referring the hostnames or IPs.   

### The `node*.pp` files   
The .pp files are the Puppet provision for each node. Tweak them for your needs.

<br/>   

## Using Vagrant to access and manage nodes

For accessing through `ssh` into any of the cluster nodes you may use `vagrant ssh node2`, and for `sudo` commands, the default vagrant password is `vagrant`.    

For shutting down the custer you can `vagrant halt` and for a specific node you use `vagrant halt node3` . 		

In a similar fashion you can fire up a specific node with `vagrant up node4` or the whole cluster by running `vagrant up`.	    

If you make changes to the `provision.sh` script you can use `vagrant up --provision` for running again the provisoners at boot.   

You can learn more at [Vagrant Docs](https://docs.vagrantup.com/v2/)
