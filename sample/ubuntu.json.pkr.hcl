
source "vagrant" "autogenerated_1" {
  add_force    = true
  communicator = "ssh"
  output_dir   = "builds/focal-current"
  provider     = "virtualbox"
  source_path  = "generic/ubuntu2004"
}

build {
  sources = ["source.vagrant.autogenerated_1"]

  provisioner "shell" {
    inline = ["touch /tmp/new"]
  }

}
