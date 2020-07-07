#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

sh "${DIR}"/build.sh

docker push stephenneal/nginx-certbot:1.17-alpine-v1
docker push stephenneal/nginx-certbot:1.18-alpine-v1
docker push stephenneal/nginx-certbot:1.19-alpine-v1