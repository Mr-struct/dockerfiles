# USAGE:
# Use as a base image for other Rails Dockerfiles. Do not run directly.

FROM ruby:2.1.3
RUN apt-get update -qq && apt-get install -y openssl build-essential xorg libpq-dev libssl-dev nodejs fontconfig

WORKDIR /root
ADD http://download.gna.org/wkhtmltopdf/0.12/0.12.3/wkhtmltox-0.12.3_linux-generic-amd64.tar.xz /root
RUN tar xf /root/wkhtmltox-0.12.3_linux-generic-amd64.tar.xz
RUN mv /root/wkhtmltox/bin/wkhtmltopdf /usr/local/bin/wkhtmltopdf
RUN rm -rf /root/wkhtmltox
RUN rm -rf /root/wkhtmltox-0.12.3_linux-generic-amd64.tar.xz

ADD https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 /root
RUN tar jxf /root/phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN mv /root/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs
RUN rm -rf /root/phantomjs-2.1.1-linux-x86_64
