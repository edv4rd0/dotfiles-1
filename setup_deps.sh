#!/bin/bash

git_installers=(
    getantibody/installer/master/install # antibody
    creationix/nvm/v0.33.11/install.sh   # nvm
    pyenv/pyenv-installer/master/bin/pyenv-installer # pyenv
)

for installer in "${git_installers[@]}"; do
    curl -sL https://raw.githubusercontent.com/$installer | bash
done

# install pyenv-version-alias plugin
git clone https://github.com/aiguofer/pyenv-version-alias $(pyenv root)/plugins/pyenv-version-alias

# install pipx and python executables
PYENV_VERSION=system pip3 install --user pipx

for pkg in $(cat ./requirements_pipx.txt);do
    pipx install $pkg
done

necessary_packages=(
    emacs
    git
    curl
    python2
    zsh
    powerline
    rofi
    i3 # gaps or regolith
    i3lock-color # https://github.com/codejamninja/i3lock-color-ubuntu
    polybar
    shutter
    silver-searcher # ag
    ripgrep
    autorandr
    arandr
    automirror # https://github.com/schlomo/automirror/
    playerctl
    dunst
    tmux
    terminator
    redshift-gtk
    insync
    insync-nemo
    nemo
    google-play-music-desktop-player
    xbacklight # https://gitlab.com/wavexx/acpilight
    feh
    compton
    earlyoom # prevent system from locking up due to OOM
    pasystray
    nm-applet
    qalculate-gtk
    lightdm-gtk-greeter
    lightdm
    gthumb
    google-chrome
    zathura
)

wanted_packages=(
    todoist
    upwork
    rescuetime
    franz
)

# deps for building compton
# sudo apt install meson libev4 libev libev-dev xcb-dev x11-xcb libx11-xcb libx11-xcb-dev libxcb-damage0-dev libxcb-sync-dev libxcb-xinerama0-dev libxcb-present-dev uthash-dev libconfig-dev libxdg-basedir-dev gl-dev libglc-dev
