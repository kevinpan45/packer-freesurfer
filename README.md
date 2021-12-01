# packer-freesurfer
HashiCorp packer script for freesurfer, include freesurfer, python3.8 and pip3

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
