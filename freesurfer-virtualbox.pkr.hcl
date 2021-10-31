packer {
  required_plugins {
    virtualbox = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/virtualbox"
    }
  }
}


source "vagrant" "processing" {
  communicator       = "ssh"
  source_path        = "generic/ubuntu2004"
  output_vagrantfile = "./ngiq-Vagrantfile"
  provider           = "virtualbox"
  add_force          = true
  insert_key         = true
  skip_add           = true
}

build {
  name = "processing-executor"
  sources = [
    "source.vagrant.processing"
  ]

  provisioner "shell" {
    scripts = ["./scripts/install_python3.sh"]
  }
}
