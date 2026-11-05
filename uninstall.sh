#!/bin/bash
set -e

THEME_DIR="/usr/share/sddm/themes"
THEME_NAME="WhiteSur-dark-herzane"

if [ "$UID" -ne 0 ]; then
    echo "Please run as root: sudo ./uninstall.sh"
    exit 1
fi

rm -rf "${THEME_DIR}/${THEME_NAME}"
echo "Removed ${THEME_NAME}."