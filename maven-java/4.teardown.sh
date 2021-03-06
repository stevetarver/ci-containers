#!/usr/bin/env bash
#
# Stop running container and remove container/image
#
MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
(
    # ensure we are at project root
    cd ${MY_DIR}
    . config.sh

    # stop and remove any existing containers
    RUNNING=$(docker inspect --format="{{ .State.Running }}" ${CONTAINER_NAME} 2> /dev/null)

    if [ "$RUNNING" == "true" ]; then
        echo "${ECHO_PREFIX} Stopping '${CONTAINER_NAME}' container"
        docker stop ${CONTAINER_NAME}
    else
        echo "${ECHO_PREFIX} '${CONTAINER_NAME}' container is not running"
    fi


    if [[ "$(docker ps -aq --filter name=${CONTAINER_NAME} 2> /dev/null)" != "" ]]; then
        echo "${ECHO_PREFIX} Removing '${CONTAINER_NAME}' container"
        docker rm -v ${CONTAINER_NAME}
    else
        echo "${ECHO_PREFIX} '${CONTAINER_NAME}' container does not exist"
    fi


    if [[ "$(docker images -q ${DOCKER_BUILD_IMAGE_NAMETAG} 2> /dev/null)" != "" ]]; then
        echo "${ECHO_PREFIX} Removing '${DOCKER_BUILD_IMAGE_NAMETAG}' image"
        docker rmi -f ${DOCKER_BUILD_IMAGE_NAMETAG}
    else
        echo "${ECHO_PREFIX} '${DOCKER_BUILD_IMAGE_NAMETAG}' image does not exist"
    fi
)