# k.sh

> "K dot SH"

An elegant implementation of `kubectl` "contexts" using `KUBECONFIG`,
all wrapped in a convenient and easy to understand POSIX shell function.

Using the format `k prod`, or in a command as `k prod get pods`, the
`KUBECONFIG` "context" is set for the remainder of that terminal session.

## Source

### POSIX

Add this snippet (minus the shebang) to your `.bashrc`, `.zshrc`, or other
POSIX environment files. *You should really only use this if you're using a
true POSIX shell. Otherwise use the Zsh or Bash snippets below.*

<details><summary>k.sh</summary>
<p>

```sh
#!/bin/sh

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
```

</p>
</details>

### Bash

Add this snippet (minus the shebang) to your `.bashrc` or other sourced files.
**Includes completion for kubectl.**

<details><summary>k.bash</summary>
<p>

```bash
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
```

</p>
</details>

### ZSH

Add this snippet (minus the shebang) to your `.zshrc` or other sourced files.
**Includes completion for kubectl.**

<details><summary>k.zsh</summary>
<p>

#### k.zsh

```zsh
#!/bin/zsh

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
```

</p>
</details>

## About

A variation of this has always existed in my `.zshrc`.

Inspired by [@ibuildthecloud's tweet](https://twitter.com/ibuildthecloud/status/1303329978088484869),
built by Matt at [Soluble.ai](https://www.soluble.ai).
