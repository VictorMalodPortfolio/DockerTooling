#!/usr/bin/env bash
# Run this script to start an interactive shell in the tooling container.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMPOSE_FILE="$SCRIPT_DIR/../../docker-compose.yml"

docker compose -f "$COMPOSE_FILE" run --rm \
  --user root \
  -e "HOME=/home/tooling" \
  -v "$KUBECONFIG:/home/tooling/.kube/config:ro" \
  -v "$SOPS_AGE_KEY_FILE:/home/tooling/.config/sops/age/key.txt:ro" \
  -e SOPS_AGE_KEY_FILE=/home/tooling/.config/sops/age/key.txt \
  -e HELM_CONFIG_HOME=/tmp/helm-config \
  -e HELM_CACHE_HOME=/tmp/helm-cache \
  -e HELM_DATA_HOME=/tmp/helm-data \
  -v ~/.ssh:/home/tooling/.ssh:ro \
  -v "$(pwd):/home/tooling/workspace" \
  tooling
