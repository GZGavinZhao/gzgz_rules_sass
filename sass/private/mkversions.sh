#!/usr/bin/env bash

set -eo pipefail

gh api /repos/sass/dart-sass/releases | jq '[.[] | {name: .tag_name, assets: [.assets[] | {name: .name, url: .url}]}]'
