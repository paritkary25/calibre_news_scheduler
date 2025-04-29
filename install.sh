#!/bin/bash
# File: install.sh
# Author: Y.U.P.
# Last modified: 2025-04-29 Tue 15:23
# Created: 2025-04-29 Tue 15:23

printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
printf "Install calibre-server script\n"

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

# Check if the job is already in the systemd services
ls /etc/systemd/system | grep -q calibre

# If not found, add it
if [ $? -ne 0 ]; then
    sudo cp $SCRIPT_DIR/calibre-server.service /etc/systemd/system/
    sudo systemctl daemon-reexec
    sudo systemctl daemon-reload
    sudo systemctl enable calibre-server.service
    sudo systemctl start calibre-server.service
    echo "systemd service added"
else
    echo "systemd service already exists"
fi

# Make sure the script is executable
sudo chmod 776 $SCRIPT_DIR/news.sh

# Adding a cronjob
crontab -l | { cat; echo "0 6 * * * "$SCRIPT_DIR/news.sh""; } | crontab -
printf "cronjob added successfully\n Make sure to update the newsfeeds according to your need\n"
