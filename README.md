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

## Compatibility

| Bazel version | Bzlmod | WORKSPACE |
| ------------- | ------ | --------- |
| 7.x           | ✅     | ✅        |
| 8.x           | ✅     | ✅        |
| 9.x           | ✅     | ❌        |

Bazel 9 removed the legacy WORKSPACE system. Use Bzlmod on Bazel 9. The
WORKSPACE installation path only works on Bazel 7 and Bazel 8.

## Installation

### Bzlmod

```starlark
bazel_dep(name = "gzgz_rules_sass", version = "1.0.4")

sass = use_extension("@gzgz_rules_sass//sass:extensions.bzl", "sass")

sass.toolchain(sass_version = "1.98.0")
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
    sass_version = "1.98.0",
)
use_repo(sass, "dart_sass_toolchains")

register_toolchains("@dart_sass_toolchains//:all")
```

### WORKSPACE

Only for Bazel 7 and Bazel 8. Bazel 9 removed WORKSPACE support.

From the release you wish to use:
<https://github.com/GZGavinZhao/gzgz_rules_sass/releases>
copy the WORKSPACE snippet into your `WORKSPACE` file.

### Using a commit

To use a commit rather than a release, point at a SHA with `archive_override`
in `MODULE.bazel`.

For example, to use commit `abc123`:

```starlark
archive_override(
    module_name = "gzgz_rules_sass",
    url = "https://github.com/GZGavinZhao/gzgz_rules_sass/archive/abc123.tar.gz",
    strip_prefix = "gzgz_rules_sass-abc123",
    # The easiest way to set this is to comment out this line, then Bazel will
    # print a message with the correct value. Note that GitHub source archives
    # don't have a strong guarantee on the sha256 stability, see
    # <https://github.blog/2023-02-21-update-on-the-future-stability-of-source-code-archives-and-hashes/>
    integrity = "...",
)
```
