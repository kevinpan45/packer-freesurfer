source "vagrant" "freesurfer" {
  communicator    = "ssh"
  source_path     = "generic/ubuntu2004"
  provider        = "virtualbox"
  output_dir      = "builds/freesurfer"
  add_force       = true
  skip_add        = true
  teardown_method = "destroy"
}

build {
  sources = [
    "source.vagrant.freesurfer"
  ]

  provisioner "shell" {
    scripts = ["./scripts/install_basic.sh"]
  }

}
