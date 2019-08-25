# php56-fpm
    5.6.40 the last officially supported version of PHP on January 10, 2019 officially no longer supports the php5 series
    Can be used in production environment
# usage:
    docker pull leitaozhang/php56-fpm
    
    docker run -d --name php56 -p 9056:9056 -v /home/www:/var/www docker.io/leitaozhang/php56-fpm 
# Connect mysql 、 redis
    docker run -d --name php56 --link myredis --link mysql -p 9056:9056 -v /home/www:/var/www docker.io/leitaozhang/php56-fpm  
# config location
    php.ini : /usr/local/php/lib/php.ini
    php-fpm.conf : /usr/local/php/etc/php-fpm.conf
# Includes the following extensions
    apc
    apcu
    bcmath
    Core
    ctype
    curl
    date
    dom
    ereg
    fileinfo
    filter
    gd
    hash
    iconv
    intl
    json
    libxml
    mbstring
    mcrypt
    memcache
    memcached
    mhash
    mysql
    mysqli
    mysqlnd
    openssl
    pcntl
    pcre
    PDO
    pdo_mysql
    pdo_sqlite
    Phar
    posix
    redis
    Reflection
    session
    SimpleXML
    sockets
    SPL
    sqlite3
    standard
    tokenizer
    xml
    xmlreader
    xmlwriter
    zip
    zlib
    
    