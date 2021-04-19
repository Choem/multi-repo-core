This is a test for setting up development tooling. 

1. What do I have to install for local development?
   - [Docker](https://www.docker.com/)
   - [Helm](https://helm.sh/docs/intro/quickstart/)
   - [Kubectl](https://kubernetes.io/docs/tasks/tools/)
   - [Istioctl](https://istio.io/latest/docs/setup/getting-started/#download)
   - [K3d](https://k3d.io/#installation)
   - [Tilt](https://docs.tilt.dev/install.html)

2. Copy the .env.template file to an .env file and edit it to your liking.
```
cp .env.template .env
```

3. Create a deamon.json file in /etc/docker/ that enables insecure registries at the REGISTRY_PORT defined in your .env.
```
./scripts/add_registry_to_docker.sh
```

4. The cluster can be launched with the following script.
```
./scripts/start_cluster.sh
```

- Creates a new Docker image registry.
- Creates a local Kubernetes cluster.
- Add the secrets for your microservices.

To reach your cluster:
 - port 9080 (HTTP)
 - port 9443 (HTTPS)

All the scripts that can be used are listed below and located in the /scripts/ folder.

|  Script                               |  Description  |   
|---------------------------------------|---------------|
|  ./scripts/add_registry_to_docker.sh  |  Adds a JSON file which contains the insecure port needed for Docker to push local images to.  |
|  ./scripts/remove_cluster.sh          |  Removes the cluster. |
|  ./scripts/remove_registry.sh         |  Removes the registry. |
|  ./scripts/start_cluster.sh           |  Starts the cluster.  |
|  ./scripts/stop_cluster.sh            |  Stops the cluster.  |
|  ./scripts/lib/k3d_cluster_status.sh  |  Helper script that gets the current status of the k3d cluster.  |
|  ./scripts/lib/load_env.sh            |  Loads the .env file as variables in your terminal session.  |