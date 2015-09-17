#!/bin/bash

# -------------------------------------------------------------------- #
# PROVISION SCRIPT FOR ELASTICSEARCH CLUSTER:                          #
# -------------------------------------------------------------------- #
# This script will configure a 5 node ElasticSearch cluster.           #          #
# Settings like network or hostnames must be changed also in the       #
#  Vagrantfile for this to work.                                       #
# Rubens Franco - 2015                                                 #
# -------------------------------------------------------------------- #


# Inform the script start
echo "----------------------------------------------------------------------"
echo "        S T A R T I N G   P R O V I S I O N    S C R I P T            "
echo "----------------------------------------------------------------------"


# Update system and install packages, puppet and puppet modules
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install puppet language-pack-en unzip zlibc -y
puppet module install puppetlabs-stdlib
puppet module install puppetlabs-apt
puppet module install puppetlabs-java
puppet module install elasticsearch-elasticsearch


# Set locale defaults to english UTF-8
cat <<EOF > /etc/default/locale
LC_ALL="en_US.UTF-8"
EOF
source /etc/default/locale


# Inform the end of script
echo "----------------------------------------------------------------------"
echo "        F I N I S H E D   P R O V I S I O N    S C R I P T            "
echo "----------------------------------------------------------------------"
