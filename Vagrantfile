# -*- mode: ruby -*-
# vi: set ft=ruby :
#Author Sunil Sankar
Vagrant.configure(2) do |config|
  config.ssh.insert_key = false
  config.vm.synced_folder "./", "/vagrant"
  class Fullname
    def to_s
        print "Give your full Name for Git configuration\n"
        print "FULLNAME: " 
        STDIN.gets.chomp
    end
end
class Email
  def to_s
      print "Give your Email ID for Git configuration\n"
      print "EMAIL ID: " 
      STDIN.gets.chomp
  end
end
# class Publickey
#     def to_s
#         begin
#         system 'stty -echo'
#         print "Publickey: "
#         pass = URI.escape(STDIN.gets.chomp)
#         ensure
#         system 'stty echo'
#         end
#         pass
#     end
# end
class Publickey
    def to_s
        print "Please enter the public key generated in your system <id_rsa.pub>"
        print "Publickey: "
        STDIN.gets.chomp
    end
end
    # print "Please insert your credentials\n"
    # print "Username: "
    # username = STDIN.gets.chomp
    # print "Password: "
    # password = STDIN.noecho(&:gets).chomp
    # print "\n"
  # config.vm.provision :shell, :path => "tasks/install.sh" , :args => [username, password]
  config.vm.provision :shell, :path => "tasks/install.sh" , env: {"FULLNAME" => Fullname.new, "PUBLICKEY" => Publickey.new,  "EMAILID" => Email.new}
  config.vm.provision "shell", inline: <<-SHELL
  echo $(date) > ~/rebootdone
  reboot
  echo $(date) >> ~/rebootdone
SHELL
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
