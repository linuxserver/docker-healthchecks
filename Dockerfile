FROM ghcr.io/linuxserver/baseimage-alpine:3.14

# set version label
ARG BUILD_DATE
ARG VERSION
ARG HEALTHCHECKS_RELEASE
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="alex-phillips"

RUN \
  echo "**** install build packages ****" && \
  apk add --no-cache --upgrade --virtual=build-dependencies \
    cargo \
    curl \
    gcc \
    jpeg-dev \
    libffi-dev \
    mariadb-dev \
    musl-dev \
    postgresql-dev \
    python3-dev \
    zlib-dev && \
  echo "**** install runtime packages ****" && \
  apk add --no-cache --upgrade \
    mariadb-client \
    postgresql-client \
    python3 \
    uwsgi \
    uwsgi-python \
    mariadb-connector-c-dev && \
  echo "**** install healthchecks ****" && \
  mkdir -p /app/healthchecks && \
  if [ -z ${HEALTHCHECKS_RELEASE+x} ]; then \
    HEALTHCHECKS_RELEASE=$(curl -sX GET "https://api.github.com/repos/healthchecks/healthchecks/releases/latest" \
      | awk '/tag_name/{print $4;exit}' FS='[""]'); \
  fi && \
  curl -o \
    /tmp/healthchecks.tar.gz -L \
    "https://github.com/healthchecks/healthchecks/archive/${HEALTHCHECKS_RELEASE}.tar.gz" && \
  tar xf \
    /tmp/healthchecks.tar.gz -C \
    /app/healthchecks/ --strip-components=1 && \
  echo "**** install pip packages ****" && \
  python3 -m ensurepip && \
  rm -rf /usr/lib/python*/ensurepip && \
  cd /app/healthchecks && \
  pip3 install \
    mysqlclient \
    wheel && \
  pip3 install --no-cache-dir --find-links https://wheel-index.linuxserver.io/alpine/ -r requirements.txt && \
  echo "**** overlay-fs bug workaround ****" && \
  mv /app/healthchecks /app/healthchecks-tmp && \
  echo "**** cleanup ****" && \
  apk del --purge \
    build-dependencies && \
  rm -rf \
    /root/.cache \
    /root/.cargo \
    /tmp/*

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 8000
VOLUME /config
