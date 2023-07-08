"""Mirror of release info

TODO: generate this file from GitHub API"""

# The integrity hashes can be computed with
# shasum -b -a 384 [downloaded file] | awk '{ print $1 }' | xxd -r -p | base64
SASS_VERSIONS = {
    "1.63.6": {
        "x86_64-apple-darwin": "sha384-ws4+rANvv0YxM1SgIBUXSG9jT8dKw83nls6R5qYkEKzPUB+viBIEozSsyq2e6i+f",
        "aarch64-apple-darwin": "sha384-HcvJbxoJtGSavkGu0e7CyD00cBlmDb0TBWJ4JSaNa70zuU3N7XlMOYm3bbQcAv2U",
        "x86_64-pc-windows": "sha384-35YN6TKpT0L9qyRBmq48NucvyXEtHnkeC+txf2YZmmJTmOzrAKREA74BA0EZvpar",
        "x86_64-unknown-linux": "sha384-R7SC4KuPZFYInYsLGYK0ofe+7e5IhIcIGHWweay3dmYnOlrnu7jsqp+rhuhHOy5G",
    },
}
