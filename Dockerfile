FROM lsiobase/alpine.python:3.7

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="alex-phillips"

# install packages
RUN \
 apk add --no-cache \
    gcc \
    musl-dev \
    mysql \
    postgresql-dev \
    python2-dev && \

 git clone https://github.com/healthchecks/healthchecks.git /app

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 8000
VOLUME /config
