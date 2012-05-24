  #!/bin/bash
  BIND=127.0.0.1:9000
  USER=www-data
  PHP_FCGI_CHILDREN=5
  PHP_FCGI_MAX_REQUESTS=500
   
  PHP_CGI=/usr/bin/php-cgi
  PHP_CGI_NAME=`basename $PHP_CGI`
  PHP_CGI_ARGS="- USER=$USER PATH=/usr/bin PHP_FCGI_CHILDREN=$PHP_FCGI_CHILDREN PHP_$
  RETVAL=0
   
  start() {
        echo -n "Starting PHP FastCGI: "
        start-stop-daemon --quiet --start --background --chuid "$USER" --exec /usr/b$
        RETVAL=$?
        echo "$PHP_CGI_NAME."
  }
  stop() {
        echo -n "Stopping PHP FastCGI: "
        killall -q -w -u $USER $PHP_CGI
        RETVAL=$?
        echo "$PHP_CGI_NAME."
  }
   
  case "$1" in
      start)
        start
    ;;
      stop)
        stop
    ;;
      restart)
        stop
        start
    ;;
      *)
        echo "Usage: php-fastcgi {start|stop|restart}"
        exit 1
    ;;