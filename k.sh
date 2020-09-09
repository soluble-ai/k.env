#!/bin/sh

k() {
  if [[ ${1} == 'yourenv' ]]; then
    KUBECONFIG=${HOME}/.kube/configs/yourenv
    shift
    kubectl ${@}
  else
    kubectl ${@}
  fi
}
