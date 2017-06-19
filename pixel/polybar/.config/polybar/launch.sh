#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar mBar -r &
if [ $(xrandr -q | grep " connected" | wc -l ) -gt 1 ]; then
    polybar eBar -r &
fi

echo "Bar launched..."
