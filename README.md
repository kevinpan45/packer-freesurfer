# packer-freesurfer
HashiCorp packer script for freesurfer, build artifact cover docker/vdi/vagrant image.

## Pre-prepare
Download freesurfer install package from official web site.
<!-- wget -q https://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/6.0.0/freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0.tar.gz -->

***All script base on freesurfer 6.0.0 edition***

## Build docker image in local
```
sh docker-build.sh
```

## Test installation
```
cp $FREESURFER_HOME/subjects/sample-001.mgz .
$FREESURFER_HOME/bin/mri_convert sample-001.mgz sample-001.nii.gz
```

**FreeSurfer more than 4GB, build in GitHub action need FLS payment**

## FreeSurfer tips
**Summary of Requirements:**

Operating Systems:
Linux - we use/test CentOS6, CentOS7, CentOS8, Ubuntu18
MacOS - we use/test on macOS 10.12 - 10.15
Processor Speed: 2.8GHz or higher
RAM: 8GB for recon, 16GB suggested for viewing graphics
Graphics card: 3D graphics card with its own graphics memory & accelerated OpenGL drivers
Size of installed image: 10GB
Typical size of a processed subject: 300MB
Other requirements: Matlab (only needed to run FS-FAST, the fMRI analysis stream)

**Freesurfer official artifact types:**

|  Artifact type   | For  |
|  ----  | ----  |
| tar.gz  | Linux |
| rpm | Linux |
| dmg  | MacOS |
| pkg | MacOS |
| vdi | VirtualBox |