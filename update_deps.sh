#!/bin/zsh

if [ $commands[antibody] ]; then
    echo "Updating zsh modules"
    antibody update
fi

if [ $commands[pyenv] ]; then
    echo "Updating pyenv"
    pyenv update
fi

tpm=$HOME/.tmux/plugins/tpm/bin/update_plugins
if [ -f $tpm ]; then
    echo "Updating tmux plugins"
    $tpm all
fi

if [ $commands[pipx] ]; then
    echo "Updating packages installed through pipx"
    pipx upgrade-all
fi

if [ $commands[dnf] ]; then
    echo "Updating Fedora packages"
    sudo dnf -y upgrade --refresh
fi

if [ $commands[flatpak] ]; then
    echo "Updating flatpacks"
    flatpak -y update
fi

if [ $commands[apt] ]; then
    echo "Updating Ubuntu packages"
    sudo apt update
    sudo apt full-upgrade -y
fi

echo "Updating completion scripts"
./setup_completions.sh
