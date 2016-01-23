# Adapted from https://github.com/xueshanf/docker-awscli

FROM gliderlabs/alpine:3.1

RUN apk --update add \
      less \
      groff \
      python \
      py-pip \
      jq \
      curl \
      bash

RUN pip install --upgrade awscli

RUN mkdir /root/.aws
