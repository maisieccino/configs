#!/bin/bash

THEME=$(cat theme_choice)
cp -r ./$THEME/. ~/.config/
cp -r ./shared/. ~/.config/

echo "Theme $THEME loaded"
