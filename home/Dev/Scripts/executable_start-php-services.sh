#!/bin/bash

# This script starts all PHP environment services,
# Apache, MariaDB, and DNSMasq.

echo "Starting DNSMasq (need sudo)"
sudo brew services start dnsmasq

echo "Starting httpd (Apache)"
brew services start httpd

echo "Starting MariaDB"
brew services start mariadb

echo "Switching PHP version to 8.2"
sphp 8.2

echo "Services status: (need sudo)"
sudo brew services list | grep -E 'dnsmasq'
brew services list | grep -E 'httpd|mariadb'