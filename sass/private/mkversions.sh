#!/usr/bin/env bash

set -eo pipefail

gh api /repos/sass/dart-sass/releases -f "per_page=50" --method GET -q 'map( { (.tag_name): (.assets | map({(.name): .browser_download_url}) | add) } ) | add'
