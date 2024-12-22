#! /usr/bin/env bash

set -x
set -e
set -o pipefail

BIN_BASE="/usr/local/bin"

ATLAS_VERSION="0.29.0"

curl -sSf https://atlasgo.sh | ATLAS_VERSION="v$ATLAS_VERSION" sh -s -- --yes -o "$BIN_BASE/atlas"
