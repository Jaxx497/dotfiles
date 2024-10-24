#!/bin/bash

# Switch to workspace 4 first
hyprctl dispatch workspace 3

# Launch Spotify
spotify &

# Launch Cava in a terminal (using kitty - replace with your preferred terminal)
hyprctl dispatch exec [workspace 3 silent] kitty cava

# Wait for windows to spawn
sleep 2

