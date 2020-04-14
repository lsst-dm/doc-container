#!/bin/bash

# Upload documentation to qserv.lsst.io

set -euxo pipefail

DIR=$(cd "$(dirname "$0")"; pwd -P)

"$DIR/generate.sh"
"$DIR/upload.sh"

