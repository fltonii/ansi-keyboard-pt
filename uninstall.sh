#!/bin/bash
set -euo pipefail

XCOMPOSE_DST="$HOME/.XCompose"
XCOMPOSE_BAK="$HOME/.XCompose.bak"
COMPOSETABLE_SH="$HOME/.config/plasma-workspace/env/composetable.sh"
EXPECTED_CONTENT='export XCOMPOSEFILE="$HOME/.XCompose"'

# Remove or restore ~/.XCompose
if [ -f "$XCOMPOSE_BAK" ]; then
    echo "Restoring ~/.XCompose from backup (~/.XCompose.bak)"
    mv "$XCOMPOSE_BAK" "$XCOMPOSE_DST"
elif [ -f "$XCOMPOSE_DST" ]; then
    echo "Removing ~/.XCompose"
    rm "$XCOMPOSE_DST"
else
    echo "~/.XCompose not found, nothing to remove"
fi

# Remove composetable.sh only if it matches what we wrote
if [ -f "$COMPOSETABLE_SH" ]; then
    if [ "$(cat "$COMPOSETABLE_SH")" = "$EXPECTED_CONTENT" ]; then
        echo "Removing $COMPOSETABLE_SH"
        rm "$COMPOSETABLE_SH"
    else
        echo "Skipping $COMPOSETABLE_SH (contents were modified by user)"
    fi
else
    echo "$COMPOSETABLE_SH not found, nothing to remove"
fi

echo ""
echo "Uninstall complete!"
echo "Please log out and log back in for the changes to take effect."
