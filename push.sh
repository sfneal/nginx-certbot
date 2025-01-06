#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Optional TAG argument (if set, only the specified image will be built)
TAG=${1:-null}

# Optional PLATFORM argument (if none provided, both will be built)
PLATFORM=${2:-"linux/amd64,linux/arm64"}

# Check if the TAG variable is set
if [ "$TAG" != null ]

  # Only build & push one image
  then
    docker buildx build \
      	--push \
      	-t stephenneal/nginx-certbot:"${TAG}" \
      	--platform "${PLATFORM}" \
      	"${DIR}"/"${TAG}"/

  # Build & push all images
  else
    sh "${DIR}"/build.sh

    docker push stephenneal/nginx-certbot:1.17-alpine-v1
    docker push stephenneal/nginx-certbot:1.18-alpine-v1
    docker push stephenneal/nginx-certbot:1.19-alpine-v1
    docker push stephenneal/nginx-certbot:1.20-alpine-v1
    docker push stephenneal/nginx-certbot:1.21-alpine-v1
    docker push stephenneal/nginx-certbot:1.21-alpine-v2
    docker push stephenneal/nginx-certbot:1.22-alpine
    docker push stephenneal/nginx-certbot:1.23-alpine
    docker push stephenneal/nginx-certbot:1.24-alpine
    docker push stephenneal/nginx-certbot:1.25-alpine
    docker push stephenneal/nginx-certbot:1.26-alpine
    docker push stephenneal/nginx-certbot:1.27-alpine
fi