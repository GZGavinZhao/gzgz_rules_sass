#!/usr/bin/env python3

import json
import sys
from hashlib import sha384
from base64 import b64encode
from urllib.request import urlopen

# gives us existing SASS_VERSIONS so we don't need to refetch
import versions

json_path = sys.argv[1]
output_path = sys.argv[2]
data = json.load(open(json_path, "rb"))


def calculate_sha384_base64(url):
    # Calculate the SHA-384 hash
    sha384_hash = sha384(urlopen(url).read()).digest()

    # Encode the hash in base64 format
    base64_encoded_hash = b64encode(sha384_hash)

    # Return the base64 encoded hash as a string
    return "sha384-" + base64_encoded_hash.decode("utf-8")


def name_to_platform(name):
    if 'macos-x64' in name:
        return "x86_64-apple-darwin"
    elif 'macos-arm64' in name:
        return "aarch64-apple-darwin"
    elif "linux-x64" in name:
        return "x86_64-unknown-linux"
    elif "linux-arm64" in name:
        return "aarch64-unknown-linux"
    elif "linux-arm" in name:
        return "aarch32-unknown-linux"
    elif "linux-ia32" in name:
        return "i386-unknown-linux"
    elif "windows-x64" in name:
        return "x86_64-pc-windows"
    elif "windows-ia32" in name:
        return "i386-pc-windows"
    else:
        return None
        # raise ValueError(f"I don't know what plaform {name} belongs to!")


res = {}

# processed = 0
# total = len(data)
# print(list(filter(lambda tup: tup[0] not in versions.SASS_VERSIONS, data.items())))
for version, assets in filter(lambda tup: tup[0] in versions.SASS_VERSIONS, data.items()):
    res[version] = {}
    # res[version] = {
    #     name_to_platform(k): calculate_sha384_base64(v)
    #     for k, v in assets.items() if name_to_platform(k) != None
    # }
    for name, url in assets.items():
        platform = name_to_platform(name)
        if not platform:
            continue

        if platform in res[version] or "musl" in name:
            print(f"Skipping {name} in v{version} because musl is borky")
            continue

        res[version][platform] = {
            "url": url,
            "checksum": calculate_sha384_base64(url),
        }

    # processed += 1
    print(f"Processed v{version}")
    pass

with open(output_path, "w") as output:
    output.write('''# This file is auto-generated by sass/private/gen_versions.py

# The integrity hashes can be computed with
# shasum -b -a 384 [downloaded file] | awk '{ print $1 }' | xxd -r -p | base64

SASS_VERSIONS = ''')

with open(output_path, "a") as output:
    # json.dump(res | versions.SASS_VERSIONS, output, indent=4)
    json.dump(res, output, indent=4)
