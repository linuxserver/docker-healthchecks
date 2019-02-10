[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)](https://linuxserver.io)

The [LinuxServer.io](https://linuxserver.io) team brings you another container release featuring :-

 * regular and timely application updates
 * easy user mappings (PGID, PUID)
 * custom base image with s6 overlay
 * weekly base OS updates with common layers across the entire LinuxServer.io ecosystem to minimise space usage, down time and bandwidth
 * regular security updates

Find us at:
* [Discord](https://discord.gg/YWrKVTn) - realtime support / chat with the community and the team.
* [IRC](https://irc.linuxserver.io) - on freenode at `#linuxserver.io`. Our primary support channel is Discord.
* [Blog](https://blog.linuxserver.io) - all the things you can do with our containers including How-To guides, opinions and much more!
* [Podcast](https://anchor.fm/linuxserverio) - on hiatus. Coming back soon (late 2018).

# PSA: Changes are happening

From August 2018 onwards, Linuxserver are in the midst of switching to a new CI platform which will enable us to build and release multiple architectures under a single repo. To this end, existing images for `arm64` and `armhf` builds are being deprecated. They are replaced by a manifest file in each container which automatically pulls the correct image for your architecture. You'll also be able to pull based on a specific architecture tag.

TLDR: Multi-arch support is changing from multiple repos to one repo per container image.

# [linuxserver/healthchecks](https://github.com/linuxserver/docker-healthchecks)
[![](https://img.shields.io/discord/354974912613449730.svg?logo=discord&label=LSIO%20Discord&style=flat-square)](https://discord.gg/YWrKVTn)
[![](https://images.microbadger.com/badges/version/linuxserver/healthchecks.svg)](https://microbadger.com/images/linuxserver/healthchecks "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/linuxserver/healthchecks.svg)](https://microbadger.com/images/linuxserver/healthchecks "Get your own version badge on microbadger.com")
![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/healthchecks.svg)
![Docker Stars](https://img.shields.io/docker/stars/linuxserver/healthchecks.svg)
[![Build Status](https://ci.linuxserver.io/buildStatus/icon?job=Docker-Pipeline-Builders/docker-healthchecks/master)](https://ci.linuxserver.io/job/Docker-Pipeline-Builders/job/docker-healthchecks/job/master/)
[![](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/healthchecks/latest/badge.svg)](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/healthchecks/latest/index.html)

[Healthchecks](https://github.com/healthchecks/healthchecks) is a watchdog for your cron jobs. It's a web server that listens for pings from your cron jobs, plus a web interface.


[![healthchecks](https://raw.githubusercontent.com/healthchecks/healthchecks/master/static/img/welcome.png)](https://github.com/healthchecks/healthchecks)

## Supported Architectures

Our images support multiple architectures such as `x86-64`, `arm64` and `armhf`. We utilise the docker manifest for multi-platform awareness. More information is available from docker [here](https://github.com/docker/distribution/blob/master/docs/spec/manifest-v2-2.md#manifest-list). 

Simply pulling `linuxserver/healthchecks` should retrieve the correct image for your arch, but you can also pull specific arch images via tags.

The architectures supported by this image are:

| Architecture | Tag |
| :----: | --- |
| x86-64 | amd64-latest |
| arm64 | arm64v8-latest |
| armhf | arm32v6-latest |


## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=healthchecks \
  -e PUID=1001 \
  -e PGID=1001 \
  -e SITE_ROOT=<SITE_ROOT> \
  -e SITE_NAME=<SITE_NAME> \
  -e DEFAULT_FROM_EMAIL=<DEFAULT_FROM_EMAIL> \
  -e EMAIL_HOST=<EMAIL_HOST> \
  -e EMAIL_PORT=<EMAIL_PORT> \
  -e EMAIL_HOST_USER=<EMAIL_HOST_USER> \
  -e EMAIL_HOST_PASSWORD=<EMAIL_HOST_PASSWORD> \
  -e EMAIL_USE_TLS=<EMAIL_USE_TLS> \
  -e ALLOWED_HOSTS=<ALLOWED_HOSTS> \
  -p 8000:8000 \
  -v <path to data>:/config \
  --restart unless-stopped \
  linuxserver/healthchecks
```


### docker-compose

Compatible with docker-compose v2 schemas.

```
---
version: "2"
services:
  healthchecks:
    image: linuxserver/healthchecks
    container_name: healthchecks
    environment:
      - PUID=1001
      - PGID=1001
      - SITE_ROOT=<SITE_ROOT>
      - SITE_NAME=<SITE_NAME>
      - DEFAULT_FROM_EMAIL=<DEFAULT_FROM_EMAIL>
      - EMAIL_HOST=<EMAIL_HOST>
      - EMAIL_PORT=<EMAIL_PORT>
      - EMAIL_HOST_USER=<EMAIL_HOST_USER>
      - EMAIL_HOST_PASSWORD=<EMAIL_HOST_PASSWORD>
      - EMAIL_USE_TLS=<EMAIL_USE_TLS>
      - ALLOWED_HOSTS=<ALLOWED_HOSTS>
    volumes:
      - <path to data>:/config
    ports:
      - 8000:8000
    mem_limit: 4096m
    restart: unless-stopped
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 8000` | will map the container's port 8000 to port 8000 on the host |
| `-e PUID=1001` | for UserID - see below for explanation |
| `-e PGID=1001` | for GroupID - see below for explanation |
| `-e SITE_ROOT=<SITE_ROOT>` | The site's domain (i.e., example.com) |
| `-e SITE_NAME=<SITE_NAME>` | The site's name |
| `-e DEFAULT_FROM_EMAIL=<DEFAULT_FROM_EMAIL>` | From email for alerts |
| `-e EMAIL_HOST=<EMAIL_HOST>` | SMTP host |
| `-e EMAIL_PORT=<EMAIL_PORT>` | SMTP port |
| `-e EMAIL_HOST_USER=<EMAIL_HOST_USER>` | SMTP user |
| `-e EMAIL_HOST_PASSWORD=<EMAIL_HOST_PASSWORD>` | SMTP password |
| `-e EMAIL_USE_TLS=<EMAIL_USE_TLS>` | Use TLS for SMTP |
| `-e ALLOWED_HOSTS=<ALLOWED_HOSTS>` | array of valid hostnames for the server ["test.com","test2.com"] |
| `-v /config` | database and healthchecks config |

## User / Group Identifiers

When using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1001` and `PGID=1001`, to find yours use `id user` as below:

```
  $ id username
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```


&nbsp;
## Application Setup

Access the WebUI at <your-ip>:8000. For more information, check out [Healthchecks](https://github.com/healthchecks/healthchecks).



## Support Info

* Shell access whilst the container is running: `docker exec -it healthchecks /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f healthchecks`
* container version number 
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' healthchecks`
* image version number
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/healthchecks`

## Updating Info

Most of our images are static, versioned, and require an image update and container recreation to update the app inside. With some exceptions (ie. nextcloud, plex), we do not recommend or support updating apps inside the container. Please consult the [Application Setup](#application-setup) section above to see if it is recommended for the image.  
  
Below are the instructions for updating containers:  
  
### Via Docker Run/Create
* Update the image: `docker pull linuxserver/healthchecks`
* Stop the running container: `docker stop healthchecks`
* Delete the container: `docker rm healthchecks`
* Recreate a new container with the same docker create parameters as instructed above (if mapped correctly to a host folder, your `/config` folder and settings will be preserved)
* Start the new container: `docker start healthchecks`
* You can also remove the old dangling images: `docker image prune`

### Via Docker Compose
* Update the image: `docker-compose pull linuxserver/healthchecks`
* Let compose update containers as necessary: `docker-compose up -d`
* You can also remove the old dangling images: `docker image prune`

## Versions

* **11.10.18:** - adding pipeline logic and multi arching release
* **15.11.17:** - `git pull` is now in Dockerfile so each tagged container contains the same code version
* **17.10.17:** - Fixed `local_settings.py` output
* **27.09.17:** - Initial Release.
