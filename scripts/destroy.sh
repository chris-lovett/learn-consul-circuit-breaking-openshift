#!/usr/bin/env bash
set -euo pipefail

echo "Deleting namespace circuitbreak..."
oc delete namespace circuitbreak --ignore-not-found=true
