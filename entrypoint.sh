#!/usr/bin/env sh

HOST_UID="$(stat -c %u /home/astrodmx/AstroDMx_DATA)"
HOST_GID="$(stat -c %g /home/astrodmx/AstroDMx_DATA)"

usermod --non-unique --uid "$HOST_UID" astrodmx
groupmod --non-unique --gid "$HOST_GID" astrodmx

if [ "$(service --status-all 2>/dev/null | grep -c "+.*udev$")" -lt 1 ]; then
  service udev start
fi

if [ ! -f /usr/local/AstroDMx_Capture ]; then
  dpkg -i /home/astrodmx/install.deb
fi

if [ $# -eq 0 ];  then
  sudo -u astrodmx /usr/local/AstroDMx_Capture/bin/AstroDMx-Capture
else
  "$@"
fi
