## docker-prowlarr

[![docker hub](https://img.shields.io/badge/docker_hub-link-blue?style=for-the-badge&logo=docker)](https://hub.docker.com/r/vcxpz/prowlarr) ![docker image size](https://img.shields.io/docker/image-size/vcxpz/prowlarr?style=for-the-badge&logo=docker) [![auto build](https://img.shields.io/badge/docker_builds-automated-blue?style=for-the-badge&logo=docker?color=d1aa67)](https://github.com/hydazz/docker-prowlarr/actions?query=workflow%3A"Auto+Builder+CI")

Fork of [linuxserver/docker-prowlarr](https://github.com/linuxserver/docker-prowlarr/) (Equivalent to nightly-0.1.1.875-ls132)

[Prowlarr](https://github.com/Prowlarr/Prowlarr) is a indexer manager/proxy built on the popular arr .net/reactjs base stack to integrate with your various PVR apps. Prowlarr supports both Torrent Trackers and Usenet Indexers. It integrates seamlessly with Sonarr, Radarr, Lidarr, and Readarr offering complete management of your indexers with no per app Indexer setup required (we do it all).

## Usage

```bash
docker run -d \
  --name=prowlarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Australia/Melbourne \
  -e DEBUG=true/false #optional \
  -p 9696:9696 \
  -v <path to appdata>:/config \
  --restart unless-stopped \
  vcxpz/prowlarr
```

[![template](https://img.shields.io/badge/unraid_template-ff8c2f?style=for-the-badge&logo=docker?color=d1aa67)](https://github.com/hydazz/docker-templates/blob/main/hydaz/prowlarr.xml)

## New Environment Variables

| Name    | Description                                                                                              | Default Value |
| ------- | -------------------------------------------------------------------------------------------------------- | ------------- |
| `DEBUG` | set `true` to display errors in the Docker logs. When set to `false` the Docker log is completely muted. | `false`       |

**See other variables on the official [README](https://github.com/linuxserver/docker-prowlarr/)**

## Upgrading Prowlarr

To upgrade, all you have to do is pull the latest Docker image. We automatically check for Prowlarr updates every hour. When a new version is released, we build and publish an image both as a version tag and on `:latest`.

## Credits

-   [hotio](https://github.com/hotio) for the `redirect_cmd` function

## Fixing Appdata Permissions

If you ever accidentally screw up the permissions on the appdata folder, run `fix-perms` within the container. This will restore most of the files/folders with the correct permissions.
