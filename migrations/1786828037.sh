echo "Refresh configs updated for the 1.4.1 alignment"

omadeb-refresh-config alacritty/alacritty.toml
omadeb-refresh-fastfetch
omadeb-refresh-tmux
omadeb-refresh-config imv/config
omadeb-refresh-config chromium-flags.conf

if omadeb-cmd-present obsidian; then
  omadeb-refresh-config obsidian/user-flags.conf
fi

echo "Copy hooks and extension examples"
mkdir -p ~/.config/omadeb
cp -r $OMADEB_PATH/config/omadeb/* ~/.config/omadeb/
