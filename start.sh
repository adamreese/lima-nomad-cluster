#!/usr/bin/env bash
set -euo pipefail

CLUSTER_NAME="${CLUSTER_NAME:-nomad-cluster}"

while read -r node; do
  echo "Starting ${node}"
  limactl start "${node}"
done < <(limactl list --format '{{if eq .Status "Stopped"}}{{.Name}}{{end}}' | grep "${CLUSTER_NAME}")
