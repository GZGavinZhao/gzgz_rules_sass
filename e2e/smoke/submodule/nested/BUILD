load("@gzgz_rules_sass//sass:defs.bzl", "sass_binary")

package(default_visibility = ["//visibility:public"])

sass_binary(
    name = "nested",
    src = "dir/main.scss",
    deps = [
        "//shared:colors",
    ],
)
