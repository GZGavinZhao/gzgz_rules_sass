#!/usr/bin/env bash

set -eo pipefail

echo "sha384-$(curl -sL $1 | shasum -b -a 384 | awk '{ print $1 }' | xxd -r -p | base64)"
