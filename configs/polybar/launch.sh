#!/usr/bin/env bash
# Polybar launch script

# Kill existing instances
killall -q polybar

# Wait until processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.5; done

# Launch bar
polybar main 2>&1 | tee -a /tmp/polybar.log &

echo "Polybar launched"
