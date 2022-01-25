# Replace to your freesurfer install package name
variable "freesurfer_package_file" {
  type    = string
  default = "freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0.tar.gz"
}

source "vagrant" "freesurfer" {
  communicator    = "ssh"
  source_path     = "generic/ubuntu2004"
  provider        = "virtualbox"
  output_dir      = "builds/vagrant/freesurfer"
  add_force       = true
  skip_add        = true
  teardown_method = "destroy"
}

source "docker" "freesurfer" {
  image       = "ubuntu:20.04"
  export_path = "builds/docker/freesurfer-docker-image.tar"
  changes = [
    "MAINTAINER KP45",
    "USER root",
    "WORKDIR /usr/local/freesurfer",
    "ENV FREESURFER_HOME /usr/local/freesurfer",
    "EXPOSE 80 443",
    "ONBUILD RUN export DEBIAN_FRONTEND=noninteractive",
    "ENTRYPOINT entrypoint.sh"
  ]
}

build {
  sources = [
    # "source.docker.freesurfer",
    "source.vagrant.freesurfer"
  ]

  provisioner "file" {
    source      = "${var.freesurfer_package_file}"
    destination = "/tmp/${var.freesurfer_package_file}"
  }

  provisioner "shell" {
    scripts = ["./scripts/install.sh"]
  }

}
