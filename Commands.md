## To build the image to current location

sudo buildah bud -t oci-archive:$PWD/silverblue-custom.tar.gz .
sudo buildah bud -t oci-archive:/var/cache/Images/silverblue-custom.tar.gz .

## To rebase the system to above image

rpm-ostree rebase ostree-unverified-image:oci-archive:$PWD/silverblue-custom.tar.gz
rpm-ostree rebase ostree-unverified-image:oci-archive:/var/cache/Images/silverblue-custom.tar.gz
