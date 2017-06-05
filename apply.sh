#!/bin/bash

THEMES=("space" "pixel" "shared")

SILENT=${SILENT-false}

old_theme=$(cat ~/.config/theme)

set -e

clear_theme() {
    if [ ! -z "$old_theme" ]; then
        [ "$SILENT" == "false" ] && echo "removing $old_theme"
        $old_theme/stow.sh un
    fi
    [ "$SILENT" == "false" ] && echo "removing shared configs"
    shared/stow.sh un
}

if [ "$1" == "clear" ]; then
    clear_theme
    exit 0
fi

[ -z "$THEME" ] && THEME="pixel"

if [ ! -z "$1" ]; then
    THEME="$1"
fi

clear_theme

[ "$SILENT" == "false" ] && echo "applying $THEME"
$THEME/stow.sh
[ "$SILENT" == "false" ] && echo "applying shared configs"
shared/stow.sh

echo "$THEME" > $HOME/.config/theme
