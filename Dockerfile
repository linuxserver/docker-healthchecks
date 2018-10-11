FROM lsiobase/alpine:3.8

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="alex-phillips"

RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache \
	python3 && \
 apk add --no-cache --virtual=build-dependencies \
	curl \
	gcc \
	git \
	jpeg-dev \
	musl-dev \
	mysql \
	postgresql-dev \
	python3-dev \
	py3-pip \
	zlib-dev && \
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
