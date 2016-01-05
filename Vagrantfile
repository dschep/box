# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "private_network", ip: "10.42.42.42"

  config.vm.hostname = 'box'

  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    vb.memory = "4096"
    # Speed optimization
    vb.linked_clone = true if Vagrant::VERSION =~ /^1.8/
  end

  # disable included ansible.cfg
  ENV['ANSIBLE_CONFIG'] = "/dev/null"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "site.yml"
  end
end
