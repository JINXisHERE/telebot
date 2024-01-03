#!/bin/bash
sorce /scripts/global_variables

# Set the message text
IP=$(hostname -I | cut -d ' ' -f 1)

# Use the curl command to send the message
curl -s -X POST https://api.telegram.org/bot$API_TOKEN/sendMessage -d chat_id=$CHAT_ID -d text="$HOSTNAME is online $IP"