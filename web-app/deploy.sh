#!/bin/bash

# ==============================================================================
# Script Name: deploy.sh
# Description: Automates the local build (with internet access) and deployment 
#              of the Next.js portfolio stack using Docker Compose in an 
#              isolated/internal network environment.
# Usage: ./deploy.sh [target_directory]
# ==============================================================================

# Determine the working directory: use the provided argument if available, 
# otherwise default to the current working directory ($PWD).
TARGET_DIR="${1:-$PWD}"

echo "=== Changing working directory to: $TARGET_DIR ==="
cd "$TARGET_DIR" || { echo "Error: Unable to access path $TARGET_DIR"; exit 1; }

echo "=== 1. Installing dependencies and building on the host (with Internet access) ==="
npm install
npm run build

echo "=== 2. Deploying containers using Docker Compose (isolated mode) ==="
docker compose down
docker compose up -d

echo "=== Deployment completed successfully! ==="
