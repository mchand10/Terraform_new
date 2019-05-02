#!/bin/bash
set -x
apt-get update -y
apt-get upgrade -y
curl -fsSL https://get.docker.com/ | sh
mkdir /home/ubuntu/Test
mkdir /home/ubuntu/wordpress
cd /home/ubuntu/wordpress
docker run -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=wordpress --name wordpressdb -v "$PWD/database":/var/lib/mysql -d mariadb:latest
docker pull wordpress
docker run -e WORDPRESS_DB_PASSWORD=root --name wordpress --link wordpressdb:mysql -p 80:80 -v "$PWD/html":/var/www/html -d wordpress
mkdir /home/ubuntu/End
