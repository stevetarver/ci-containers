#!/usr/bin/env bash

# -------------------------------------------------------------------
# derived image version definition ----------------------------------
export DOCKER_PROJECT="python-ci"

# our base image version tag
export SOURCE_VERSION='3.6.5-alpine3.6'

# the number of published versions of our derived image
# - increment on each change
# - reset to 0 on SOURCE_VERSION change
export OUR_REVISION='0'

# -------------------------------------------------------------------
# include common definitions from repo root config.sh ---------------
source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../config.sh"

# -------------------------------------------------------------------
# augment or override common definitions ----------------------------

