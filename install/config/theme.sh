# Setup user theme folder
if [[ -d ~/.config/omadeb/themes ]]; then
  rm -rf ~/.config/omadeb/themes
fi
mkdir -p ~/.config/omadeb/themes

# Set initial theme
omadeb-theme-set "Tokyo Night"

# Set specific app links for current theme
mkdir -p ~/.config/btop/themes
ln -snf ~/.config/omadeb/current/theme/btop.theme ~/.config/btop/themes/current.theme