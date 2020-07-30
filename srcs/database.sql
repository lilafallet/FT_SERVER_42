-- Wordpress
CREATE DATABASE wordpress CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
GRANT ALL ON wordpress.* TO username @'localhost' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;

-- Phpmyadmin
CREATE USER lila @'localhost' IDENTIFIED BY 'hey123';
GRANT ALL PRIVILEGES ON *.* TO  phpadmin @'localhost' WITH GRANT OPTION;
