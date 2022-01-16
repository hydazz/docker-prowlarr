FROM vcxpz/baseimage-alpine:latest

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Prowlarr version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="hydaz"

# environment settings
ARG BRANCH="nightly"
ENV XDG_CONFIG_HOME="/config/xdg"

RUN \
	echo "**** install packages ****" && \
	apk add -U --upgrade --no-cache \
		jq \
		icu-libs \
		sqlite-libs && \
	echo "**** install prowlarr ****" && \
	mkdir -p /app/prowlarr/bin && \
	if [ -z ${VERSION+x} ]; then \
		VERSION=$(curl -sL "https://prowlarr.servarr.com/v1/update/${BRANCH}/changes?runtime=netcore&os=linuxmusl" | \
			jq -r '.[0].version'); \
	fi && \
	curl -o \
		/tmp/prowlarr.tar.gz -L \
		"https://prowlarr.servarr.com/v1/update/${BRANCH}/updatefile?version=${VERSION}&os=linuxmusl&runtime=netcore&arch=x64" && \
	tar xzf \
		/tmp/prowlarr.tar.gz -C \
		/app/prowlarr/bin --strip-components=1 && \
	echo -e "UpdateMethod=docker" >/app/prowlarr/package_info && \
	echo "**** cleanup ****" && \
	rm -rf \
		/app/prowlarr/bin/prowlarr.Update \
		/tmp/* \
		/var/tmp/*

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 9696
VOLUME /config
