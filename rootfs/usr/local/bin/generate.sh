#!/bin/bash

# Generate documentation

set -euxo pipefail

cp /ltd/Makefile /project/ltd
cd /project/doc
make linkcheck
make html
