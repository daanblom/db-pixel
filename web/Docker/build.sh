#!/bin/bash
set -euo pipefail

# Ensure script is run from the Docker directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [[ "$(basename "$SCRIPT_DIR")" != "Docker" ]]; then
    echo "Error: Script must be run from the Docker directory" >&2
    exit 1
fi

# Clean and copy files
rm -rf public/*
cp -r ../Site/* public/

# Build Docker image
docker build -t db-pixeldotclub:latest .

echo "Build completed"
