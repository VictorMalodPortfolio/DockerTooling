# k8s-tooling

[![CI](https://github.com/VictorMalodPortfolio/DockerTooling/actions/workflows/ci.yml/badge.svg)](https://github.com/VictorMalodPortfolio/DockerTooling/actions/workflows/ci.yml)
[![GHCR](https://img.shields.io/badge/GHCR-k8s--tooling-blue?logo=docker)](https://github.com/VictorMalodPortfolio/DockerTooling/pkgs/container/k8s-tooling)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A portable tooling container for interacting with the homelab from anywhere — just Docker and a few secrets. No local installs required.

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
| git-cliff | Changelog generator from conventional commits | `git-cliff` |

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

## Git hooks

Conventional commits are enforced locally via a `commit-msg` hook available in `.githooks/`. Run this once after cloning:

```bash
git config core.hooksPath .githooks
```

## Prerequisites

The following environment variables must be set on the host before running the scripts:

| Variable | Purpose |
|---|---|
| `KUBECONFIG` | Path to the kubeconfig file |
| `SOPS_AGE_KEY_FILE` | Path to the Age private key |
