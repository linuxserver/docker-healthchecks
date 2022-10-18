<!-- DO NOT EDIT THIS FILE MANUALLY  -->
<!-- Please read the https://github.com/linuxserver/docker-healthchecks/blob/master/.github/CONTRIBUTING.md -->

[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)](https://linuxserver.io)

[![Blog](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=linuxserver.io&message=Blog)](https://blog.linuxserver.io "all the things you can do with our containers including How-To guides, opinions and much more!")
[![Discord](https://img.shields.io/discord/354974912613449730.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=Discord&logo=discord)](https://discord.gg/YWrKVTn "realtime support / chat with the community and the team.")
[![Discourse](https://img.shields.io/discourse/https/discourse.linuxserver.io/topics.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=discourse)](https://discourse.linuxserver.io "post on our community forum.")
[![Fleet](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=linuxserver.io&message=Fleet)](https://fleet.linuxserver.io "an online web interface which displays all of our maintained images.")
[![GitHub](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=linuxserver.io&message=GitHub&logo=github)](https://github.com/linuxserver "view the source for all of our repositories.")
[![Open Collective](https://img.shields.io/opencollective/all/linuxserver.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=Supporters&logo=open%20collective)](https://opencollective.com/linuxserver "please consider helping us by either donating or contributing to our budget")

The [LinuxServer.io](https://linuxserver.io) team brings you another container release featuring:

* regular and timely application updates
* easy user mappings (PGID, PUID)
* custom base image with s6 overlay
* weekly base OS updates with common layers across the entire LinuxServer.io ecosystem to minimise space usage, down time and bandwidth
* regular security updates

Find us at:

* [Blog](https://blog.linuxserver.io) - all the things you can do with our containers including How-To guides, opinions and much more!
* [Discord](https://discord.gg/YWrKVTn) - realtime support / chat with the community and the team.
* [Discourse](https://discourse.linuxserver.io) - post on our community forum.
* [Fleet](https://fleet.linuxserver.io) - an online web interface which displays all of our maintained images.
* [GitHub](https://github.com/linuxserver) - view the source for all of our repositories.
* [Open Collective](https://opencollective.com/linuxserver) - please consider helping us by either donating or contributing to our budget

# [linuxserver/healthchecks](https://github.com/linuxserver/docker-healthchecks)

[![Scarf.io pulls](https://scarf.sh/installs-badge/linuxserver-ci/linuxserver%2Fhealthchecks?color=94398d&label-color=555555&logo-color=ffffff&style=for-the-badge&package-type=docker)](https://scarf.sh/gateway/linuxserver-ci/docker/linuxserver%2Fhealthchecks)
[![GitHub Stars](https://img.shields.io/github/stars/linuxserver/docker-healthchecks.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/linuxserver/docker-healthchecks)
[![GitHub Release](https://img.shields.io/github/release/linuxserver/docker-healthchecks.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/linuxserver/docker-healthchecks/releases)
[![GitHub Package Repository](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=linuxserver.io&message=GitHub%20Package&logo=github)](https://github.com/linuxserver/docker-healthchecks/packages)
[![GitLab Container Registry](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=linuxserver.io&message=GitLab%20Registry&logo=gitlab)](https://gitlab.com/linuxserver.io/docker-healthchecks/container_registry)
[![Quay.io](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=linuxserver.io&message=Quay.io)](https://quay.io/repository/linuxserver.io/healthchecks)
[![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/healthchecks.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=pulls&logo=docker)](https://hub.docker.com/r/linuxserver/healthchecks)
[![Docker Stars](https://img.shields.io/docker/stars/linuxserver/healthchecks.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=stars&logo=docker)](https://hub.docker.com/r/linuxserver/healthchecks)
[![Jenkins Build](https://img.shields.io/jenkins/build?labelColor=555555&logoColor=ffffff&style=for-the-badge&jobUrl=https%3A%2F%2Fci.linuxserver.io%2Fjob%2FDocker-Pipeline-Builders%2Fjob%2Fdocker-healthchecks%2Fjob%2Fmaster%2F&logo=jenkins)](https://ci.linuxserver.io/job/Docker-Pipeline-Builders/job/docker-healthchecks/job/master/)
[![LSIO CI](https://img.shields.io/badge/dynamic/yaml?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=CI&query=CI&url=https%3A%2F%2Fci-tests.linuxserver.io%2Flinuxserver%2Fhealthchecks%2Flatest%2Fci-status.yml)](https://ci-tests.linuxserver.io/linuxserver/healthchecks/latest/index.html)

[Healthchecks](https://github.com/healthchecks/healthchecks) is a watchdog for your cron jobs. It's a web server that listens for pings from your cron jobs, plus a web interface.

[![healthchecks](https://raw.githubusercontent.com/healthchecks/healthchecks/master/static/img/welcome.png)](https://github.com/healthchecks/healthchecks)

## Supported Architectures

We utilise the docker manifest for multi-platform awareness. More information is available from docker [here](https://github.com/docker/distribution/blob/master/docs/spec/manifest-v2-2.md#manifest-list) and our announcement [here](https://blog.linuxserver.io/2019/02/21/the-lsio-pipeline-project/).

Simply pulling `lscr.io/linuxserver/healthchecks:latest` should retrieve the correct image for your arch, but you can also pull specific arch images via tags.

The architectures supported by this image are:

| Architecture | Available | Tag |
| :----: | :----: | ---- |
| x86-64 | ✅ | amd64-\<version tag\> |
| arm64 | ✅ | arm64v8-\<version tag\> |
| armhf| ✅ | arm32v7-\<version tag\> |

## Application Setup

Access the WebUI at <your-ip>:8000. For more information, check out [Healthchecks](https://github.com/healthchecks/healthchecks).

## Usage

Here are some example snippets to help you get started creating a container.

### docker-compose (recommended, [click here for more info](https://docs.linuxserver.io/general/docker-compose))

```yaml
---
version: "2.1"
services:
  healthchecks:
    image: lscr.io/linuxserver/healthchecks:latest
    container_name: healthchecks
    environment:
      - PUID=1000
      - PGID=1000
      - SITE_ROOT=
      - SITE_NAME=
      - DEFAULT_FROM_EMAIL=
      - EMAIL_HOST=
      - EMAIL_PORT=
      - EMAIL_HOST_USER=
      - EMAIL_HOST_PASSWORD=
      - EMAIL_USE_TLS=
      - SUPERUSER_EMAIL=
      - SUPERUSER_PASSWORD=
      - REGENERATE_SETTINGS= #optional
      - SITE_LOGO_URL= #optional
      - ALLOWED_HOSTS= #optional
      - SECRET_KEY= #optional
      - APPRISE_ENABLED= #optional
    volumes:
      - /path/to/data:/config
    ports:
      - 8000:8000
    restart: unless-stopped
```

### docker cli ([click here for more info](https://docs.docker.com/engine/reference/commandline/cli/))

```bash
docker run -d \
  --name=healthchecks \
  -e PUID=1000 \
  -e PGID=1000 \
  -e SITE_ROOT= \
  -e SITE_NAME= \
  -e DEFAULT_FROM_EMAIL= \
  -e EMAIL_HOST= \
  -e EMAIL_PORT= \
  -e EMAIL_HOST_USER= \
  -e EMAIL_HOST_PASSWORD= \
  -e EMAIL_USE_TLS= \
  -e SUPERUSER_EMAIL= \
  -e SUPERUSER_PASSWORD= \
  -e REGENERATE_SETTINGS= `#optional` \
  -e SITE_LOGO_URL= `#optional` \
  -e ALLOWED_HOSTS= `#optional` \
  -e SECRET_KEY= `#optional` \
  -e APPRISE_ENABLED= `#optional` \
  -p 8000:8000 \
  -v /path/to/data:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/healthchecks:latest
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 8000` | will map the container's port 8000 to port 8000 on the host |
| `-e PUID=1000` | for UserID - see below for explanation |
| `-e PGID=1000` | for GroupID - see below for explanation |
| `-e SITE_ROOT=` | The site's top-level URL and the port it listens to if differrent than 80 or 443 (e.g., https://healthchecks.example.com:8000) |
| `-e SITE_NAME=` | The site's name (e.g., "Example Corp HealthChecks") |
| `-e DEFAULT_FROM_EMAIL=` | From email for alerts |
| `-e EMAIL_HOST=` | SMTP host |
| `-e EMAIL_PORT=` | SMTP port |
| `-e EMAIL_HOST_USER=` | SMTP user |
| `-e EMAIL_HOST_PASSWORD=` | SMTP password |
| `-e EMAIL_USE_TLS=` | Use TLS for SMTP (`True` or `False`) |
| `-e SUPERUSER_EMAIL=` | Superuser email |
| `-e SUPERUSER_PASSWORD=` | Superuser password |
| `-e REGENERATE_SETTINGS=` | Defaults to False. Set to true to always override the `local_settings.py` file with values from environment variables. Do not set to True if you have made manual modifications to this file. |
| `-e SITE_LOGO_URL=` | Full URL to custom site logo |
| `-e ALLOWED_HOSTS=` | Array of valid hostnames for the server `["test.com","test2.com"]` (default: `["*"]`) |
| `-e SECRET_KEY=` | A secret key used for cryptographic signing. Will generate a secure value if one is not supplied |
| `-e APPRISE_ENABLED=` | Defaults to False. A boolean that turns on/off the Apprise integration (https://github.com/caronc/apprise) |
| `-v /config` | Database and healthchecks config directory |

## Environment variables from files (Docker secrets)

You can set any environment variable from a file by using a special prepend `FILE__`.

As an example:

```bash
-e FILE__PASSWORD=/run/secrets/mysecretpassword
```

Will set the environment variable `PASSWORD` based on the contents of the `/run/secrets/mysecretpassword` file.

## Umask for running applications

For all of our images we provide the ability to override the default umask settings for services started within the containers using the optional `-e UMASK=022` setting.
Keep in mind umask is not chmod it subtracts from permissions based on it's value it does not add. Please read up [here](https://en.wikipedia.org/wiki/Umask) before asking for support.

## User / Group Identifiers

When using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1000` and `PGID=1000`, to find yours use `id user` as below:

```bash
  $ id username
    uid=1000(dockeruser) gid=1000(dockergroup) groups=1000(dockergroup)
```

## Docker Mods

[![Docker Mods](https://img.shields.io/badge/dynamic/yaml?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=healthchecks&query=%24.mods%5B%27healthchecks%27%5D.mod_count&url=https%3A%2F%2Fraw.githubusercontent.com%2Flinuxserver%2Fdocker-mods%2Fmaster%2Fmod-list.yml)](https://mods.linuxserver.io/?mod=healthchecks "view available mods for this container.") [![Docker Universal Mods](https://img.shields.io/badge/dynamic/yaml?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=universal&query=%24.mods%5B%27universal%27%5D.mod_count&url=https%3A%2F%2Fraw.githubusercontent.com%2Flinuxserver%2Fdocker-mods%2Fmaster%2Fmod-list.yml)](https://mods.linuxserver.io/?mod=universal "view available universal mods.")

We publish various [Docker Mods](https://github.com/linuxserver/docker-mods) to enable additional functionality within the containers. The list of Mods available for this image (if any) as well as universal mods that can be applied to any one of our images can be accessed via the dynamic badges above.

## Support Info

* Shell access whilst the container is running: `docker exec -it healthchecks /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f healthchecks`
* container version number
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' healthchecks`
* image version number
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' lscr.io/linuxserver/healthchecks:latest`

## Updating Info

Most of our images are static, versioned, and require an image update and container recreation to update the app inside. With some exceptions (ie. nextcloud, plex), we do not recommend or support updating apps inside the container. Please consult the [Application Setup](#application-setup) section above to see if it is recommended for the image.

Below are the instructions for updating containers:

### Via Docker Compose

* Update all images: `docker-compose pull`
  * or update a single image: `docker-compose pull healthchecks`
* Let compose update all containers as necessary: `docker-compose up -d`
  * or update a single container: `docker-compose up -d healthchecks`
* You can also remove the old dangling images: `docker image prune`

### Via Docker Run

* Update the image: `docker pull lscr.io/linuxserver/healthchecks:latest`
* Stop the running container: `docker stop healthchecks`
* Delete the container: `docker rm healthchecks`
* Recreate a new container with the same docker run parameters as instructed above (if mapped correctly to a host folder, your `/config` folder and settings will be preserved)
* You can also remove the old dangling images: `docker image prune`

### Via Watchtower auto-updater (only use if you don't remember the original parameters)

* Pull the latest image at its tag and replace it with the same env variables in one run:

  ```bash
  docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  containrrr/watchtower \
  --run-once healthchecks
  ```

* You can also remove the old dangling images: `docker image prune`

**Note:** We do not endorse the use of Watchtower as a solution to automated updates of existing Docker containers. In fact we generally discourage automated updates. However, this is a useful tool for one-time manual updates of containers where you have forgotten the original parameters. In the long term, we highly recommend using [Docker Compose](https://docs.linuxserver.io/general/docker-compose).

### Image Update Notifications - Diun (Docker Image Update Notifier)

* We recommend [Diun](https://crazymax.dev/diun/) for update notifications. Other tools that automatically update containers unattended are not recommended or supported.

## Building locally

If you want to make local modifications to these images for development purposes or just to customize the logic:

```bash
git clone https://github.com/linuxserver/docker-healthchecks.git
cd docker-healthchecks
docker build \
  --no-cache \
  --pull \
  -t lscr.io/linuxserver/healthchecks:latest .
```

The ARM variants can be built on x86_64 hardware using `multiarch/qemu-user-static`

```bash
docker run --rm --privileged multiarch/qemu-user-static:register --reset
```

Once registered you can define the dockerfile to use with `-f Dockerfile.aarch64`.

## Versions

* **18.10.22:** - Add curl-dev to fix broken pip builds.
* **11.10.22:** - Rebase to Alpine 3.16, migrate to s6v3.
* **27.09.22:** - Fix sending of Email Reports
* **08.01.22:** - Fix CSRF setting for Django 4.0 (introduced in v1.25.0)
* **11.11.21:** - Add Apprise to Docker as in v1.24.0
* **10.09.21:** - Fix creation of superuser
* **07.08.21:** - Update custom logo handling to support changes in v1.22.0
* **11.07.21:** - Rebase to Alpine 3.14.
* **18.05.21:** - Add linuxserver wheel index.
* **11.01.21:** - Add libffi-dev to allow building of python cryptography lib.
* **19.07.20:** - Rebasing to alpine 3.12, fixed 'ALLOWED_HOSTS' bug, now defaults to wildcard
* **19.12.19:** - Rebasing to alpine 3.11.
* **31.10.19:** - Add postgres client and fix config for CSRF.
* **23.10.19:** - Allow to create superuser
* **28.06.19:** - Rebasing to alpine 3.10.
* **12.04.19:** - Rebase to Alpine 3.9.
* **23.03.19:** - Switching to new Base images, shift to arm32v7 tag.
* **14.02.19:** - Adding mysql libs needed for using a database.
* **11.10.18:** - adding pipeline logic and multi arching release
* **15.11.17:** - `git pull` is now in Dockerfile so each tagged container contains the same code version
* **17.10.17:** - Fixed `local_settings.py` output
* **27.09.17:** - Initial Release.
