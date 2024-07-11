FROM xhofe/alist:latest
LABEL MAINTAINER="fbigun rsdhlz@gmail.com"
COPY --chmod=0755 entrypoint.sh /entrypoint.sh
RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache curl ffmpeg; \
    rm -rf /var/cache/apk/*
CMD [ "/entrypoint.sh" ]
