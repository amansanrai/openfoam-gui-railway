#!/bin/bash

export DISPLAY=:1

echo "Starting Xvfb..."
Xvfb :1 -screen 0 1920x1080x24 &

sleep 3

echo "Starting XFCE..."
startxfce4 &

sleep 5

echo "Starting VNC..."
vncserver :1 -SecurityTypes None -geometry 1920x1080 -depth 24

sleep 3

echo "Starting noVNC..."

/opt/noVNC/utils/novnc_proxy \
    --vnc localhost:5901 \
    --listen $PORT
