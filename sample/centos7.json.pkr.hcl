
variable "ssh_username" {
  type    = string
  default = "sed-admin"
}

source "vagrant" "centos_geoserver" {
  communicator    = "ssh"
  provider        = "vmware_desktop"
  skip_add        = true
  source_path     = "dd-centos-7-base"
  ssh_password    = "${var.ssh_password}"
  ssh_pty         = "true"
  ssh_timeout     = "1h"
  ssh_username    = "${var.ssh_username}"
  teardown_method = "destroy"
}

build {
  sources = ["source.vagrant.centos_geoserver"]

  provisioner "shell" {
    execute_command = "echo '${var.ssh_password}' | {{ .Vars }} sudo -S -E sh -eux '{{ .Path }}'"
    inline          = ["mkdir /gis_worker", "mkdir /gis_worker/geoserver", "mkdir /gis_worker/geoserver/run", "mkdir /gis_worker/geoserver/copy", "chown -R sed-admin /gis_worker"]
  }

  provisioner "file" {
    destination = "/gis_worker/geoserver/copy"
    source      = "../../../gis_workers/geoserver/"
  }

  provisioner "file" {
    destination = "/gis_worker/geoserver/run"
    source      = "../../../gis_workers/geoserver/"
  }

  provisioner "shell" {
    execute_command = "echo '${var.ssh_password}' | {{ .Vars }} sudo -S -E sh -eux '{{ .Path }}'"
    scripts         = ["./scripts/configure-server.sh"]
  }

}
