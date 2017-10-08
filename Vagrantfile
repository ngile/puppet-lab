# -*- mode: ruby -*-
# vi: set ft=ruby :
$install_puppet = <<EOF
wget https://apt.puppet.com/puppet5-release-jessie.deb
dpkg -i puppet5-release-jessie.deb
echo "deb http://debian.ipacct.com/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list
sed -i 's/httpredir.debian.org/debian.ipacct.com/g' /etc/apt/sources.list
apt-get update 
apt-get -t jessie-backports install -y "openjdk-8-jdk-headless"
apt-get install -y puppetserver
sed -i 's/2g/512m/g' /etc/default/puppetserver
echo "PATH=/opt/puppetlabs/bin:$PATH" >> /etc/bash.bashrc
export PATH=/opt/puppetlabs/bin:$PATH
EOF

Vagrant.configure(2) do |config|
    config.vm.box = "debian/contrib-jessie64"
    # config.vm.box = "debian/jessie64"
    config.vm.define "puppetserver" do |puppetserver|
        puppetserver.vm.hostname = "puppet"
        puppetserver.vm.network "private_network", ip: '10.10.10.10', virtualbox__intnet: true
        puppetserver.vm.provision "shell", inline: $install_puppet
        puppetserver.vm.provider "virtualbox" do |machine|
           machine.memory = 1024
           machine.name = "puppetserver"
           machine.linked_clone = true if Gem::Version.new(Vagrant::VERSION) >= Gem::Version.new('1.8.0')
        end
        puppetserver.vm.provision "puppet" do |p|
            p.environment_path = "environments"
            p.environment = "production"
        end
    end

    config.vm.define "agent1" do |agent|
        agent.vm.hostname = "agent1"
        agent.vm.network "private_network", ip: '10.10.10.11', virtualbox__intnet: true
        agent.vm.provision "shell", inline: "echo '10.10.10.10 puppet' >>/etc/hosts"
        agent.vm.provider "virtualbox" do |machine|
           machine.memory = 1024
           machine.linked_clone = true if Gem::Version.new(Vagrant::VERSION) >= Gem::Version.new('1.8.0')
           machine.name = "agent1"
        end
    end
end
