#!/bin/bash

# Update base URLs from mirror.centos.org to vault.centos.org
sed -i 's/mirror.centos.org/vault.centos.org/g' /etc/yum.repos.d/*.repo

# Uncomment baseurl lines and make them active
sed -i 's/^#.*baseurl=http/baseurl=http/g' /etc/yum.repos.d/*.repo

# Comment out mirrorlist lines to disable mirrorlist URLs
sed -i 's/^mirrorlist=http/#mirrorlist=http/g' /etc/yum.repos.d/*.repo

# Clean YUM cache and update system
yum clean all && yum -y update

echo "YUM repositories updated and system updated."
