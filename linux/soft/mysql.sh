# https://dev.mysql.com/doc/mysql-yum-repo-quick-guide/en/
# https://dev.mysql.com/downloads/file/?id=477146
wget https://repo.mysql.com//mysql57-community-release-el7-11.noarch.rpm
rpm -Uvh mysql57-community-release-el7-11.noarch.rpm
# yum repolist all | grep mysql
# yum repolist enabled | grep mysql
yum -y install mysql-community-server
service mysqld start
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('Fhj(252019)');

