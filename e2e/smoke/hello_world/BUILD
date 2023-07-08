package(default_visibility = ["//visibility:public"])

load("@gzgz_rules_sass//sass:defs.bzl", "sass_binary")

# Import our shared colors and fonts so we can generate a CSS file.
sass_binary(
    name = "hello_world",
    src = "main.scss",
    deps = [
        "//shared",
    ],
)

sass_binary(
    name = "hello_world_sourcemap_embed_sources",
    src = "main.scss",
    output_name = "main-sourcemap-embed-sources.css",
    sourcemap_embed_sources = True,
    deps = [
        "//shared",
    ],
)

sass_binary(
    name = "hello_world_no_sourcemap",
    src = "main.scss",
    output_name = "main-no-sourcemap.css",
    sourcemap = False,
    deps = [
        "//shared:colors",
        "//shared:fonts",
    ],
)
