#!/usr/bin/env bash

# Configure AWS creds
if [[ ${aws_s3} -gt 0 ]]
then
    sh /scripts/aws-credentials.sh
fi

# Download/create SSL certs for each domain
for d in ${domain}; do
    sh /sites-scripts/certify.sh ${d}
done

# Start Nginx service

nginx -t
nginx -g "daemon off;"