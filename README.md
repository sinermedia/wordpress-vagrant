# Wordpress Prestashop
A vagrant box for Wordpress development.

## Dependences
* [Vagrant](https://www.vagrantup.com/)
* [VirtualBox](https://www.virtualbox.org/) / [VmWare](https://www.vmware.com/es.html)

## PHP Version
You can install any PHP version hosted on ppa:ondrej/php. Edit <code>phpVersion</code> variable on bootstrap.sh.

## Wordpress Version
You can install any Wordpress version. Edit <code>wordpressFilee</code> variable on bootstrap.sh.

## How to install
````
git clone https://github.com/sinermedia/wordpress-vagrant.git wordpress-vagrant
cd wordpress-vagrant
vagrant up
````
Go to http://192.168.30.10/wordpress and follow the installation steps.

**Create more than one virtual Machine**        
If you want create more than one Virtual Machine, you must change the <code>server_ip</code> and <code>hostname</code> values on the VagrantFile of your new installation with differents values than another VM created in your system. If you don't change this values, you will overwrite your created VM. 

## Database connection
**Database name:** wordpress     
**User:** root     
**Password:** wordpress

````
vagrant ssh
mysql -h localhost -u root -pwordpress wordpress
````

## Includes: 
* wget 
* php
* libapache2-mod-php
* php-gd
* mysql-server-5.7
* php-xml
* php-mcrypt
* php-mbstring
* php-mysql
* php-zip
* php-curl
* php-intl
* Wordpress

## Based on:
https://github.com/gorkau/vagrant-wordpress
