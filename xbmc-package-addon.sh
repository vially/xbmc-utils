#!/bin/bash

usage(){
    echo "Usage: $0 addon-name [addon-path]"
    exit 1
}

ADDON_SRC="$1"
DEST_DIR="$PWD"
TMP_DIR="$(mktemp -d)"

if [[ $# -eq 0 ]]; then
    ADDON_SRC="."
fi

ADDON_XML_FILE="$ADDON_SRC/addon.xml"
if [ ! -f "$ADDON_XML_FILE" ]; then
    echo "$ADDON_XML_FILE could not be found"
    exit 1
fi

ADDON_NAME=`xml sel -t -v '/addon/@id' "$ADDON_XML_FILE"`
ADDON_VERSION=`xml sel -t -v '/addon/@version' "$ADDON_XML_FILE"`
ADDON_ZIP_NAME="$ADDON_NAME-$ADDON_VERSION.zip"

if [ -f "$DEST_DIR/$ADDON_ZIP_NAME" ]; then
    rm "$DEST_DIR/$ADDON_ZIP_NAME"
fi

cp -r "$ADDON_SRC" "$TMP_DIR/$ADDON_NAME"
cd "$TMP_DIR"
find "$ADDON_NAME" -path '*/.*' -prune -o -type f -print | zip "$DEST_DIR/$ADDON_ZIP_NAME" -@
rm -rf "$TMP_DIR"
