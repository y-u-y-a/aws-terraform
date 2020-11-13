#!/bin/sh

sudo yum update -y
# Install Library
sudo yum install -y git mysql httpd
sudo systemctl start httpd.service

# # Install php
# # sudo yum install -y php
# # sudo amazon-linux-extras install -y epel # to install epel-release packages
# # sudo yum install -y epel-release
# # sudo rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm # to use remi repo
# # sudo yum install -y php74 php74-php php74-php-fpm
# # sudo ln -s /usr/bin/php74 /usr/bin/php
# sudo amazon-linux-extras install -y php7.4
# sudo yum install -y --enablerepo=remi-php74 php-cli php-xml php-json php-mbstring php-process php-common php-fpm php-zip php-mysqlnd
# # sudo yum install --enablerepo=remi-php74 php-devel php-mbstring php-openssl php-xml php-pdo php-gd unzip
# # Install Composer
# curl -sS https://getcomposer.org/installer | php
# # pass
# sudo mv composer.phar /usr/local/bin/composer

# # clone laravel project
# cd /var/www/html
# sudo git clone https://github.com/y-u-y-a/awsApp.git

# ## 設定
# # sudo vi /etc/httpd/conf/httpd.conf
# # 以下に変更
# # DocumentRoot "/var/www/html/[プロジェクト名]/public
# # 最終行に以下を追記
# # # .htaccess 有効化
# # <Directory /var/www/html/[プロジェクト名]/public>
# #     AllowOverride All
# # </Directory>
# # プロジェクト直下で実行
# # composer install
# # composer update
# # フォルダの権限
# # sudo chmod -R 777 code
