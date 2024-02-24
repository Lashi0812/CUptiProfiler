load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

COMMIT = "85a04a85e05ea21d4088f07f8a6df0d213119b53"
SHA256 = "17988459e1ed109d69d938069b2c5ed3c7dee1890cdbb161cca5ee3c28222270"

def repo():
    http_archive(
        name = "rules_cuda",
        sha256 = SHA256,
        strip_prefix = "rules_cuda-{commit}".format(commit=COMMIT),
        urls = ["https://github.com/cloudhan/rules_cuda/archive/{commit}.tar.gz".format(commit=COMMIT)],
    )
