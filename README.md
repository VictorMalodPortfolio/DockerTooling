# k8s-tooling

[![CI](https://img.shields.io/github/actions/workflow/status/VictorMalodPortfolio/DockerTooling/ci.yml?branch=main&label=CI&style=for-the-badge)](https://github.com/VictorMalodPortfolio/DockerTooling/actions/workflows/ci.yml)
[![GHCR](https://img.shields.io/badge/GHCR-k8s--tooling-2496ED?logo=docker&logoColor=white&style=for-the-badge)](https://github.com/VictorMalodPortfolio/DockerTooling/pkgs/container/k8s-tooling)
[![Base image](https://img.shields.io/badge/base-Ubuntu%2024.04-E95420?logo=ubuntu&logoColor=white&style=for-the-badge)](https://hub.docker.com/_/ubuntu)
[![Trivy](https://img.shields.io/badge/Trivy-scanned-1904DA?logo=aquasecurity&logoColor=white&style=for-the-badge)](https://github.com/VictorMalodPortfolio/DockerTooling/security/code-scanning)
[![Renovate](https://img.shields.io/badge/Renovate-enabled-1A1F6C?logo=renovatebot&logoColor=white&style=for-the-badge)](https://github.com/renovatebot/renovate)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-FE5196?logo=conventionalcommits&logoColor=white&style=for-the-badge)](https://conventionalcommits.org)
[![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)](LICENSE)

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
