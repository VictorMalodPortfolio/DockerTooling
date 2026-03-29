# Run this script to start an interactive shell in the tooling container.

$mountPath = (Get-Location).Path.Replace('\', '/')
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$composeFile = Resolve-Path "$scriptDir\..\..\docker-compose.yml"

docker compose -f "$composeFile" run --rm `
  -v "${env:KUBECONFIG}:/home/tooling/.kube/config:ro" `
  -v "${env:SOPS_AGE_KEY_FILE}:/home/tooling/.config/sops/age/key.txt:ro" `
  -e "SOPS_AGE_KEY_FILE=/home/tooling/.config/sops/age/key.txt" `
  -v "${env:USERPROFILE}/.ssh:/home/tooling/.ssh:ro" `
  -v "${mountPath}:/home/tooling/workspace" `
  tooling
