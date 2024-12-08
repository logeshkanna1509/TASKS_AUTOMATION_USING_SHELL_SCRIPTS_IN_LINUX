#!/bin/bash

# update the system
yum update -y

# upgrade the system
yum upgrade -y

# clean up unused packages
yum autoremove -y

#reboot the system
reboot

