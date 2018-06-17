FROM gradle:4.4.1-jdk8-alpine

# Build system will provide arguments to identify source location/version
ARG GIT_REPO_NAME='NOT SPECIFIED'
ARG GIT_BRANCH_NAME='NOT SPECIFIED'
ARG GIT_COMMIT_HASH='NOT SPECIFIED'
ARG BUILD_TIMESTAMP='NOT SPECIFIED'

# Label image with source location/version
LABEL com.makara.build.repo=${GIT_REPO_NAME} \
      com.makara.build.branch=${GIT_BRANCH_NAME} \
      com.makara.build.timestamp=${BUILD_TIMESTAMP} \
      com.makara.build.commit-hash=${GIT_COMMIT_HASH}

# Gradle config
COPY .gitconfig /root/
COPY gradle.properties /home/gradle/.gradle/

# Add features to the base image
# - newman: command line postman runner for deployed integration testing
# - fontconfig, ttf-dejavu required for clover or you get NPE during report generation
#   These packages add 19 MB to image
USER root
RUN apk --no-cache add --update git curl tar bash docker nodejs nodejs-npm py-pip fontconfig ttf-dejavu && \
    pip install docker-compose && \
    npm install -g newman@3.9.3

