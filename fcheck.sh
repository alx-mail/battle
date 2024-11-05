#!/bin/bash

BOT_TOKEN="7663925767:AAHA70OzY3s39hLaEslCVifgwW5JvHFzM8o"
CHAT_ID=-1002350894562

send_telegram_message() {
    curl -s -X POST https://api.telegram.org/bot${BOT_TOKEN}/sendMessage \
      -F chat_id=${CHAT_ID} \
      -F text="${1}"
}
FILE="/root/flag.txt"
LOGFILE="/var/log/flog.log"
HOSTNAME=$(hostname)
DATE=$(date +'%H:%M:%S %d.%m.%Y')
#ADDR="test@mail.com"
SUBJ_ERR="$HOSTNAME ATTENTION FLAG DETECTED!"

if [ -e "$FILE" ]; then
    MESSAGE="$DATE, $SUBJ_ERR"
    echo "$MESSAGE" >> "$LOGFILE"
    send_telegram_message "$MESSAGE"
#    echo "$DATE, $SUBJ_ERR" | mailx -s "$SUBJ_ERR" "$ADDR"
else
    echo "$DATE: NO FLAG! $HOSTNAME" >> "$LOGFILE"
fi
