#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail

# Set by GH actions, see
# https://docs.github.com/en/actions/learn-github-actions/environment-variables#default-environment-variables
TAG=${GITHUB_REF_NAME}
# The prefix is chosen to match what GitHub generates for source archives
PREFIX="gzgz_rules_sass-${TAG:1}"
ARCHIVE="gzgz_rules_sass-$TAG.tar.gz"
git archive --format=tar --prefix=${PREFIX}/ ${TAG} | gzip > $ARCHIVE
SHA=$(shasum -a 256 $ARCHIVE | awk '{print $1}')

cat << EOF
## Using Bzlmod with Bazel 6

1. Enable with \`common --enable_bzlmod\` in \`.bazelrc\`.
2. Add to your \`MODULE.bazel\` file:

\`\`\`starlark
bazel_dep(name = "gzgz_rules_sass", version = "${TAG:1}")

sass = use_extension("@gzgz_rules_sass//sass:extensions.bzl", "sass")

sass.toolchain(sass_version = "1.63.6") # Or any other version you like
use_repo(sass, "sass_toolchains")

register_toolchains("@sass_toolchains//:all")
\`\`\`

## Using WORKSPACE

Paste this snippet into your `WORKSPACE.bazel` file:

\`\`\`starlark
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
http_archive(
    name = "gzgz_rules_sass",
    sha256 = "${SHA}",
    strip_prefix = "${PREFIX}",
    url = "https://github.com/GZGavinZhao/gzgz_rules_sass/releases/download/${TAG}/${ARCHIVE}",
)
EOF

awk 'f;/--SNIP--/{f=1}' e2e/smoke/WORKSPACE.bazel
echo "\`\`\`" 
