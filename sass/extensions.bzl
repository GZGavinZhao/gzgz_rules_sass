"""Extensions for bzlmod.

Installs a sass toolchain.
Every module can define a toolchain version under the default name, "sass".
The latest of those versions will be selected (the rest discarded),
and will always be registered by gzgz_rules_sass.

Additionally, the root module can define arbitrarily many more toolchain versions under different
names (the latest version will be picked for each name) and can register them as it sees fit,
effectively overriding the default named toolchain due to toolchain resolution precedence.
"""

load(":repositories.bzl", "sass_register_toolchains")

_DEFAULT_NAME = "sass"

sass_toolchain = tag_class(attrs = {
    "name": attr.string(doc = """\
Base name for generated repositories, allowing more than one sass toolchain to be registered.
Overriding the default is only permitted in the root module.
""", default = _DEFAULT_NAME),
    "sass_version": attr.string(doc = "Explicit version of sass.", mandatory = True),
})

def _version_key(version):
    """Return a sort key for a Dart Sass version string.

    Compares numeric components first, then sorts prereleases before the
    matching release. This avoids lexicographic ordering bugs such as
    ``"1.9.0"`` sorting above ``"1.86.0"``.
    """
    parts = version.split("-", 1)
    numbers = []
    for component in parts[0].split("."):
        numbers.append(int(component))
    for _ in range(3 - len(numbers)):
        numbers.append(0)
    is_release = len(parts) == 1
    return (numbers, is_release)

def _toolchain_extension(module_ctx):
    registrations = {}
    for mod in module_ctx.modules:
        for toolchain in mod.tags.toolchain:
            if toolchain.name != _DEFAULT_NAME and not mod.is_root:
                fail("""\
                Only the root module may override the default name for the sass toolchain.
                This prevents conflicting registrations in the global namespace of external repos.
                """)
            if toolchain.name not in registrations.keys():
                registrations[toolchain.name] = []
            registrations[toolchain.name].append(toolchain.sass_version)
    for name, versions in registrations.items():
        if len(versions) > 1:
            selected = sorted(versions, key = _version_key, reverse = True)[0]

            # buildifier: disable=print
            print("NOTE: sass toolchain {} has multiple versions {}, selected {}".format(name, versions, selected))
        else:
            selected = versions[0]

        sass_register_toolchains(
            name = name,
            sass_version = selected,
            register = False,
        )

    return module_ctx.extension_metadata(
        reproducible = True,
    )

sass = module_extension(
    implementation = _toolchain_extension,
    tag_classes = {"toolchain": sass_toolchain},
)
