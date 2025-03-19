#!/bin/bash
set -euo pipefail

# Ensure script is run from the web directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [[ "$(basename "$SCRIPT_DIR")" != "web" ]]; then
    echo "Error: Script must be run from the web directory" >&2
    exit 1
fi

# Clean and copy files
rm -rf Site/db-pixel/*.otf 
rm -rf Site/db-pixel/*.ttf
cp ../../db-pixel/Build/TTF/* Site/db-pixel/
cp ../../db-pixel/Build/OTF/* Site/db-pixel/

# Zip files

zip -r Site/db-pixel.zip Site/db-pixel
