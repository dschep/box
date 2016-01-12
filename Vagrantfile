# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  # on old versions of vagrant:
  # vagrant box add ubuntu/trusty64 https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box

  config.vm.network "private_network", ip: "10.42.42.42"

  config.vm.hostname = 'box'

  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory & cpus on the VM:
    vb.memory = "4096"
    vb.cpus = "2"
    vb.customize ["modifyvm", :id, "--cpus", "2"] # Old verisons of vagrant
    # Speed optimization
    vb.linked_clone = true if Vagrant::VERSION =~ /^1.8/
  end

  # disable included ansible.cfg
  ENV['ANSIBLE_CONFIG'] = "/dev/null"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "site.yml"
  end
end
