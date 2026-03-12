#!/usr/bin/env bash
set -euo pipefail

command -v oc >/dev/null 2>&1 || { echo "oc is required"; exit 1; }
command -v kubectl >/dev/null 2>&1 || { echo "kubectl is required"; exit 1; }
command -v kustomize >/dev/null 2>&1 || { echo "kustomize is required"; exit 1; }

echo "Checking cluster access..."
oc whoami >/dev/null

echo "Checking Consul CRDs (ServiceIntentions, ServiceDefaults)..."
kubectl get crd serviceintentions.consul.hashicorp.com >/dev/null
kubectl get crd servicedefaults.consul.hashicorp.com >/dev/null

echo "OK"
