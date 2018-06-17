FROM python:3.6.2-alpine3.6

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

# Python config
COPY requirements-dv.txt /app/
COPY requirements.txt /app/
COPY constraints.txt /app/

# Add features to the base image
# - requirements-dv.txt: python dev dependencies for testing
# - newman: command line postman runner for deployed integration testing
RUN apk add --no-cache bash docker nodejs nodejs-npm && \
    pip install -r /app/requirements-dv.txt && \
    npm install -g newman@3.9.3

