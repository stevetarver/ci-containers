#!/usr/bin/env bash

# -------------------------------------------------------------------
# derived image version definition ----------------------------------
export DOCKER_PROJECT="maven-java-ci"

# our base image version tag
SOURCE_VERSION='3.5.4-jdk-8-alpine'

# the number of published versions of our derived image
# - increment on each change
# - reset to 0 on SOURCE_VERSION change
OUR_REVISION='0'

# -------------------------------------------------------------------
# include common definitions from repo root config.sh ---------------
source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../config.sh"

# -------------------------------------------------------------------
# augment or override common definitions ----------------------------


