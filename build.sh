#!/usr/bin/env bash

# Base directory containing source code
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Optional TAG argument (if set, only the specified image will be built)
TAG=${1:-null}

# Check if the TAG variable is set
if [ "$TAG" != null ]

  # Only build one image
  then
    docker build -t stephenneal/nginx-certbot:"${TAG}" "${DIR}"/"${TAG}"/

  # Build all images
  else
    docker build -t stephenneal/nginx-certbot:1.17-alpine-v1 "${DIR}"/1.17-alpine-v1/
    docker build -t stephenneal/nginx-certbot:1.18-alpine-v1 "${DIR}"/1.18-alpine-v1/
    docker build -t stephenneal/nginx-certbot:1.19-alpine-v1 "${DIR}"/1.19-alpine-v1/
    docker build -t stephenneal/nginx-certbot:1.20-alpine-v1 "${DIR}"/1.20-alpine-v1/
    docker build -t stephenneal/nginx-certbot:1.21-alpine-v1 "${DIR}"/1.21-alpine-v1/
    docker build -t stephenneal/nginx-certbot:1.21-alpine-v2 "${DIR}"/1.21-alpine-v2/
    docker build -t stephenneal/nginx-certbot:1.22-alpine-v1 "${DIR}"/1.22-alpine-v1/
    docker build -t stephenneal/nginx-certbot:1.23-alpine-v1 "${DIR}"/1.23-alpine-v1/
fi