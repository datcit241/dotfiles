#!/bin/bash
exec "$@" --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime --disable-gpu
