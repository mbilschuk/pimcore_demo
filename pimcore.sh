#!/bin/bash

# start containers
docker-compose up -d

#create database
docker exec -it database mysql -uroot -ppassword -e "\
    SET GLOBAL log_bin_trust_function_creators = 1;
    CREATE DATABASE pimcore; \
    CREATE USER 'pim_user'@'%' IDENTIFIED WITH mysql_native_password BY 'qwerty12345'; \
    GRANT ALL PRIVILEGES ON pimcore.* TO 'pim_user'@'%'; \
    "

 #install pimcore
 docker exec -it php-fpm /bin/bash -c "
    composer install; \
    composer update; \
    php ./vendor/bin/pimcore-install --mysql-host-socket=database --mysql-database=pimcore --no-interaction --ignore-existing-config;
    echo '* * * * * php /var/www/html/bin/console messenger:consume pimcore_core pimcore_maintenance' >> /etc/crontab;
    "
