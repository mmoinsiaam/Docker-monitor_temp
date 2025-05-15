#!/bin/bash

: "${TEMP_THRESHOLD:=70}"
TEMP_FILE="/sys/class/thermal/thermal_zone0/temp"

send_email() {
  echo -e "Subject: Raspberry Pi Temperature Alert\n\nWarning: Raspberry Pi temperature exceeded ${TEMP_THRESHOLD}°C!\n\nCurrent temperature: $1°C" | msmtp --debug "$TO" >> /root/.msmtp-log 2>&1
}

helper() {
  send_email $1
  echo "Temperature exceeded threshold."
}

CURRENT_TEMP=$(cat $TEMP_FILE)
CURRENT_TEMP_C=$((CURRENT_TEMP / 1000))

if [ "$CURRENT_TEMP_C" -gt "$TEMP_THRESHOLD" ]; then
  helper $CURRENT_TEMP_C
fi
