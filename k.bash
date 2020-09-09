#!/bin/bash

# kubectl wrapper to switch KUBECONFIG environments.
k() {
  if [[ "${1}" == 'yourenv' ]]; then
    KUBECONFIG="${HOME}/.kube/configs/yourenv"
    shift
    kubectl "${@}"
  else
    kubectl "${@}"
  fi
}
compdef k='kubectl' # completion
