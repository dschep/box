# -*- mode: ruby -*-
# vi: set ft=ruby :

module Host
  extend self

  def cpus
    if File.exist? '/proc/cpuinfo'
      File.read('/proc/cpuinfo').scan(/^processor\s*:/).size
    else
      `sysctl hw.ncpu | cut -d' ' -f2`.to_i
    end
  rescue
      2
  end

  def ram
    `free -m`.split[8].to_i
  rescue
    `sysctl hw.memsize | cut -d' ' -f2`.to_i / 1024 / 1024
  rescue
    2048
  end
end

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/bionic64"

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
    vb.linked_clone = true if Gem::Version.new(Vagrant::VERSION) >= Gem::Version.new('1.8.0')
    # Place in Vagrant group
    vb.customize ["modifyvm", :id, "--groups", "/Vagrant"]
  end

  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder "~/code", "/home/vagrant/code", disabled: false

  config.vm.provision "shell",
    inline: "python --version &> /dev/null || apt install -y python"

  config.vm.provision "ansible" do |ansible|
    ansible.config_file = "ansible-vagrant.cfg"
    ansible.playbook = "site.yml"
    ansible.raw_arguments = ["-e", "user=vagrant"]
    ansible.compatibility_mode = "2.0"
  end
end
