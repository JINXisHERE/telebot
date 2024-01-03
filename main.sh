#!/bin/bash
#get the path of the main script
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

#link global_variables 
source $SCRIPTPATH/scripts/global_variables

#Get the IP
IP=$(hostname -I | cut -d ' ' -f 1)

#Create the content of the message
MESSAGE=$"$HOSTNAME is online $IP"

# Use the curl command to send the message
curl -s -X POST https://api.telegram.org/bot$API_TOKEN/sendMessage -d chat_id=$CHAT_ID -d text="$MESSAGE"