# Changelog

## Bug Fixes

- Lowercase GHCR image tag and add changelog dependency on build ([0a4b3f3](https://github.com/VictorMalodPortfolio/DockerTooling/commit/0a4b3f36c5459093de271f37ae65723d506e2d46))
- Fix git-cliff tar extraction path ([24fc1ab](https://github.com/VictorMalodPortfolio/DockerTooling/commit/24fc1abacbb06673b34c23534aabf56ed04983f7))
- Download git-cliff before extracting ([0c5867d](https://github.com/VictorMalodPortfolio/DockerTooling/commit/0c5867d40831b1aebbb6d5bb6fa0cae2a5ad922d))
- Install git-cliff via deb package ([60d8ad3](https://github.com/VictorMalodPortfolio/DockerTooling/commit/60d8ad3c25d56689de4f6db93c412003e60ed329))
- Authenticate to GHCR for private image pull ([4bcb3ed](https://github.com/VictorMalodPortfolio/DockerTooling/commit/4bcb3edb452c88ab6b74b8a400b75f9ca1497829))
- Run container as root for GitHub Actions compatibility ([c248991](https://github.com/VictorMalodPortfolio/DockerTooling/commit/c248991f742fdb2bb12d1779bce6426b8c591e2f))
- Add cliff.toml and fix git safe directory ([f895c1b](https://github.com/VictorMalodPortfolio/DockerTooling/commit/f895c1b6089fa6b3511e87069b90a56c9b42ca30))
- Bump actions/checkout to v4.2.2 for Node.js 24 support ([3c9fe19](https://github.com/VictorMalodPortfolio/DockerTooling/commit/3c9fe19463b0e455b16684303175f988f93520cd))
- Bump actions/checkout to v6.0.2 for Node.js 24 ([7a983dc](https://github.com/VictorMalodPortfolio/DockerTooling/commit/7a983dc2017acab4efe42c3c5d4f5bbf935c6565))
- Exclude merge commits from conventional commit validation ([5c6a0b9](https://github.com/VictorMalodPortfolio/DockerTooling/commit/5c6a0b9f7cd39ce4e3e56100ed2b13860f2e4340))

## Build

- Add renovate.json and pin version comments in Dockerfile ([db96943](https://github.com/VictorMalodPortfolio/DockerTooling/commit/db96943bca769c9f87f988786b0d3e9d949fccaf))

## Chores

- Update docker/login-action action to v4 ([915628a](https://github.com/VictorMalodPortfolio/DockerTooling/commit/915628acc867f56681a70e3766440088d330218e))
- Update docker/build-push-action action to v7 ([8b92eac](https://github.com/VictorMalodPortfolio/DockerTooling/commit/8b92eac9118b52fa3d0346d48991656a67cd5333))
- Update ubuntu docker tag to v24 ([d438446](https://github.com/VictorMalodPortfolio/DockerTooling/commit/d4384465aa1de01b2b4c5156ba0c3e06f1309e5c))
- Update dependency filosottile/age to v1.3.1 ([94fb058](https://github.com/VictorMalodPortfolio/DockerTooling/commit/94fb05844263ddf186aaa7611e5fcccd2fb140b3))
- Update dependency getsops/sops to v3.12.2 ([86d1ec9](https://github.com/VictorMalodPortfolio/DockerTooling/commit/86d1ec94fb9b1385ef3676bba557f144788a2850))
- Update dependency orhun/git-cliff to v2.12.0 ([029147d](https://github.com/VictorMalodPortfolio/DockerTooling/commit/029147d9ec3caf0417ec1208874b3013c6db116a))
- Update dependency stern/stern to v1.33.1 ([a1a2723](https://github.com/VictorMalodPortfolio/DockerTooling/commit/a1a2723673a158d029b8108a85850173657bfee8))
- Update dependency opentofu/opentofu to v1.11.5 ([970f6e5](https://github.com/VictorMalodPortfolio/DockerTooling/commit/970f6e5ceebf33fb49b07f82618d731e80f729a2))
- Update dependency derailed/k9s to v0.50.18 ([24b55a2](https://github.com/VictorMalodPortfolio/DockerTooling/commit/24b55a246d549a5b9fdabd8628fadb7a2b446502))
- Update dependency helm/helm to v3.20.1 ([6c6df6e](https://github.com/VictorMalodPortfolio/DockerTooling/commit/6c6df6e465f5a0be283389d40486d4846f2735d9))
- Update dependency kubernetes/kubernetes to v1.35.3 ([d2f013f](https://github.com/VictorMalodPortfolio/DockerTooling/commit/d2f013f75b9a97d64a5f3d152f8536728434c334))

## Documentation

- Add CHANGELOG and conventional commits hook ([3ec7a71](https://github.com/VictorMalodPortfolio/DockerTooling/commit/3ec7a71905a2bea02715edcd0ac8d6181f5cf46a))
- Update CHANGELOG ([f1a6488](https://github.com/VictorMalodPortfolio/DockerTooling/commit/f1a6488c77fa6cb2041a199ca9635abaabc8e696))
- Update CHANGELOG ([ab5f8f7](https://github.com/VictorMalodPortfolio/DockerTooling/commit/ab5f8f7b922af3e9edee90e667c21bd57279c41a))
- Update CHANGELOG ([43424f3](https://github.com/VictorMalodPortfolio/DockerTooling/commit/43424f39a95ee753a549aa05335b98a9edc97f1b))
- Update CHANGELOG ([29e17ae](https://github.com/VictorMalodPortfolio/DockerTooling/commit/29e17aec54946a63cc21754a2ab9779cdb603a5c))
- Update CHANGELOG ([9bf1914](https://github.com/VictorMalodPortfolio/DockerTooling/commit/9bf19141410fa72333617bc865651203fc062ac0))
- Update CHANGELOG ([38e62da](https://github.com/VictorMalodPortfolio/DockerTooling/commit/38e62dafd9f396e00537ebd581881e305e50a35b))
- Update CHANGELOG ([1b50103](https://github.com/VictorMalodPortfolio/DockerTooling/commit/1b50103299ece8a46db2948f661a72fca3e78bb6))

## Features

- Add GitHub Actions workflows and git-cliff ([e88b4a4](https://github.com/VictorMalodPortfolio/DockerTooling/commit/e88b4a41e0e38fc6335682afd763509da9a75abd))

