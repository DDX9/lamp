#!/bin/bash

sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update

echo -e "/n/n installing php7.4 \n"
sudo apt-get install -y php7.4-cli php7.4-json php7.4-common php7.4-mysql php7.4-zip php7.4-gd php7.4-mbstring php7.4-curl php7.4-xml php7.4-bcmath libapache2-mod-php7.4
php -v

sudo apt install -y apache2 
echo -e "\n\n Apache2 installed\n"

sudo chown -R www-data:www-data /var/www
echo -e "\n\n Permissions have been set\n"


echo -e "\n\n installing composer\n"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

echo -e "\n\n installing mysql \n"
sudo apt-get install -y mysql-server 

echo -e "\n\nEnabling Modules\n"
sudo a2enmod rewrite
sudo phpenmod mcrypt

echo -e "\n\nRestarting Apache\n"
sudo service apache2 restart

echo -e "\n\nLAMP Installation Completed"

sudo snap install core; sudo snap refresh core
sudo ln -s /snap/bin/certbot /usr/bin/certbot
echo -e "\n\n Certbot install complete\n"

sudo  apt-get install phpmyadmin

exit 0



