#!/bin/bash

# Wait for Spotify window to appear
while ! hyprctl clients | grep -q "Spotify"; do
  sleep 0.1
done

# Wait a bit more for it to fully render
sleep 0.3

# Move the window to X=40, Y=60
hyprctl dispatch movewindowpixel exact 40 60
