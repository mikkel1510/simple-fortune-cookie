#!/usr/bin/env bash
set -e
echo "$KUBE_CONFIG_B64" | base64 -d > kubeconfig
kubectl --kubeconfig kubeconfig apply -f manifest.yaml
kubectl --kubeconfig kubeconfig rollout restart deployment/backend
kubectl --kubeconfig kubeconfig rollout restart deployment/frontend
