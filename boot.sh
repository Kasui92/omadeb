#!/bin/bash

set -o pipefail

ascii_art='
 ▄██████▄    ▄▄▄▄███▄▄▄▄      ▄████████ ████████▄     ▄████████ ▀█████████▄
███    ███ ▄██▀▀▀███▀▀▀██▄   ███    ███ ███   ▀███   ███    ███   ███    ███
███    ███ ███   ███   ███   ███    ███ ███    ███   ███    █▀    ███    ███
███    ███ ███   ███   ███   ███    ███ ███    ███  ▄███▄▄▄      ▄███▄▄▄██▀
███    ███ ███   ███   ███ ▀███████████ ███    ███ ▀▀███▀▀▀     ▀▀███▀▀▀██▄
███    ███ ███   ███   ███   ███    ███ ███    ███   ███    █▄    ███    ██▄
███    ███ ███   ███   ███   ███    ███ ███   ▄███   ███    ███   ███    ███
 ▀██████▀   ▀█   ███   █▀    ███    █▀  ████████▀    ██████████ ▄█████████▀
'
clear
echo -e "\n$ascii_art\n"

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

# Use custom repo if specified, otherwise use default
OMADEB_REPO="${OMADEB_REPO:-omakasui/omadeb}"

# Use custom brand if specified, otherwise use default
OMADEB_BRAND="${OMADEB_BRAND:-Omadeb}"

echo -e "\nCloning $OMADEB_BRAND from: https://github.com/${OMADEB_REPO}.git"
rm -rf ~/.local/share/omadeb
git clone https://github.com/$OMADEB_REPO.git ~/.local/share/omadeb >/dev/null

# Use custom branch if instructed, otherwise default to main
OMADEB_REF="${OMADEB_REF:-main}"
echo -e "\e[32mUsing branch: $OMADEB_REF\e[0m"
cd ~/.local/share/omadeb
git fetch origin "${OMADEB_REF}" && git checkout "${OMADEB_REF}"
cd -

# Set channel based on branch (dev branch uses dev channel, everything else uses stable)
if [[ $OMADEB_REF == "dev" ]]; then
  export OMADEB_CHANNEL=dev
else
  export OMADEB_CHANNEL=stable
fi

echo -e "\nInstallation starting..."
source ~/.local/share/omadeb/install.sh
