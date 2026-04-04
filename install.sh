#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
XCOMPOSE_SRC="$SCRIPT_DIR/XCompose"
XCOMPOSE_DST="$HOME/.XCompose"
ENV_DIR="$HOME/.config/plasma-workspace/env"
COMPOSETABLE_SH="$ENV_DIR/composetable.sh"
FCITX5_MISSING=false

# Check for Fcitx5
if ! command -v fcitx5 &>/dev/null; then
    FCITX5_MISSING=true
    echo "WARNING: Fcitx5 is not installed."
    echo "Fcitx5 is required for compose sequences to work in all apps (including Chrome, VSCode, etc.)."
    echo ""
    echo "Install it with your package manager. For example:"
    echo "  Arch:   sudo pacman -S fcitx5 fcitx5-configtool fcitx5-gtk fcitx5-qt"
    echo "  Debian: sudo apt install fcitx5 fcitx5-config-qt fcitx5-frontend-gtk3 fcitx5-frontend-qt5"
    echo ""
    echo "Continuing with XCompose setup (will work in Qt/KDE apps without Fcitx5)..."
    echo ""
fi

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

# Configure Fcitx5 profile
if [ "$FCITX5_MISSING" = false ]; then
    # Set Fcitx5 keyboard layout to US alt. intl. (preserves dead keys)
    FCITX5_PROFILE="$HOME/.config/fcitx5/profile"
    if [ -f "$FCITX5_PROFILE" ]; then
        echo "Backing up existing Fcitx5 profile to $FCITX5_PROFILE.bak"
        cp "$FCITX5_PROFILE" "$FCITX5_PROFILE.bak"
    fi
    echo "Writing Fcitx5 profile with US alt. intl. layout"
    mkdir -p "$HOME/.config/fcitx5"
    cat > "$FCITX5_PROFILE" <<'PROFILE'
[Groups/0]
Name=Default
Default Layout=us-alt-intl
DefaultIM=keyboard-us-alt-intl

[Groups/0/Items/0]
Name=keyboard-us-alt-intl
Layout=

[GroupOrder]
0=Default
PROFILE

    # If Fcitx5 is running, tell it to reload; otherwise it picks up the profile on next start
    if pgrep -x fcitx5 &>/dev/null; then
        echo "Reloading Fcitx5 configuration..."
        fcitx5-remote -r 2>/dev/null || true
    fi
fi

echo ""
echo "Installation complete!"
if [ "$FCITX5_MISSING" = true ]; then
    echo ""
    echo "IMPORTANT: Install Fcitx5 first, then re-run this script."
else
    echo ""
    echo "Next steps:"
    echo "  1. Set Fcitx5 as your input method:"
    echo "     KDE: System Settings > Virtual Keyboard > select 'Fcitx 5'"
    echo "  2. Log out and log back in"
fi
