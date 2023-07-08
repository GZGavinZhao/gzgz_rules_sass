load("@gzgz_rules_sass//sass:defs.bzl", "sass_binary")

package(default_visibility = ["//visibility:public"])

# Import our shared colors and fonts so we can generate a CSS file.
sass_binary(
    name = "nested",
    src = "dir/main.scss",
    deps = [
        "//shared:colors",
        "//shared:fonts",
    ],
)
