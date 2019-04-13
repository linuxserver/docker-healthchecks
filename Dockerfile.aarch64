FROM lsiobase/alpine:arm64v8-3.9

# set version label
ARG BUILD_DATE
ARG VERSION
ARG HEALTHCHECKS_RELEASE
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="alex-phillips"

RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache --upgrade --virtual=build-dependencies \
	curl \
	gcc \
	git \
	jpeg-dev \
	mariadb-dev \
	musl-dev \
	mysql \
	postgresql-dev \
	py3-pip \
	python3-dev \
	zlib-dev && \
 echo "**** install runtime packages ****" && \
 apk add --no-cache --upgrade \
        mariadb-connector-c \
	python3 \
	uwsgi \
	uwsgi-python3 && \
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
 cd /app/healthchecks && \
 pip3 install --no-cache-dir -r requirements.txt && \
 pip3 install \
 	mysqlclient && \
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
