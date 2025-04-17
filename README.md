# CROSS_AARCH64
docker container linux-aarch64 for cross compilation

docker buildx build --platform linux/arm64 --no-cache -t muos-aarch64 .

docker buildx build --platform linux/arm64 -t muos-aarch64:latest --no-cache --load .
docker run --rm -it muos-aarch64 /bin/bash

