""""""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

COMMIT = "0e990032f3c5a866e72615cf67e5ce22186dcb97"
SHA256 = "2b3ee8bba2df4542a508b0289727b031427162b4cd381850f89b406445c17578"

def repo():
    http_archive(
        name = "hedron_compile_commands",
        urls = ["https://github.com/hedronvision/bazel-compile-commands-extractor/archive/{commit}.tar.gz".format(commit = COMMIT)],
        strip_prefix = "bazel-compile-commands-extractor-{commit}".format(commit = COMMIT),
        sha256 = SHA256,
    )
