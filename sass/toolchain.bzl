"""This module implements the language-specific toolchain rule.
"""

def _sass_toolchain_impl(ctx):
    toolchain_info = platform_common.ToolchainInfo(
        name = ctx.label.name,
        sass = ctx.attr.sass,
    )
    return [toolchain_info]

sass_toolchain = rule(
    implementation = _sass_toolchain_impl,
    attrs = {
        "sass": attr.label(
            doc = "A hermetically downloaded Sass target for the target platform.",
            mandatory = False,
            executable = True,
            allow_single_file = True,
            cfg = "exec",
        ),
    },
    doc = """Defines a sass compiler/runtime toolchain.

For usage see https://docs.bazel.build/versions/main/toolchains.html#defining-toolchains.
""",
)
