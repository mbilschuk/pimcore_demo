SET GLOBAL log_bin_trust_function_creators = 1;

CREATE DATABASE `pimcore`;
CREATE USER 'pim_user'@'%' IDENTIFIED WITH mysql_native_password BY 'qwerty12345';
GRANT ALL PRIVILEGES ON pimcore.* TO 'pim_user'@'%';