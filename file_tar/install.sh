#!/bin/bash

groupadd www && useradd -r -g www www 

yum -y update && yum -y install epel-release && yum install -y tar wget gcc gcc-c++ ncurses ncurses-devel bison libgcrypt perl automake autoconf libtool make  libxml2 libxml2-devel libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel zlib zlib-devel glibc glibc-devel glib2 glib2-devel curl curl-devel php-mcrypt libmcrypt libmcrypt-devel openssl-devel gd mcrypt mhash libicu-devel

cd /usr/local/src/php-files && ls | xargs -n1 tar xzvf


cd /usr/local/src/php-files/php-5.6.40 && ./configure  --prefix=/usr/local/php --enable-fpm --enable-pcntl --with-mysql=mysqlnd --with-mcrypt --enable-bcmath --with-curl --with-gd --enable-gd-native-ttf --with-freetype-dir --enable-intl --with-mysql-sock=/tmp/mysqld.sock --enable-mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-libxml-dir=/usr/lib64 --with-mhash --enable-sockets --with-png-dir=/usr/lib64 --with-jpeg-dir=/usr/lib64 --with-zlib --enable-opcache --enable-zip --enable-mbstring --with-openssl --with-pcre-regex && make && make install 

# CONFIG PHP5.6  
ln -s /usr/local/php/bin/php /usr/local/bin/php  && ln -s /usr/local/php/sbin/php-fpm /usr/local/bin/php-fpm  && ln -s /usr/local/php/bin/php-config /usr/bin/php-config

\cp -f /usr/local/src/config/php.ini /usr/local/php/lib
\cp -f /usr/local/src/config/php-fpm.conf /usr/local/php/etc

#==== PHP5.6 === EXTENSION
# PHP5.6 INSTALL REDIS 
cd /usr/local/src/php-files/redis-4.2.0 && /usr/local/php/bin/phpize && ./configure --with-php-config=/usr/bin/php-config && make && make install   
# PHP5.6 INSTALL LIBMEMCACHED
cd /usr/local/src/php-files/libmemcached-1.0.18 && ./configure && make && make install 
# PHP5.6 install memcached
cd /usr/local/src/php-files/memcached-2.2.0  && /usr/local/php/bin/phpize && ./configure --with-php-config=/usr/bin/php-config --disable-memcached-sasl && make && make install
# PHP5.6 install memcache
cd /usr/local/src/php-files/memcache-2.2.7 && /usr/local/php/bin/phpize && ./configure --with-php-config=/usr/bin/php-config && make && make install 
# PHP5.6 install APCU
cd /usr/local/src/php-files/apcu-4.0.10 && /usr/local/php/bin/phpize && ./configure --with-php-config=/usr/bin/php-config && make && make install 

rm -rf /usr/local/src/php-files && rm -rf /usr/local/src/config

echo "#!/bin/bash" > /usr/local/bin/php56 
echo "/usr/local/bin/php-fpm --nodaemonize -c /usr/local/php/lib/php.ini -y /usr/local/php/etc/php-fpm.conf" >> /usr/local/bin/php56 
chmod +x /usr/local/bin/php56

