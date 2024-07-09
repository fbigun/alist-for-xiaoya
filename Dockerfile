FROM xhofe/alist:latest-ffmpeg
LABEL MAINTAINER="fbigun rsdhlz@gmail.com"
COPY --chmod=0755 entrypoint.sh /entrypoint.sh
RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache curl; \
    rm -rf /var/cache/apk/*
CMD [ "/entrypoint.sh" ]
