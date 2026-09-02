if [[ ! -f /etc/apt/sources.list.d/docker.sources ]]; then
    [[ -f /etc/apt/keyrings/docker.asc ]] && sudo rm /etc/apt/keyrings/docker.asc
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF
fi

sudo apt-get update

# Remove any conflicting packages that may interfere with Docker installation
omadeb-pkg-drop docker.io docker-compose docker-doc docker-buildx podman-docker containerd runc
# Install Docker packages
omadeb-pkg-add docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras