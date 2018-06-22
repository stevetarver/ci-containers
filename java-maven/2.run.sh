#!/usr/bin/env bash
#
# Create/start a new container from the existing image
#
MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# TODO: This run script doesn't really make sense for this CI image - perhaps it should be a test script instead
(
    # ensure we are at project root
    cd ${MY_DIR}
    . config.sh

    echo "${ECHO_PREFIX} Creating and starting '${CONTAINER_NAME}'"
    docker run --name ${CONTAINER_NAME}   \
        --restart=always                  \
        -d ${DOCKER_BUILD_IMAGE_NAMETAG}
)
