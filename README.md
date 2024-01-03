# Telebot

A useful telegram bot that can send you notifications about your server.
## Requirements 

First you need to create your own bot on Telegram by chatting to the botfather.
you will get a token that you will need to copy and paste into the global_variables file.


Start a chat with your bot and find you chat ID by using:
replace TOKEN with your bot token!
```
api.telegram.org/botTOKEN/getUpdates
``` 

one requirement is the telegram cli 

```bash
apt install telegram-cli
```
##Installation

just clone the repo into your desired destination

```
git clone https://github.com/JINXisHERE/telebot.git
```
```
chmod +x ./main.sh
```

## Usage

## Optional

If you want to run main.sh on startup you can add the path to the script into rc.local just before the 0
```
sudo nano /etc/rz.local
```

if you don#t have the rc.local file on your device the use the following commands:
```
sudo nano /etc/systemd/system/rc-local.service
```
```
[Unit]
 Description=/etc/rc.local Compatibility
 ConditionPathExists=/etc/rc.local

[Service]
 Type=forking
 ExecStart=/etc/rc.local start
 TimeoutSec=0
 StandardOutput=tty
 RemainAfterExit=yes
 SysVStartPriority=99

[Install]
 WantedBy=multi-user.target
```
```
printf '%s\n' '#!/bin/bash' 'exit 0' | sudo tee -a /etc/rc.local
```
```
sudo chmod +x /etc/rc.local
```
```
sudo systemctl enable rc-local
```
```
sudo systemctl start rc-local.service
```