#!/usr/bin/env bash
set -e

# Message to user if they are running OS that's not Debian-based
if [ ! -f /etc/debian_version ]; then
  echo "ERROR: This project supports Debian-based Linux distributions only."
  exit 1
fi

# Installs Python & Tkinter
echo "Installing system dependencies..."
sudo apt update
sudo apt install -y python3 python3-tk

# Installs Python dependencies. Only here for future proofing. Time Zone Clock  won't need any pip
#if [ -f requirements.txt ]; then
#echo "Installing Python dependencies..."
#python3 -m pip install --user -r requirements.txt
#fi

echo "Installation complete"
echo "To run the application manually:"
echo " python3 app/main.py"
echo "Or, Right-click main.py and Run as Program"
