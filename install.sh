#!/bin/bash
set -e

ROOT_UID=0
THEME_DIR="/usr/share/sddm/themes"
THEME_NAME="WhiteSur-dark-herzane"
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ "$UID" -ne "$ROOT_UID" ]; then
    echo "Please run as root: sudo ./install.sh"
    exit 1
fi

echo "Installing ${THEME_NAME} to ${THEME_DIR}..."

rm -rf "${THEME_DIR}/${THEME_NAME}"
mkdir -p "${THEME_DIR}/${THEME_NAME}"

# Copy theme files, excluding repository-only files
cp -a "${REPO_DIR}/metadata.desktop" "${THEME_DIR}/${THEME_NAME}/"
cp -a "${REPO_DIR}/Main.qml" "${THEME_DIR}/${THEME_NAME}/"
cp -a "${REPO_DIR}/Login.qml" "${THEME_DIR}/${THEME_NAME}/"
cp -a "${REPO_DIR}/Background.qml" "${THEME_DIR}/${THEME_NAME}/"
cp -a "${REPO_DIR}/Input.qml" "${THEME_DIR}/${THEME_NAME}/"
cp -a "${REPO_DIR}/SessionButton.qml" "${THEME_DIR}/${THEME_NAME}/"
cp -a "${REPO_DIR}/KeyboardButton.qml" "${THEME_DIR}/${THEME_NAME}/"
cp -a "${REPO_DIR}/theme.conf" "${THEME_DIR}/${THEME_NAME}/"
cp -a "${REPO_DIR}/default-logo.svg" "${THEME_DIR}/${THEME_NAME}/"
cp -a "${REPO_DIR}/background.png" "${THEME_DIR}/${THEME_NAME}/"
cp -a "${REPO_DIR}/preview.png" "${THEME_DIR}/${THEME_NAME}/"
cp -a "${REPO_DIR}/assets" "${THEME_DIR}/${THEME_NAME}/"
cp -a "${REPO_DIR}/faces" "${THEME_DIR}/${THEME_NAME}/"

chown -R root:root "${THEME_DIR}/${THEME_NAME}"
chmod -R a+rX "${THEME_DIR}/${THEME_NAME}"

echo "Done. Select '${THEME_NAME}' in System Settings -> Startup and Shutdown -> Login Screen (SDDM)."
echo "Or set in /etc/sddm.conf:"
echo "  [Theme]"
echo "  Current=${THEME_NAME}"