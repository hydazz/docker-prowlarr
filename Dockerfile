FROM vcxpz/baseimage-alpine-arr:latest

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Prowlarr version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="hydaz"

# environment settings
ARG BRANCH=develop

RUN set -xe && \
	echo "**** install build packages ****" && \
	apk add --no-cache --virtual=build-dependencies \
		jq && \
	if [ "$(arch)" = "x86_64" ]; then \
		ARCH="x64"; \
	elif [ "$(arch)" = "aarch64" ]; then \
		ARCH="arm64"; \
	else \
		exit 1; \
	fi && \
	echo "**** install prowlarr ****" && \
	if [ -z ${VERSION} ]; then \
		VERSION=$(curl -sL "https://prowlarr.servarr.com/v1/update/${BRANCH}/changes?os=linuxmusl&runtime=netcore" | jq -r '.[0].version'); \
	fi && \
	mkdir -p /app/prowlarr/bin && \
	curl -o \
		/tmp/prowlarr.tar.gz -L \
		"https://prowlarr.servarr.com/v1/update/${BRANCH}/updatefile?version=${VERSION}&os=linuxmusl&runtime=netcore&arch=${ARCH}" && \
	tar xzf \
		/tmp/prowlarr.tar.gz -C \
		/app/prowlarr/bin --strip-components=1 && \
	printf "UpdateMethod=docker\nBranch=${BRANCH}\n" >/app/prowlarr/package_info && \
	echo "**** cleanup ****" && \
	apk del --purge \
		build-dependencies && \
	rm -rf \
		/app/prowlarr/bin/Prowlarr.Update \
		/tmp/*

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 9696
VOLUME /config
