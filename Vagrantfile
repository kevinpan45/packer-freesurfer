Vagrant.configure("2") do |config|
  config.vm.define "source", autostart: false do |source|
	source.vm.box = "generic/ubuntu2004"
	config.ssh.insert_key = true
  end
  config.vm.define "output" do |output|
	output.vm.box = "freesurfer"
	output.vm.box_url = "file://package.box"
	config.ssh.insert_key = true
  end
  config.vm.synced_folder ".", "/vagrant", disabled: true
end
