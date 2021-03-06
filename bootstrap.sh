wordPressFile=wordpress-5.5.1.zip
phpVersion=7.3

echo "Actualizando la lista de paquetes..."
sudo apt-get -qq update

sudo apt-get install -y software-properties-common python-software-properties python-pycurl

#sudo apt-get update

sudo add-apt-repository -y ppa:ondrej/php
sudo add-apt-repository -y ppa:ondrej/apache2
sudo apt-get -qq update

#deb http://ppa.launchpad.net/ondrej/php/ubuntu trusty main
#deb-src http://ppa.launchpad.net/ondrej/php/ubuntu trusty main

#sudo apt-get update

echo ">>>> Instalando Apache 2"
sudo apt-get install -y apache2


# export DEBIAN_FRONTEND=noninteractive


echo ">>>> Instalando PHP $phpVersion"
echo "-------------------------------"
sudo apt-get install -y -qq wget php$phpVersion
echo ">>>> Instalando libapache2-mod-php$phpVersion"
sudo apt-get install -y -qq libapache2-mod-php$phpVersion
echo ">>>> Instalando librería GD"
sudo apt-get install -y -qq php$phpVersion-gd
echo ">>>> Instalando el servidor MySQL"
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password wordpress'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password wordpress'
sudo apt-get install -y -qq mysql-server-5.7
sudo apt-get install -y php$phpVersion-xml
sudo apt-get install -y php$phpVersion-mcrypt
sudo apt-get install -y php$phpVersion-mbstring
sudo apt-get install -y php$phpVersion-mysql
sudo apt-get install -y php$phpVersion-zip
sudo apt-get install -y php$phpVersion-curl
sudo apt-get install -y php$phpVersion-intl

sudo a2enmod rewrite

rm -rf /var/www/html

#ln -fs /vagrant /var/www/html

sudo service apache2 restart

#
cd /home/ubuntu

# Download Wordpress
echo "Descargando Wordpress"
echo "----------------------"
wget https://wordpress.org/$wordPressFile --no-verbose

# Install Wordpress
echo "Instalando Wordpress"
echo "---------------------"
sudo apt-get install -y unzip

sudo unzip -qq /home/ubuntu/$wordPressFile

cd /var/www/html
sudo chmod 777 .

sudo cp -a /home/ubuntu/wordpress/. /var/www/html/


# Create database

mysql -uroot -pwordpress -e 'create database wordpress'
