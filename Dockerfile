FROM debian:bullseye-slim

LABEL MAINTAINER="Astrum Forge Studios (https://www.astrumforge.com)"

# Allow specifying CMake version at build-time
ARG CMAKE_VERSION=3.31.1
ENV CMAKE_VERSION="${CMAKE_VERSION}"

WORKDIR /usr

# Install prerequisites for downloading, compiling, and installing cmake
RUN apt-get update && apt-get install -y --no-install-recommends \
	ca-certificates \
	wget \
	build-essential \
	zlib1g-dev \
	libcurl4-openssl-dev \
	libssl-dev && \
	rm -rf /var/lib/apt/lists/* && \
	# Build & Install CMake latest version
	wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}.tar.gz && \
	tar -zxvf cmake-${CMAKE_VERSION}.tar.gz && \
	cd cmake-${CMAKE_VERSION} && \
	./bootstrap && make && make install && \
	cd ../ && rm -rf cmake-${CMAKE_VERSION} cmake-${CMAKE_VERSION}.tar.gz && \
	# Remove development tools and unnecessary dependencies
	apt-mark auto $(apt-mark showmanual) && \
	apt-get remove -y --purge \
	build-essential \
	zlib1g-dev \
	libcurl4-openssl-dev \
	libssl-dev && \
	apt-get autoremove -y && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Verify CMake installation
RUN cmake --version