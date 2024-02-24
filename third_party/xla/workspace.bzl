"""
XLA Workspace
"""

# load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//third_party:repo.bzl", "tf_http_archive", "tf_mirror_urls")

XLA_COMMIT = "492c50766d96ecce2e57447d12c34feaa4acacaf"
XLA_SHA256 = "1afe2995fa06347fdf33766e8682b7da1275ec0e4120cbe42e32190a4e06c7d1"

def repo():
    tf_http_archive(
        name = "xla",
        sha256 = XLA_SHA256,
        strip_prefix = "xla-{commit}".format(commit = XLA_COMMIT),
        urls = tf_mirror_urls("https://github.com/openxla/xla/archive/{commit}.tar.gz".format(commit = XLA_COMMIT)),
    )

# # To update XLA to a new revision,
# # a) update XLA_COMMIT to the new git commit hash
# # b) get the sha256 hash of the commit by running:
# #    curl -L https://github.com/openxla/xla/archive/<git hash>.tar.gz | sha256sum
# #    and update XLA_SHA256 with the result.

# XLA_COMMIT = "492c50766d96ecce2e57447d12c34feaa4acacaf"
# XLA_SHA256 = "1afe2995fa06347fdf33766e8682b7da1275ec0e4120cbe42e32190a4e06c7d1"


