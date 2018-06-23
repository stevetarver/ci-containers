#!/usr/bin/env bash
#
# Common definitions for all builds
#

export BUILD_TIMESTAMP=$(TZ= date +%Y%m%d%H%M%S)

# NOTE: Only push images when this repo is committed so these values are meaningful
export GIT_REPO_URL=$(git config remote.origin.url)
export GIT_ORG_REPO_NAME=$(git config remote.origin.url | cut -f4-5 -d"/" | cut -f1 -d".")
export GIT_REPO_NAME=$(git config remote.origin.url | cut -d '/' -f5 | cut -d '.' -f1)
export GIT_BRANCH_NAME=$(git branch | grep \* | cut -d ' ' -f2-)
export GIT_COMMIT_HASH=$(git rev-parse HEAD)

# If we were to use an image repository other than Docker, we would define these as:
#export DOCKER_REGISTRY='quay.io'
#export DOCKER_IMAGE_BASENAME="${DOCKER_REGISTRY}/${DOCKER_GROUP}/${DOCKER_PROJECT}"

export DOCKER_REGISTRY_URL='index.docker.io'
export DOCKER_GROUP='stevetarver'

export DOCKER_IMAGE_BASENAME="${DOCKER_GROUP}/${DOCKER_PROJECT}"
export DOCKER_BUILD_IMAGE_NAME="${DOCKER_IMAGE_BASENAME}"
export DOCKER_BUILD_IMAGE_NAMETAG="${DOCKER_BUILD_IMAGE_NAME}:${SOURCE_VERSION}-r${OUR_REVISION}"

export CONTAINER_NAME="${DOCKER_PROJECT}"

ECHO_PREFIX='===>'
