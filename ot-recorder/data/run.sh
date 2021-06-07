#!/bin/sh

# If running as root (first invocation), fix mountpoint permissions
# and re-run this script as appuser.
if [[ $(id -u) -eq 0 ]]; then
  chown -R appuser:appuser /store /config
  chown appuser:appuser /makeconf.sh
  exec su appuser -- "$0" "$@"
fi

echo "Make Config File"
CONFIG_FILE=/data/options.json
CONFIG_OUT=/config/recorder.conf

#CONFIG=`cat $CONFIG_FILE`

> $CONFIG_OUT

OUTPUT="OTR_CAPATH = \"/config\"\n" 
OUTPUT=$OUTPUT"OTR_STORAGEDIR= \"/addons/ot-recorder\"\n" 
OUTPUT=$OUTPUT"OTR_HTTPHOST = \"$(jq --raw-output '.localHost' $CONFIG_FILE)\"\n"
OUTPUT=$OUTPUT"OTR_HOST = \"$(jq --raw-output '.mqttServer' $CONFIG_FILE)\"\n"
OUTPUT=$OUTPUT"OTR_PORT = \"$(jq --raw-output '.mqttPort' $CONFIG_FILE)\"\n"
OUTPUT=$OUTPUT"OTR_USER = \"$(jq --raw-output '.mqttUser' $CONFIG_FILE)\"\n"
OUTPUT=$OUTPUT"OTR_PASS = \"$(jq --raw-output '.mqttPassword' $CONFIG_FILE)\"\n"
OUTPUT=$OUTPUT"OTR_TOPICS = \"$(jq --raw-output '.topic' $CONFIG_FILE)\""

echo -e $OUTPUT >> $CONFIG_OUT

echo $OUTPUT

ot-recorder --initialize
ot-recorder "$@"
