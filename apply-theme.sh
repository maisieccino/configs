#!/bin/bash
set -e

THEME=$(cat theme_choice)
cp -r ./$THEME/. ~/.config/
cp -r ./shared/. ~

echo "Theme $THEME loaded"
