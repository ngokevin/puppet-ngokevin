rmmod iwlwifi
modprobe iwlwifi 11n_disable=1
apt-get update
add-apt-repository ppa:synapse-core/ppa
add-apt-repository ppa:kevin-mehall/pithos
add-apt-repository ppa:ubuntu-mozilla-daily/firefox-aurora
apt-get install python-dev python-virtualenv libxml2-dev libxslt1-dev libmysqlclient-dev libmemcached-dev libssl-dev swig
apt-get install git synapse pithos firefox compizconfig-settings-manager nginx vim terminator openssh-server mysql-server
echo "enabled=0" > /etc/default/apport
apt-get upgrade
