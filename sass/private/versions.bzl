"""Mirror of release info

TODO: generate this file from GitHub API"""

# The integrity hashes can be computed with
# shasum -b -a 384 [downloaded file] | awk '{ print $1 }' | xxd -r -p | base64
SASS_VERSIONS = {
    "1.63.6": {
        "x86_64-apple-darwin": "sha384-pd35W/Fj8QuixigyPIBnJ9vGSS6UaKTeU1TX5qBaibOOvOZw2ImUunoRHXXfxjk1",
        "aarch64-apple-darwin": "sha384-B+7Jo4lFr5CyN+pSdoYZ9f6l6uxahL8HDmxsbSGxpnGuv994O4Mtpi0994NArB7p",
        "x86_64-unknown-linux": "sha384-R7SC4KuPZFYInYsLGYK0ofe+7e5IhIcIGHWweay3dmYnOlrnu7jsqp+rhuhHOy5G",
        "i386-unknown-linux": "sha384-cERgRJuRDeFAjVAy0zNb2K/2I2h4Bx94jICy75Lq+aTD3GgLQuoktXmRPU9EbWV5",
        "x86_64-pc-windows": "sha384-WNj3fpzeFGuzIC0jjr88DcQ81aDP8Y0rFF/G9bs5QTpQW+zbfWFX6RTryPwbHVPh",
        "i386-pc-windows": "sha384-5aWBA4LnzNMJBiVkT0fy10lR7cpsDMB4Ua3W1FnDTbqYdyuJqjkJEbdg1Od8nt7S",
    },
}
