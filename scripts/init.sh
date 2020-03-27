#!/bin/bash
echo "Starting apache"
service apache2 start
echo "Starting mysql"
service mysql start
echo "Running Joomla install SQL"
mysql -u root -pAdmin2015 exampleDB < /var/www/example.com/public_html/installation/sql/mysql/joomla.sql
echo "Adding admin user"
mysql -u root -pAdmin2015 exampleDB < /mysql.sql
echo "Deleting installation directory"
rm -rf /var/www/example.com/public_html/installation
echo "Done"

# initial install of extension(s)
# if you want to install extensions automatically, you can do that here
# cd /var/www/example.com/public_html/cli
# php install-joomla-extension.php --package=/var/www/example.com/work_directory/Archive.zip

# this last line is just to keep the script from exiting and killing the box
cat