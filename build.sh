#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

docker build -t stephenneal/nginx-certbot:1.17-alpine-v1 "${DIR}"/1.17-alpine-v1/