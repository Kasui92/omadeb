# Use Wayland by default
sudo sed -i 's/^#WaylandEnable=false/WaylandEnable=true/' /etc/gdm3/custom.conf

# Enable GDM3 service
sudo systemctl enable gdm3

# ==============================================================================
# GDM OMADEB LOGO SETUP
# ==============================================================================

# Get the directory where this script is located
OMADEB_GDM_LOGO="$HOME/.local/share/omadeb/default/gdm/logo.png"
OMADEB_GDM_BACKGROUND="$HOME/.local/share/omadeb/default/gdm/background.png"

# Copy Omadeb logo and background to system directory
sudo mkdir -p /usr/share/pixmaps/omadeb/
if [[ -f $OMADEB_GDM_LOGO ]]; then
  sudo cp "$OMADEB_GDM_LOGO" /usr/share/pixmaps/omadeb/gdm-logo.png
fi
if [[ -f $OMADEB_GDM_BACKGROUND ]]; then
  sudo cp "$OMADEB_GDM_BACKGROUND" /usr/share/pixmaps/omadeb/gdm-background.png
fi

# Copy Omadeb GDM greeter configuration
OMADEB_GDM_CONFIG="$HOME/.local/share/omadeb/default/gdm/greeter.dconf-defaults"
if [[ -f $OMADEB_GDM_CONFIG ]]; then
  sudo cp "$OMADEB_GDM_CONFIG" /etc/gdm3/greeter.dconf-defaults
  echo "GDM configuration applied successfully"
else
  echo "Warning: GDM configuration file not found"
fi

# Update dconf database
sudo dconf update
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/