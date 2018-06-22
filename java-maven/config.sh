#!/usr/bin/env bash

ECHO_PREFIX='===>'
# the base maven docker image tag
SOURCE_VERSION='3.5.2-jdk-8-alpine'
# the number of changes we have made to our derived image - increment on each change
CLC_REVISION='1'

export BUILD_TIMESTAMP=$(TZ= date +%Y%m%d%H%M%S)

export GIT_REPO_URL=$(git config remote.origin.url)
export GIT_ORG_REPO_NAME=$(git config remote.origin.url | cut -f4-5 -d"/" | cut -f1 -d".")
export GIT_REPO_NAME=$(git config remote.origin.url | cut -d '/' -f5 | cut -d '.' -f1)
export GIT_BRANCH_NAME=$(git branch | grep \* | cut -d ' ' -f2-)
export GIT_COMMIT_HASH=$(git rev-parse HEAD)

export DOCKER_REGISTRY_URL='https://index.docker.io/v1/'
export DOCKER_REGISTRY='index.docker.io'
export DOCKER_GROUP='makara'
export DOCKER_PROJECT="maven-java-ci"

export DOCKER_IMAGE_BASENAME="${DOCKER_REGISTRY}/${DOCKER_GROUP}/${DOCKER_PROJECT}"
export DOCKER_BUILD_IMAGE_NAME="${DOCKER_IMAGE_BASENAME}"
export DOCKER_BUILD_IMAGE_NAMETAG="${DOCKER_BUILD_IMAGE_NAME}:${SOURCE_VERSION}-r${CLC_REVISION}"

export CONTAINER_NAME="${DOCKER_PROJECT}"