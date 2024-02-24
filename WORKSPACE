load("//third_party/rules_cuda:workspace.bzl", rules_cuda_workspace = "repo")

rules_cuda_workspace()

load("@rules_cuda//cuda:repositories.bzl", "register_detected_cuda_toolchains", "rules_cuda_dependencies")

rules_cuda_dependencies()

register_detected_cuda_toolchains()