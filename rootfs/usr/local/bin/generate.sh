#!/bin/bash

# Generate documentation

set -euxo pipefail

make linkcheck
make html
