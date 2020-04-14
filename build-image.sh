#!/bin/bash

# Create docker image containing lsst-the-doc tools

# @author  Fabrice Jammes

set -euxo pipefail

DIR=$(cd "$(dirname "$0")"; pwd -P)

IMAGE="qserv/doc:latest"

echo $DIR

# CACHE_OPT="--no-cache"

docker image build --tag "$IMAGE" "$DIR"
docker push "$IMAGE"
