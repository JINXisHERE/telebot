#!/bin/bash

# Get the directory of the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Navigate to the parent directory
PARENT_DIR="$(dirname "$SCRIPT_DIR")"

# Full path to main.sh in the parent directory
MAIN_SCRIPT="$PARENT_DIR/main.sh"

# Step 1: Create a new service file
sudo tee /etc/systemd/system/my-rc-local.service <<EOF
[Unit]
Description=Custom rc.local Compatibility

[Service]
Type=simple
ExecStart=/etc/rc.local
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

# Step 2: Create the /etc/rc.local script
sudo tee /etc/rc.local <<EOF
#!/bin/bash
$MAIN_SCRIPT

exit 0
EOF

# Step 3: Make the script executable
sudo chmod +x /etc/rc.local

# Step 4: Enable and start the service
sudo systemctl enable my-rc-local
sudo systemctl start my-rc-local
