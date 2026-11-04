#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo or as root."
  exit 1
fi

echo "Updating system and installing dependencies..."
apt-get update && apt-get install -y curl

echo "Downloading and installing ZeroTier..."
curl -s https://install.zerotier.com | bash

echo "Enabling and starting ZeroTier service..."
systemctl enable zerotier-one
systemctl start zerotier-one

echo "Installation completed successfully!"
