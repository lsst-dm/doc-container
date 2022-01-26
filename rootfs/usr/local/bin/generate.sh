#!/bin/bash

# Generate documentation

set -euxo pipefail

package-docs -d /project/doc/ build
