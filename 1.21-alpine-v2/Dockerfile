FROM nginx:1.21-alpine

# Domain environment variable
ENV domain=example.com

# AWS S3 creditentials
ENV aws_s3=0
ENV aws_s3_upload=0
ENV aws_s3_download=0
ENV aws_s3_bucket=""
ENV aws_access_key_id=""
ENV aws_secret_access_key=""
ENV aws_region_name=""

# Make Webroot & nginx directory
RUN mkdir /webroot/ \
    && mkdir /webroot/certbot/ \
    && mkdir /etc/nginx/conf/ \
    && chmod -R 777 /webroot/certbot/

# Update OS then install openssl, curl
RUN apk update && apk add \
    bash \
    curl \
    openssl \
    python3 \
    py3-pip

# Install replace_domain & awsutils-s3
RUN pip3 install --upgrade pip \
    && pip3 install \
        replace_domain>=1.0.4 \
        awsutils-s3>=0.3.20

# Download recommended TLS parameters
COPY --from=stephenneal/nginx-laravel:1.17-alpine-v10 /etc/nginx/ /etc/nginx/

# Copy configuration
COPY ./scripts/ /scripts/
COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./sites-scripts/ /sites-scripts/

ENTRYPOINT ["bash"]
CMD ["/scripts/start.sh"]