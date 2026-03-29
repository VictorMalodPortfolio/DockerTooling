# k8s-tooling

Containerised CLI environment for interacting with Kubernetes clusters.

## Included tools

| Tool | Description | Command |
|---|---|---|
| kubectl | Kubernetes CLI | `kubectl`, `k` |
| helm | Kubernetes package manager | `helm` |
| tofu | Infrastructure as code (OpenTofu) | `tofu`, `tf` |
| k9s | Terminal UI for Kubernetes | `k9s` |
| stern | Multi-pod log tailing | `stern` |
| sops | Encrypted secrets management | `sops`, `sops exec-env` |
| age | Encryption tool (used by sops) | `age` |

## Usage

**1. Build the image (first time or after a Dockerfile change):**
```bash
docker compose build
```

**2. Start an interactive shell** from the directory to work in:

**Bash / zsh:**
```bash
./scripts/bash/tooling.sh
```

**PowerShell:**
```powershell
./scripts/powershell/tooling.ps1
```

The current directory is mounted at `/home/tooling/workspace` inside the container.

## Prerequisites

The following environment variables must be set on the host before running the scripts:

| Variable | Purpose |
|---|---|
| `KUBECONFIG` | Path to the kubeconfig file |
| `SOPS_AGE_KEY_FILE` | Path to the Age private key |
