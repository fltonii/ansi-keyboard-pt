#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
XCOMPOSE_SRC="$SCRIPT_DIR/XCompose"
XCOMPOSE_DST="$HOME/.XCompose"
ENV_DIR="$HOME/.config/plasma-workspace/env"
COMPOSETABLE_SH="$ENV_DIR/composetable.sh"

# Copy XCompose file
if [ -f "$XCOMPOSE_DST" ]; then
    echo "Backing up existing ~/.XCompose to ~/.XCompose.bak"
    cp "$XCOMPOSE_DST" "$XCOMPOSE_DST.bak"
fi

echo "Installing XCompose to ~/.XCompose"
cp "$XCOMPOSE_SRC" "$XCOMPOSE_DST"

# Set up environment variable for KDE Wayland
if [ ! -d "$ENV_DIR" ]; then
    echo "Creating $ENV_DIR"
    mkdir -p "$ENV_DIR"
fi

if [ -f "$COMPOSETABLE_SH" ]; then
    echo "Skipping $COMPOSETABLE_SH (already exists)"
else
    echo "Writing $COMPOSETABLE_SH"
    echo 'export XCOMPOSEFILE="$HOME/.XCompose"' > "$COMPOSETABLE_SH"
fi

echo ""
echo "Installation complete!"
echo "Please log out and log back in for the changes to take effect."
