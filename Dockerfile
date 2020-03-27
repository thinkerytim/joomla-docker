FROM linode/lamp

RUN apt-get update && \
    apt-get -y install wget zip php5-mysql php5-curl && \
    cd /var/www/example.com/public_html && \
    wget -O joomla https://downloads.joomla.org/cms/joomla3/3-9-16/Joomla_3-9-16-Stable-Full_Package.zip?format=zip && \
    unzip joomla && \
    # replace the #_ in the install sql with j_
    sed -i 's/#_/j/g' /var/www/example.com/public_html/installation/sql/mysql/joomla.sql && \
    # remove the existing container's index.html
    rm /var/www/example.com/public_html/index.html && \
    # set up a new directory to hold the project stuff we're going to use in the box
    mkdir /var/www/example.com/work_directory

COPY config.temp.php /var/www/example.com/public_html/configuration.php
COPY scripts/init.sh /init.sh
COPY scripts/mysql.sql /mysql.sql
COPY scripts/install-joomla-extension.php /var/www/example.com/public_html/cli/install-joomla-extension.php
RUN chmod +x /init.sh

ENTRYPOINT ["/init.sh"]