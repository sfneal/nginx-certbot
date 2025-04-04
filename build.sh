#!/usr/bin/env bash

# Base directory containing source code
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Optional TAG argument (if set, only the specified image will be built)
TAG=${1:-null}

# Optional PLATFORM argument (if none provided, both will be built)
PLATFORM=${2:-"linux/amd64,linux/arm64"}

# Check if the TAG variable is set
if [ "$TAG" != null ]

  # Only build one image
  then
    docker buildx build \
      	--load \
      	-t stephenneal/nginx-certbot:"${TAG}" \
      	--platform "${PLATFORM}" \
      	"${DIR}"/"${TAG}"/

  # Build all images
  else
    docker build -t stephenneal/nginx-certbot:1.17-alpine-v1 "${DIR}"/1.17-alpine-v1/
    docker build -t stephenneal/nginx-certbot:1.18-alpine-v1 "${DIR}"/1.18-alpine-v1/
    docker build -t stephenneal/nginx-certbot:1.19-alpine-v1 "${DIR}"/1.19-alpine-v1/
    docker build -t stephenneal/nginx-certbot:1.20-alpine-v1 "${DIR}"/1.20-alpine-v1/
    docker build -t stephenneal/nginx-certbot:1.21-alpine-v1 "${DIR}"/1.21-alpine-v1/
    docker build -t stephenneal/nginx-certbot:1.21-alpine-v2 "${DIR}"/1.21-alpine-v2/
    docker build -t stephenneal/nginx-certbot:1.22-alpine "${DIR}"/1.22-alpine/
    docker build -t stephenneal/nginx-certbot:1.23-alpine "${DIR}"/1.23-alpine/
    docker build -t stephenneal/nginx-certbot:1.24-alpine "${DIR}"/1.24-alpine/
    docker build -t stephenneal/nginx-certbot:1.25-alpine "${DIR}"/1.25-alpine/
    docker build -t stephenneal/nginx-certbot:1.26-alpine "${DIR}"/1.26-alpine/
    docker build -t stephenneal/nginx-certbot:1.27-alpine "${DIR}"/1.27-alpine/
fi