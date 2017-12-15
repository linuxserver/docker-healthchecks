FROM lsiobase/alpine.python:3.7

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="alex-phillips"

RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache --virtual=build-dependencies \
	gcc \
	musl-dev \
	mysql \
	postgresql-dev \
	python2-dev && \
 echo "**** install healthchecks ****" && \
 git clone https://github.com/healthchecks/healthchecks.git /app/healthchecks && \
 echo "**** install pip packages ****" && \
 cd /app/healthchecks && \
 pip install --no-cache-dir -r requirements.txt && \
 pip install --no-cache-dir reportlab && \
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
