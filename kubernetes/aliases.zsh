#!/bin/sh

kubectl() {
	# shellcheck disable=SC1090,SC2039
	source <(command kubectl completion zsh)
	command kubectl "$@"
}

kx() {
	test -n "$1" && kubectl config use-context "$1"
	test -z "$1" && kubectl config get-contexts
}

alias k='kubectl'
alias sk='kubectl -n kube-system'
alias ke='EDITOR=vim kubectl edit'
alias gpods='kubectl get pods'

alias kdebug='kubectl run -i -t debug --rm --image=caarlos0/debug --restart=Never'
alias kfails='kubectl get po -owide --all-namespaces | grep "0/" | tee /dev/tty | wc -l'
alias kimg="kubectl get deployment --output=jsonpath='{.spec.template.spec.containers[*].image}'"
