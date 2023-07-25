# Bazel rules for sass

This is an alternative Bazel ruleset to compile [Sass](https://sass-lang.com)
stylesheets. It has the exact same API as the official
[`rules_sass`](https://github.com/bazelbuild/rules_sass), but the difference is
that `gzgz_rules_sass` wraps the [Dart Sass](https://github.com/sass/dart-sass)
executable directly, while `rules_sass` calls Dart Sass through NodeJS and
therefore is slower and pulls in more unnecessary dependencies, especially if
your project runs on a different version of NodeJS or if you project doesn't
need NodeJS at all.

This ruleset adopts the Toolchain and Platforms API and special care has been
taken to make it RBE-compatible, but this is not thoroughly tested.

## Installation

### bzlmod

```starlark
bazel_dep(name = "gzgz_rules_sass", version = "1.0.0")

sass = use_extension("@gzgz_rules_sass//sass:extensions.bzl", "sass")

sass.toolchain(sass_version = "1.63.6")
use_repo(sass, "sass_toolchains")

register_toolchains("@sass_toolchains//:all")
```

By default, the Sass toolchain name is `@sass_toolchains`, so the
`sass_version` specified becomes the version that is enforced on all
dependencies that also used the default name.

However, if you'd like to use a specific version **only** in your project,
then you can explicitly set a name when registering Sass toolchain, which 
will differentiate it from the default Sass toolchain:
```starlark
sass = use_extension("@gzgz_rules_sass//sass:extensions.bzl", "sass")
sass.toolchain(
    name = "dart_sass",
    sass_version = "1.63.6",
)
use_repo(sass, "dart_sass_toolchains")

register_toolchains("@dart_sass_toolchains//:all")
```

### WORKSPACE

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
