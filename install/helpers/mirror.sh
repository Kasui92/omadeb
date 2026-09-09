# Ensure we have curl available
if ! command -v curl &> /dev/null; then
  omadeb-pkg-add curl
fi

# Some Debian installation methods have a broken APT configuration that prevents from installing packages.
# This script checks for that and tries to fix it by creating a new APT sources file in /etc/apt/sources.list.d/ with the correct Debian repositories.

if [ -f /etc/apt/sources.list.d/debian.sources ] || [ -f /etc/apt/sources.list.d/proxmox.sources ]; then
  echo "Found an APT sources file in /etc/apt/sources.list.d/"
else
  SOURCESLIST=/etc/apt/sources.list

  if ! grep -q "debian.org" $SOURCESLIST >/dev/null 2>&1; then

    echo "$SOURCESLIST does not have any debian.org references."
    if [ -f $SOURCESLIST ]; then
      echo "Renaming $SOURCESLIST to $SOURCESLIST.orig"
      sudo mv $SOURCESLIST $SOURCESLIST.orig
    fi

    DEBIANSOURCES=/etc/apt/sources.list.d/debian.sources
    if [ ! -f $DEBIANSOURCES ]; then
      echo "Creating $DEBIANSOURCES and adding the following:"
      cat <<EOF | sudo tee -a $DEBIANSOURCES
Types: deb
URIs: https://deb.debian.org/debian
Suites: trixie trixie-updates
Components: main non-free-firmware
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg

Types: deb
URIs: https://security.debian.org/debian-security
Suites: trixie-security
Components: main non-free-firmware
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
EOF
    fi
  fi
fi

# Add Omakasui APT repositories
curl -fsSL https://keyrings.omakasui.org/omakasui-core.gpg.key \
  | gpg --dearmor \
  | sudo tee /usr/share/keyrings/omakasui-core.gpg > /dev/null

curl -fsSL https://keyrings.omakasui.org/omakasui-packages.gpg.key \
  | gpg --dearmor \
  | sudo tee /usr/share/keyrings/omakasui-packages.gpg > /dev/null

codename=$(. /etc/os-release && echo "$VERSION_CODENAME")

if [[ ${OMADEB_CHANNEL:-stable} == "dev" ]]; then
  suite="${codename}-dev"
else
  suite="$codename"
fi

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/omakasui-core.gpg] \
  https://core.omakasui.org $suite main" \
  | sudo tee /etc/apt/sources.list.d/omakasui-core.list

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/omakasui-packages.gpg] \
  https://packages.omakasui.org $suite main" \
  | sudo tee /etc/apt/sources.list.d/omakasui.list

sudo apt-get update