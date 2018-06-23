#!/usr/bin/env bash
#
# Create/start a new container from the existing image
#
MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
(
    # ensure we are at project root
    cd ${MY_DIR}
    . config.sh

    echo "${ECHO_PREFIX} Bashing into '${CONTAINER_NAME}'"
    docker run -it --rm ${DOCKER_BUILD_IMAGE_NAMETAG} bash
)
