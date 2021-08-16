## docker-prowlarr

[![docker hub](https://img.shields.io/badge/docker_hub-link-blue?style=for-the-badge&logo=docker)](https://hub.docker.com/r/vcxpz/prowlarr) ![docker image size](https://img.shields.io/docker/image-size/vcxpz/prowlarr?style=for-the-badge&logo=docker) [![auto build](https://img.shields.io/badge/docker_builds-automated-blue?style=for-the-badge&logo=docker?color=d1aa67)](https://github.com/hydazz/docker-prowlarr/actions?query=workflow%3A"Auto+Builder+CI") [![codacy branch grade](https://img.shields.io/codacy/grade/f0bc44e57131401490bc22ca08aa8629/main?style=for-the-badge&logo=codacy)](https://app.codacy.com/gh/hydazz/docker-prowlarr)

Fork of [linuxserver/docker-prowlarr](https://github.com/linuxserver/docker-prowlarr/) (Equivalent to develop-3.2.1.5070-ls21)

[Prowlarr](https://prowlarr.video/) - A fork of Sonarr to work with movies à la Couchpotato.

## Usage

```bash
docker run -d \
  --name=prowlarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Australia/Melbourne \
  -e DEBUG=true/false #optional \
  -p 7878:7878 \
  -v <path to appdata>:/config \
  -v <path to movies>:/movies \
  -v <path to downloads>:/downloads \
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
