FROM xhofe/alist:latest
LABEL MAINTAINER="fbigun rsdhlz@gmail.com"
COPY --chmod=0755 entrypoint.sh /entrypoint.sh
RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache aria2 curl ffmpeg; \
    rm -rf /var/cache/apk/*; \
    mkdir -p /root/.aria2; \
    cd /root/.aria2; \
    wget https://github.com/P3TERX/aria2.conf/archive/refs/heads/master.tar.gz; \
    tar -zxvf master.tar.gz --strip-components=1; \
    rm -rf master.tar.gz; \
    sed -i 's|rpc-secret|#rpc-secret|g' ./aria2.conf; \
    touch /root/.aria2/aria2.session; \
    ./tracker.sh
CMD [ "/entrypoint.sh" ]
