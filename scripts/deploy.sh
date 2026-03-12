#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "Deploying circuit breaking lab into namespace circuitbreak..."
kustomize build "${ROOT}/kustomize/overlays/openshift" | oc apply -f -

echo
echo "Done."
echo "Tip: oc -n circuitbreak port-forward svc/nginx 8080:80"
