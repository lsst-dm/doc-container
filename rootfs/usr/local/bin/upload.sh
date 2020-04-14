#!/bin/bash

# Upload documentation to qserv.lsst.io

set -euxo pipefail

GIT_REF={GIT_REF:-travis}

ORIGIN=$(git --git-dir=/project/.git remote get-url origin)
PRODUCT=$(basename -s .git $ORIGIN)
ltd --log-level=info upload --product "$PRODUCT" --git-ref $GIT_REF --dir /project/doc/_build/html
