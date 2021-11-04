source "vagrant" "freesurfer" {
  communicator    = "ssh"
  source_path     = "generic/ubuntu2004"
  provider        = "virtualbox"
  add_force       = true
  insert_key      = true
  skip_add        = true
  template        = "./config/Vagrantfile"
  teardown_method = "destroy"
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

}
