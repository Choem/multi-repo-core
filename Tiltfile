# Only allow the following Kubernetes context
allow_k8s_contexts('k3d-mr')

# Define string list to-run
config.define_string_list("to-run", args=True)

# Parse config
cfg = config.parse()
to_run = cfg.get('to-run', [])

if 'file-service' in to_run:
    include('./services/multi-repo-file-service/Tiltfile')
