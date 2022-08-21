#!/usr/bin/env bash
set -euo pipefail

CLIENT_NODES=${CLIENT_NODES:-2}
CLUSTER_NAME="${CLUSTER_NAME:-nomad-cluster}"

limactl start --tty=false --name "${CLUSTER_NAME}-server" ./server.yaml

server_ip="$(limactl shell "${CLUSTER_NAME}-server" ip addr show lima0 | awk '/inet / {print $2}' | cut -d'/' -f1)"

sed 's/NOMAD_SERVER_IP/'"${server_ip}"'/' ./client.tmpl.yaml >client.yaml

for ((i = 1; i <= CLIENT_NODES; i++)); do
  printf 'Starting nomad-client-%s\n' "$i"
  limactl start --tty=false --name "${CLUSTER_NAME}-client-${i}" ./client.yaml
done
