#!/bin/sh
# SnapPaste installer:  curl -fsSL https://github.com/ShamanSean1/snappaste/releases/latest/download/install.sh | sh
# Also works as an updater — run it again to get the latest version.
set -e

REPO="ShamanSean1/snappaste"
URL="https://github.com/$REPO/releases/latest/download/SnapPaste.zip"

# Check the Mac can run it (Apple Silicon: macOS 12.3+, Intel: macOS 13+).
OS=$(sw_vers -productVersion)
MAJOR=$(echo "$OS" | cut -d. -f1)
MINOR=$(echo "$OS" | cut -d. -f2)
if [ "$(uname -m)" = "arm64" ]; then
  if [ "$MAJOR" -lt 12 ] || { [ "$MAJOR" -eq 12 ] && [ "${MINOR:-0}" -lt 3 ]; }; then
    echo "SnapPaste needs macOS 12.3 or newer (you have $OS)."; exit 1
  fi
elif [ "$MAJOR" -lt 13 ]; then
  echo "SnapPaste needs macOS 13 Ventura or newer on Intel Macs (you have $OS)."; exit 1
fi

DEST="${SNAPPASTE_DEST:-/Applications}"
if [ ! -w "$DEST" ]; then DEST="$HOME/Applications"; mkdir -p "$DEST"; fi

TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

echo "Downloading SnapPaste…"
curl -fsSL "$URL" -o "$TMP/SnapPaste.zip"
ditto -x -k "$TMP/SnapPaste.zip" "$TMP"

[ -z "$SNAPPASTE_DEST" ] && pkill -x SnapPaste 2>/dev/null && sleep 1 || true
rm -rf "$DEST/SnapPaste.app"
ditto "$TMP/SnapPaste/SnapPaste.app" "$DEST/SnapPaste.app"
xattr -dr com.apple.quarantine "$DEST/SnapPaste.app" 2>/dev/null || true

echo "✓ SnapPaste installed in $DEST"
if [ -z "$SNAPPASTE_DEST" ]; then
  open "$DEST/SnapPaste.app"
  echo "  The quick tour is opening now."
fi
