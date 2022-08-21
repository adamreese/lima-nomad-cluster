#!/usr/bin/env bash
set -euo pipefail

CLUSTER_NAME="${CLUSTER_NAME:-nomad-cluster}"

while read -r node; do
  echo "Stopping ${node}"
  limactl stop "${node}"
done < <(limactl list --format '{{if eq .Status "Running"}}{{.Name}}{{end}}' | grep "${CLUSTER_NAME}")

while read -r node; do
  echo "Deleting ${node}"
  limactl delete "${node}"
done < <(limactl list --quiet | grep "${CLUSTER_NAME}")
