#!/usr/bin/env bash

REPO="kmade/nocker"
docker build -t $REPO . && docker push $REPO


# Remove all images
# docker rmi $(docker images -f "dangling=true" -q)
# docker rmi -f $(docker images -a -q)
# Remove all containers
# docker rm -f $(docker ps -a -q)

# Remove volumes
# docker volume rm $(docker volume ls -q)
