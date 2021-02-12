FROM ghcr.io/linuxserver/baseimage-alpine:3.12

# set version label
ARG BUILD_DATE
ARG VERSION
ARG HEALTHCHECKS_RELEASE
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="alex-phillips"

ENV CRYPTOGRAPHY_DONT_BUILD_RUST=true

RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache --upgrade --virtual=build-dependencies \
	curl \
	gcc \
	git \
	jpeg-dev \
	libffi-dev \
	mariadb-dev \
	musl-dev \
	mysql \
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
 pip3 install mysqlclient && \ 
 pip3 install --no-cache-dir -r requirements.txt && \
 echo "**** cleanup ****" && \
 apk del --purge \
	build-dependencies && \
 rm -rf \
	/root/.cache \
	/tmp/*

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 8000
VOLUME /config
