#!/bin/bash

# Upload documentation to qserv.lsst.io

set -euxo pipefail

GIT_REF={GIT_REF:-}

if [ "$GIT_REF"=="travis" ]; then
    GIT_REF_OPT="--travis"
else
    GIT_REF_OPT="--git-ref $GIT_REF"
fi

ORIGIN=$(git --git-dir=/project/.git remote get-url origin)
PRODUCT=$(basename -s .git $ORIGIN)
ltd --log-level=info upload --product "$PRODUCT" $GIT_REF_OPT --dir /project/doc/_build/html
