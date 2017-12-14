[linuxserverurl]: https://linuxserver.io
[forumurl]: https://forum.linuxserver.io
[ircurl]: https://www.linuxserver.io/irc/
[podcasturl]: https://www.linuxserver.io/podcast/
[appurl]: www.example.com
[hub]: https://hub.docker.com/r/example/example/


[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png?v=4&s=4000)][linuxserverurl]


## Contact information

| Type | Address/Details |
| :---: | --- |
| Forum | [Linuserver.io forum][forumurl] |
| IRC | freenode at `#linuxserver.io` more information at [IRC][ircurl] |
| Podcast | Covers everything to do with getting the most from your Linux Server plus a focus on all things Docker and containerisation! [Linuxserver.io Podcast][podcasturl] |


The [LinuxServer.io][linuxserverurl] team brings you another image release featuring easy user mapping and based on alpine linux with s6 overlay.

# alexphillips/healthchecks

Healthchecks is a watchdog for your cron jobs. It's a web server that listens for pings from your cron jobs, plus a web interface.

&nbsp;

## Usage

```
docker create \
  --name=healthchecks \
  -v <path to data>:/config \
  -e PGID=<gid> -e PUID=<uid>  \
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
  alexphillips/healthchecks
```

&nbsp;

## Parameters

`The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side.
For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container.
So -p 8080:80 would expose port 80 from inside the container to be accessible from the host's IP on port 8080
http://192.168.x.x:8080 would show you what's running INSIDE the container on port 80.`

**NOTE:** Email configuration is required for sending out login links even if you don't use email as your method of alerting.

| Parameter | Function |
| :---: | --- |
| `-p 1234` | the port(s) |
| `-v /config` | database and healthchecks config |
| `-e PGID` | for GroupID, see below for explanation |
| `-e PUID` | for UserID, see below for explanation |
| `-e SITE_ROOT` | The site's domain (i.e., example.com) |
| `-e SITE_NAME` | The site's name |
| `-e DEFAULT_FROM_EMAIL` | From email for alerts |
| `-e EMAIL_HOST` | SMTP host |
| `-e EMAIL_PORT` | SMTP port |
| `-e EMAIL_HOST_USER` | SMTP user |
| `-e EMAIL_HOST_PASSWORD` | SMTP password |
| `-e EMAIL_USE_TLS` | Use TLS? |

&nbsp;

## User / Group Identifiers

Sometimes when using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and it will "just work" &trade;.

In this instance `PUID=1001` and `PGID=1001`, to find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

&nbsp;

## Setting up the application

Access the WebUI at <your-ip>:8000. For more information, check out [Healthchecks](https://github.com/healthchecks/healthchecks).


&nbsp;

## Container access and information.

| Function | Command |
| :--- | :--- |
| Shell access (live container) | `docker exec -it alexphillips/healthchecks /bin/bash` |
| Realtime container logs | `docker logs -f alexphillips/healthchecks` |
| Container version number | `docker inspect -f '{{ index .Config.Labels "build_version" }}' alexphillips/healthchecks` |
| Image version number |  `docker inspect -f '{{ index .Config.Labels "build_version" }}' alexphillips/healthchecks` |

&nbsp;

## Versions

|  Date | Changes |
| :---: | --- |
| 15.11.17 |  `git pull` is now in Dockerfile so each tagged container contains the same code version |
| 17.10.17 |  Fixed `local_settings.py` output |
| 27.09.17 |  Initial Release. |
