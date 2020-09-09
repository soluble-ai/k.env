# k.env

An elegant implementation of `kubectl` "contexts" using `KUBECONFIG`
in a convenient and easy to understand shell function.

Using the format `$ k prod`, or in a command as `$ k prod get pods`, the
`KUBECONFIG` "context" is set for the remainder of that terminal session.

## Source

### POSIX

Add this snippet to your `.bashrc`, `.zshrc`, or other
POSIX environment files. *You should really only use this if you're using a
true POSIX shell. Otherwise use the Zsh or Bash snippets below.*

```sh
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

### Bash

Add this snippet to your `.bashrc` or other sourced files.
**Includes completion for kubectl.**

<details><summary>k.bash</summary>
<p>

```bash
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

Add this snippet to your `.zshrc` or other sourced files.
**Includes completion for kubectl.**

<details><summary>k.zsh</summary>
<p>

#### k.zsh

```zsh
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

A variation of this has always existed in my `.zshrc`. Originally titled "k.sh".

kubectx, a popular utility that serves a *similar* function, is a choice between
a ~250 line shell script or a compiled Go binary.

k.env is about a dozen lines of POSIX.

Simple is better.

Inspired by [@ibuildthecloud's tweet](https://twitter.com/ibuildthecloud/status/1303329978088484869),
built by Matt at [Soluble.ai](https://www.soluble.ai).
