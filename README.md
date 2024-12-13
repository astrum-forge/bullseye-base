## About

A Debian (Bullseye) slim-based Docker image preconfigured with a specified version of CMake, offering a stable foundation for building and testing modern software projects.

## Features

- **Specific CMake Version**: The image tag indicates the version of CMake installed, ensuring you know exactly which version you're working with.
- **Lightweight**: Built on the slim variant of Debian Bullseye to keep the image size small.

## Usage

Pull the image from Docker Hub:

```bash
docker pull astrumforge/bullseye-base:<cmake-version>
```

Use it as a base in your Dockerfile:

```dockerfile
FROM astrumforge/bullseye-base:<cmake-version>
# Add your build steps here
```

Replace `<cmake-version>` with the desired CMake version tag (e.g., `3.31.1`).

## Links

- **CMake Website**: [https://cmake.org](https://cmake.org)  
- **Docker Repository**: [https://hub.docker.com/r/astrumforge/bullseye-base](https://hub.docker.com/r/astrumforge/bullseye-base)