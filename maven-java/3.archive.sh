#!/usr/bin/env bash
#
# Push docker image to portr repository
#
MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
(
    # ensure we are at project root
    cd ${MY_DIR}
    . config.sh

    echo "==> Attempting docker registry login"
    docker login
    if [[ $? -ne 0 ]]; then
        exit 1
    fi

    docker push ${DOCKER_BUILD_IMAGE_NAMETAG}
    docker logout
)
