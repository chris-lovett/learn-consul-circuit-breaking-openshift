#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
oc apply -f "${ROOT}/kustomize/base/apps/public-api.yaml"
