#!/bin/sh

xrdb -override ~/.Xresources
i3-msg reload
i3-msg restart
