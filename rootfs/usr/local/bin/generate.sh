#!/bin/bash

# Generate documentation

set -euxo pipefail

cp /ltd/Makefile /project/doc
cd /project/doc
make linkcheck
make html
