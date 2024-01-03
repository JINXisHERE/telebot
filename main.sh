#!/bin/bash
#get the path of the main script
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

#link global_variables 
source $SCRIPTPATH/scripts/global_variables

# Set the message text
IP=$(hostname -I | cut -d ' ' -f 1)

# Use the curl command to send the message
curl -s -X POST https://api.telegram.org/bot$API_TOKEN/sendMessage -d chat_id=$CHAT_ID -d text="$HOSTNAME is online $IP"