#!/bin/sh -e

SILENT=${SILENT-true}

DIRNAME=$(dirname $0)
cd $DIRNAME

MODULES=( "compton" "dunst" "gtk" "i3" "polybar" "Xresources" "zsettings")

ARG="-t /home/$USER"

if [ "$1" == "un" ]; then
    ARG="-D -t /home/$USER"
fi

for module in "${MODULES[@]}"; do
    [ "$SILENT" == "false" ] && echo "stow $ARG $module"
    stow $ARG $module
done
