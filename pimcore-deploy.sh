#!/bin/bash

export UID=$(id -u)
export GID=$(id -g)

# start containers
docker-compose up -d

#create database
docker-compose exec -T database mysql -uroot -ppassword mysql < .docker/database/init_db.sql


#install pimcore
docker exec -it php-fpm /bin/bash -c "
    composer install; \
    composer update; \
    php ./vendor/bin/pimcore-install --mysql-host-socket=database --mysql-database=pimcore --no-interaction --ignore-existing-config; \
    nohup php  /var/www/html/bin/console messenger:consume pimcore_core pimcore_maintenance &"

#add thumbnails and translation
docker-compose exec -T database mysql -uroot -ppassword mysql < .docker/database/add_thumb.sql