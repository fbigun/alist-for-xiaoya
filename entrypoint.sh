#!/bin/bash

chown -R ${PUID}:${PGID} /opt/alist/

umask ${UMASK}

while :
  do
    CODE=`curl -I -m 10 -o /dev/null -s -w %{http_code}  http://xiaoya-tvbox/api/public/settings`
    if [[ $CODE -eq 200 ]]; then
      echo -e "\033[42;34m xiaoya_server is ok \033[0m"
      break
    else
      sleep 1
    fi
  done

if [ "$1" = "version" ]; then
  ./alist version
else
  exec su-exec ${PUID}:${PGID} ./alist server --no-prefix
fi
