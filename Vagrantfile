# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.ssh.insert_key = false
  config.vm.synced_folder "./", "/vagrant"
  class Username
    def to_s
        print "Virtual machine needs you proxy user and password.\n"
        print "Username: " 
        STDIN.gets.chomp
    end
end

class Password
    def to_s
        begin
        system 'stty -echo'
        print "Password: "
        pass = URI.escape(STDIN.gets.chomp)
        ensure
        system 'stty echo'
        end
        pass
    end
end
    # print "Please insert your credentials\n"
    # print "Username: "
    # username = STDIN.gets.chomp
    # print "Password: "
    # password = STDIN.noecho(&:gets).chomp
    # print "\n"
  # config.vm.provision :shell, :path => "tasks/install.sh" , :args => [username, password]
  config.vm.provision :shell, :path => "tasks/install.sh" , env: {"USERNAME" => Username.new, "PASSWORD" => Password.new}
  config.vm.define "sandbox-9" do |node|
  
    node.vm.box               = "almalinux/9"
    node.vm.box_check_update  = false
    node.vm.hostname          = "sandbox-9"

    node.vm.network "private_network", ip: "172.17.17.100"
  
    node.vm.provider :virtualbox do |v|
      v.name    = "sandbox-9"
      v.memory  = 4096
      v.cpus    =  2
    end
  
    node.vm.provider :libvirt do |v|
      v.memory  = 4096
      v.cpus    = 2
      v.cpu_mode = 'host-passthrough'
    end
     node.vm.provider :parallels do |v|
      v.memory  = 4096
      v.cpus    = 2
     end

  end
  #https://www.vagrantup.com/docs/triggers
  #

end
