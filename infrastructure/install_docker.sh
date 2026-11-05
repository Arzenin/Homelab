#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Check if the script is run with root privileges (sudo)
if [ "$EUID" -ne 0 ]; then
    echo "Error: This script must be run with root privileges."
    echo "Please run it using sudo: sudo ./install_docker.sh"
    exit 1
fi

echo "Updating system package index..."
apt-get update -y
apt-get upgrade -y

echo "Downloading and running the official Docker installation script (prerequisites will be installed automatically)..."
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# Get the actual user who invoked sudo (fallback to $USER if not found)
REAL_USER="${SUDO_USER:-$USER}"

echo "Adding user '$REAL_USER' to the docker group so you can run Docker without sudo..."
usermod -aG docker "$REAL_USER"

echo "Enabling and starting the Docker service..."
systemctl enable docker
systemctl start docker

echo "Verifying Docker and Docker Compose installation..."
docker --version
docker compose version

echo "Cleaning up temporary installation files..."
rm -f get-docker.sh

echo "Docker and Docker Compose have been successfully installed!"
echo "Please log out and log back in (or reboot your Raspberry Pi) for the group permissions to take effect."
