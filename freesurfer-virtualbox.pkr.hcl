source "vagrant" "freesurfer" {
  communicator = "ssh"
  source_path  = "generic/ubuntu2004"
  provider     = "virtualbox"
  add_force    = true
  insert_key   = true
  ssh_username = "vagrant"
  ssh_password = "vagrant"
  skip_add     = true
}

build {
  name = "freesurfer"
  sources = [
    "source.vagrant.freesurfer"
  ]

  provisioner "shell" {
    # scripts = ["./scripts/install_python3.sh"]
    inline = ["echo initial provisioning"]
  }

  post-processor "vagrant" {
    compression_level    = "8"
    output               = "freesurfer_ubuntu2004.box"
    provider_override    = "virtualbox"
    vagrantfile_template = "./config/Vagrantfile"
  }
}
