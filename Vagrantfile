Vagrant.configure("2") do |config|
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "centos/7"

  config.vm.network "forwarded_port", guest: 5432, host: 5432

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    vb.memory = "2048"

    vb.customize [
      "modifyvm", :id,
      "--cableconnected1", "on"
    ]
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # # 【Virtual Machine】
  config.vm.provision :shell, privileged: false, path: "bootstrap/vm_docker.sh"
  # config.vm.provision :shell, privileged: false, path: "bootstrap/db_postgres.sh"

  # # 【Upload File】
  config.vm.provision "file", source: "./docker", destination: "$HOME/docker"  
end
