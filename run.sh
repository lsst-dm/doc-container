#!/bin/bash

# Create docker image containing lsst-the-doc tools

# @author  Fabrice Jammes

set -euxo pipefail


DIR=$(cd "$(dirname "$0")"; pwd -P)
if [ -r "$DIR/env.sh" ]; then
  . $DIR/env.sh
fi


TRAVIS=${TRAVIS:-false}
TRAVIS_BRANCH=${TRAVIS_BRANCH:-""}

usage() {
    cat << EOD
Usage: $(basename "$0") [options] path
Available options:
  -p            FTP Password for <project>.lsst.io   
  -h            This message

Generate and upload documentation for a project whose root directory is <path>.
<path>/doc must exists.

EOD
}

# Get the options
while getopts hp:u: c ; do
    case $c in
        h) usage ; exit 0 ;;
        u) LTD_USERNAME="$OPTARG" ;;
        p) LTD_PASSWORD="$OPTARG" ;;
        \?) usage ; exit 2 ;;
    esac
done
shift "$((OPTIND-1))"

if [ $# -ne 1 ] ; then
    usage
    exit 2
fi

PROJECT_DIR=$1
shift

if [ "$TRAVIS" = "true" ]; then
  GIT_REF="$TRAVIS_BRANCH"
else
  GIT_REF=$(cd "$PROJECT_DIR" && git rev-parse --abbrev-ref HEAD)
fi

# strip trailing slash
PROJECT_DIR=$(echo $PROJECT_DIR | sed 's%\(.*[^/]\)/*%\1%')

IMAGE="qserv/doc:latest"

docker run -i -v $PROJECT_DIR:/project \
    -e LTD_USERNAME=qserv \
    -e LTD_PASSWORD="$LTD_PASSWORD" \
    -e LTD_USERNAME="$LTD_USERNAME" \
    -e GIT_REF="$GIT_REF" \
    --user=$(id -u):$(id -g $USER) -- "$IMAGE" \
    bash -lc run.sh
    # bash

