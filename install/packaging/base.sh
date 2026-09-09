# Install all base packages
mapfile -t packages < <(grep -v '^#' "$OMADEB_PATH/install/omadeb-base.packages" | grep -v '^$')
omadeb-pkg-add "${packages[@]}"
