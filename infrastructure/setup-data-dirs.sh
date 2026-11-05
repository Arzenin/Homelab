#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Check if a path argument was provided
if [ -z "$1" ]; then
    echo "Error: No target path provided."
    echo "Usage: $0 /path/to/destination"
    exit 1
fi

TARGET_DIR="$1/data"

echo "Creating the 'data' directory and structure inside: $TARGET_DIR"

# Create the base data directory and all subdirectories
mkdir -p "$TARGET_DIR/jellyfin/cache"
mkdir -p "$TARGET_DIR/jellyfin/config"
mkdir -p "$TARGET_DIR/jellyfin/media"

mkdir -p "$TARGET_DIR/nextjs/app"
mkdir -p "$TARGET_DIR/nginx/conf.d"
mkdir -p "$TARGET_DIR/portainer"

echo "Directory structure has been successfully created inside '$TARGET_DIR'!"
