FROM node:8.1-alpine AS base
# Dockerfile author / maintainer
MAINTAINER Dragosh <oancea.dragosh@gmail.com>
LABEL vendor="KustomMade"

RUN apk add --no-cache --update \
    python \
    python-dev \
    py-pip \
    build-base \
    tini \

  && pip install virtualenv \
  && rm -rf /var/cache/apk/*

COPY start.sh /start.sh
CMD ["sh", "/start.sh"]
