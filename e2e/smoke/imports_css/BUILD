package(default_visibility = ["//visibility:public"])

load("@gzgz_rules_sass//sass:defs.bzl", "sass_binary", "sass_library")

# Import our shared colors and fonts so we can generate a CSS file.
sass_binary(
    name = "imports_css",
    src = "main.scss",
    deps = [
        ":other",
    ],
)

sass_library(
    name = "other",
    srcs = ["_other.css"],
)
