#!/bin/bash

chown -R ${PUID}:${PGID} /opt/alist/

umask ${UMASK}

echo -e `date +"%Y-%m-%d %H:%M:%S"` "等待中"
while :
  do
    CODE=`curl -I -m 10 -o /dev/null -s -w %{http_code}  http://xiaoya-tvbox/api/public/settings`
    if [[ $CODE -eq 200 ]]; then
      echo -e `date +"%Y-%m-%d %H:%M:%S"` "\033[42;34mxiaoya_server is ok.\033[0m"
      curl -s http://xiaoya-tvbox/api/public/settings
      break
    else
      curl -s http://xiaoya-tvbox/api/public/settings
      sleep 5
    fi
  done

if [ "$1" = "version" ]; then
  ./alist version
else
  sleep $[10*60]
  echo -e `date +"%Y-%m-%d %H:%M:%S"` "\033[42;34m启动 alist 服务.\033[0m"
  exec su-exec ${PUID}:${PGID} ./alist server --no-prefix
fi
