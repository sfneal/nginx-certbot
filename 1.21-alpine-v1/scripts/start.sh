#!/usr/bin/env bash

# Configure AWS creds
if [[ ${aws_s3} -gt 0 ]]
then
    sh /scripts/aws-credentials.sh
fi

# Replace @VALIDATION_DOMAIN placeholder with env variable value
replace_domain --domain ${validation_domain} \
    --conf-file /etc/nginx/conf.d/default.conf \
    --placeholder '@VALIDATION_DOMAIN'

# Download/create SSL certs for each domain
for d in ${domain}; do
    sh /sites-scripts/certify.sh ${d}
done

# Start Nginx service

nginx -t
nginx -g "daemon off;"