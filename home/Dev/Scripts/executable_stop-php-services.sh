#!/bin/bash

# This script stops all PHP environment services,
# Apache, MariaDB, and DNSMasq.

echo "Stopping DNSMasq (need sudo)"
sudo brew services stop dnsmasq

echo "Stopping httpd (Apache)"
brew services stop httpd

echo "Stopping MariaDB"
brew services stop mariadb

echo "Services status: (need sudo)"
sudo brew services list | grep -E 'dnsmasq'
brew services list | grep -E 'httpd|mariadb'