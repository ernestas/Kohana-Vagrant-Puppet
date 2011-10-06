Vagrant::Config.run do |config|

  config.vm.box = "vagrant-ubuntu-10.04.3-server-i386"

	config.vm.forward_port "http", 80, 8080

	config.vm.provision :puppet do |puppet|
		puppet.manifests_path = "manifests"
		puppet.manifest_file = "site.pp"
		puppet.module_path = "modules"
	end
end
