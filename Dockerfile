FROM lsiobase/alpine:3.8

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="alex-phillips"

RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache --virtual=build-dependencies \
	gcc \
	git \
	jpeg-dev \
	musl-dev \
	mysql \
	postgresql-dev \
	py3-pip \
	python3-dev \
	zlib-dev && \
 echo "**** install runtime packages ****" && \
 apk add --no-cache \
	python3 && \
 echo "**** install healthchecks ****" && \
 git clone https://github.com/healthchecks/healthchecks.git /app/healthchecks && \
 echo "**** install pip packages ****" && \
 cd /app/healthchecks && \
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
