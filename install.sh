#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# Set default brand if not already set
export OMADEB_BRAND="${OMADEB_BRAND:-Omadeb}"

# Define Omadeb locations
export OMADEB_PATH="$HOME/.local/share/omadeb"
export OMADEB_INSTALL="$OMADEB_PATH/install"
export OMADEB_INSTALL_LOG_FILE="/var/log/${OMADEB_BRAND,,}-install.log"
export PATH="$OMADEB_PATH/bin:$PATH"

# Install
source "$OMADEB_INSTALL/helpers/all.sh"
source "$OMADEB_INSTALL/preflight/all.sh"
source "$OMADEB_INSTALL/packaging/all.sh"
source "$OMADEB_INSTALL/config/all.sh"
source "$OMADEB_INSTALL/login/all.sh"
source "$OMADEB_INSTALL/post-install/all.sh"