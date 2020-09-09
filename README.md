# k.sh

> "K dot SH"

An elegant implementation of `kubectl` "contexts" using `KUBECONFIG`,
all wrapped in a convenient and easy to understand POSIX shell function.

Using the format `k prod`, or in a command as `k prod get pods`, the
`KUBECONFIG` "context" is set for the remainder of that terminal session.

## Source

```sh
#!/bin/sh

# kubectl wrapper and alias, switching on environments
k() {
  if [[ "${1}" == 'yourenv' ]]; then
    KUBECONFIG="${HOME}/.kube/configs/yourenv"
    shift
    kubectl "${@}"
  else
    kubectl "${@}"
  fi
}
```

## About

A variation of this has always existed in my `.zshrc`.

Inspired by [@ibuildthecloud's tweet](https://twitter.com/ibuildthecloud/status/1303329978088484869).
