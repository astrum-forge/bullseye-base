FROM debian:11.11-slim

LABEL MAINTAINER="Astrum Forge Studios (https://www.astrumforge.com)"

# Allow specifying USD version at build-time:
ENV DEBIAN_VERSION=11.11
ENV CMAKE_VERSION="3.31.1"

WORKDIR /usr

# Install prerequisites for downloading, compiling and installing cmake
RUN apt-get update && apt-get install -y --no-install-recommends \
	wget \
	build-essential \
	checkinstall \
	zlib1g-dev \
	libssl-dev && \
	rm -rf /var/lib/apt/lists/* && \
	# Build & Install cmake latest version (required by usd build process)
	wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}.tar.gz && \
	tar -zxvf cmake-${CMAKE_VERSION}.tar.gz && \
	cd cmake-${CMAKE_VERSION} && \
	./bootstrap && make && make install && \
	cd ../ rm -rf && cmake-${CMAKE_VERSION} && \
	# Remove packages not needed anymore
	apt-get purge -y git \
	build-essential \
	wget \
	checkinstall \
	libxrandr-dev \
	zlib1g-dev \
	libssl-dev && \
	apt-get autoremove -y && \
	apt-get autoclean -y