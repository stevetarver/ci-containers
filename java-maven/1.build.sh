#!/usr/bin/env bash
#
# Build docker image
#
MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

(
    # ensure we are at project root
    cd ${MY_DIR}
    . config.sh

    echo "${ECHO_PREFIX} Building ${DOCKER_BUILD_IMAGE_NAMETAG}"
    docker build \
        --build-arg GIT_BRANCH_NAME=${GIT_BRANCH_NAME} \
        --build-arg BUILD_TIMESTAMP=${BUILD_TIMESTAMP} \
        --build-arg GIT_COMMIT_HASH=${GIT_COMMIT_HASH} \
        --build-arg GIT_REPO_NAME=${GIT_REPO_NAME}     \
        -t ${DOCKER_BUILD_IMAGE_NAMETAG}               \
        .

)