#!/bin/bash

# Define network names
RED_FRONTEND="frontend-net"
RED_BACKEND="backend-net"

echo "=== Configuring Docker Networks ==="

# 1. Frontend Network: Outer access (Standard bridge)
if docker network inspect "$RED_FRONTEND" >/dev/null 2>&1; then
    echo "Network '$RED_FRONTEND' already exists."
else
    echo "Creating '$RED_FRONTEND' (with internet access)..."
    docker network create --driver bridge "$RED_FRONTEND"
fi

# 2. Backend Network: Docker internal only / No internet access (--internal)
if docker network inspect "$RED_BACKEND" >/dev/null 2>&1; then
    echo "Network '$RED_BACKEND' already exists."
else
    echo "Creating '$RED_BACKEND' (strictly internal without internet access)..."
    docker network create --driver bridge --internal "$RED_BACKEND"
fi

echo "=== Networks Ready ==="
docker network ls | grep -E "$RED_FRONTEND|$RED_BACKEND"

