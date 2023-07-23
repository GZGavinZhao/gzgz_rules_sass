# Bazel rules for sass

This is an alternative Bazel ruleset to compile [Sass](https://sass-lang.org)
stylesheets. It has the exact same API as the official
[`rules_sass`](https://github.com/bazelbuild/rules_sass), but the difference is
that `gzgz_rules_sass` wraps the [Dart Sass](https://github.com/sass/dart-sass)
executable directly, while `rules_sass` calls Dart Sass through NodeJS and
therefore is slower and pulls in more unnecessary dependencies, especially if
your project runs on a different version of NodeJS.

This ruleset adopts the Toolchain and Platforms API and special care has been
taken to make it RBE-compatible, but this is not thoroughly tested.

## Installation

From the release you wish to use:
<https://github.com/GZGavinZhao/gzgz_rules_sass/releases>
copy the WORKSPACE snippet into your `WORKSPACE` file.

To use a commit rather than a release, you can point at any SHA of the repo.

For example to use commit `abc123`:

1. Replace `url = "https://github.com/GZGavinZhao/gzgz_rules_sass/releases/download/v0.1.0/gzgz_rules_sass-v0.1.0.tar.gz"` with a GitHub-provided source archive like `url = "https://github.com/GZGavinZhao/gzgz_rules_sass/archive/abc123.tar.gz"`
1. Replace `strip_prefix = "gzgz_rules_sass-0.1.0"` with `strip_prefix = "gzgz_rules_sass-abc123"`
1. Update the `sha256`. The easiest way to do this is to comment out the line, then Bazel will
   print a message with the correct value. Note that GitHub source archives don't have a strong
   guarantee on the sha256 stability, see
   <https://github.blog/2023-02-21-update-on-the-future-stability-of-source-code-archives-and-hashes/>
