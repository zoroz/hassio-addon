#!/bin/sh

# If running as root (first invocation), fix mountpoint permissions
# and re-run this script as appuser.
if [[ $(id -u) -eq 0 ]]; then
  chown -R appuser:appuser /store /config
  chown appuser:appuser /makeconf.sh
  exec su appuser -- "$0" "$@"
fi

echo "Make Config File"
/makeconf.sh


ot-recorder --initialize
ot-recorder "$@"
