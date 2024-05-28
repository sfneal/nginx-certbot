FROM nginx:1.21-alpine
MAINTAINER Stephen Neal <stephen@stephenneal.net>

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
    py3-pip \
    py3-six \
    py3-packaging

# Install Python dependencies
COPY ./requirements.txt ./requirements.txt
RUN pip3 install --upgrade pip \
	&& pip3 install -r ./requirements.txt \
	&& rm ./requirements.txt

# Copy configuration
COPY ./scripts/ /scripts/
COPY ./nginx /etc/nginx/
COPY ./sites-scripts/ /sites-scripts/

ENTRYPOINT ["bash"]
CMD ["/scripts/start.sh"]