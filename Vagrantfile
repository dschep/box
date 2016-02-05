# -*- mode: ruby -*-
# vi: set ft=ruby :

module Host
  extend self

  def cpus
    if File.exist? '/proc/cpuinfo'
      File.read('/proc/cpuinfo').scan(/^processor\s*:/).size
    else
      2
    end
  end

  def ram
    return `free -m`.split[8].to_i
  rescue
    1024
  end
end

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  # on old versions of vagrant:
  # vagrant box add ubuntu/trusty64 https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box

  config.vm.network "private_network", ip: "10.42.42.42"

  config.vm.define :vagrant do |vm|
  end
  config.vm.provider :virtualbox do |vb|
    vb.name = 'box'
  end
  config.vm.hostname = 'box'

  config.vm.provider "virtualbox" do |vb|
    # Allocate half of RAM & CPU
    vb.customize ["modifyvm", :id, "--memory", (Host.ram/2).to_s]
    vb.customize ["modifyvm", :id, "--cpus", (Host.cpus/2).to_s]
    # Speed optimization
    vb.linked_clone = true if Vagrant::VERSION =~ /^1.8/
  end

  # disable included ansible.cfg
  ENV['ANSIBLE_CONFIG'] = "/dev/null"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "site.yml"
    ansible.raw_arguments = ["-e", "user=vagrant"]
  end
end
