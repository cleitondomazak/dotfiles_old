#!/bin/sh
if test "$(which code)"; then
	if [ "$(uname -s)" = "Darwin" ]; then
		VSCODE_HOME="$HOME/Library/Application Support/Code"
	else
		VSCODE_HOME="$HOME/.config/Code"
	fi

	ln -sf "$DOTFILES/vscode/settings.json" "$VSCODE_HOME/User/settings.json"
	ln -sf "$DOTFILES/vscode/keybindings.json" "$VSCODE_HOME/User/keybindings.json"
	ln -sf "$DOTFILES/vscode/snippets" "$VSCODE_HOME/User/snippets"

	# from `code --list-extensions`
	modules="
akamud.vscode-theme-onedark
DavidAnson.vscode-markdownlint
eamodio.gitlens
foxundermoon.shell-format
HookyQR.beautify
ipedrazas.kubernetes-snippets
korekontrol.saltstack
mauve.terraform
ms-azuretools.vscode-azureterraform
ms-azuretools.vscode-docker
ms-ossdata.vscode-postgresql
ms-python.python
ms-vscode.azure-account
ms-vscode.Go
PKief.material-icon-theme
timonwong.shellcheck"
	for module in $modules; do
		"$module" || true
	done
fi
