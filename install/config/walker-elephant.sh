# Ensure Walker service is started automatically on boot
mkdir -p ~/.config/autostart/
cp $OMADEB_PATH/default/walker/walker.desktop ~/.config/autostart/

# And is restarted if it crashes or is killed
mkdir -p ~/.config/systemd/user/app-walker@autostart.service.d/
cp $OMADEB_PATH/default/walker/restart.conf ~/.config/systemd/user/app-walker@autostart.service.d/restart.conf

# Create apt hook to restart walker after updates
sudo mkdir -p /etc/apt/apt.conf.d
sudo tee /etc/apt/apt.conf.d/99restart-walker << EOF
DPkg::Post-Invoke {
    "if dpkg -l walker 2>/dev/null | grep -q '^ii'; then $OMADEB_PATH/bin/omadeb-restart-walker; fi";
};
EOF

# Link the visual theme menu config
mkdir -p ~/.config/elephant/menus
ln -snf $OMADEB_PATH/default/elephant/omadeb_themes.lua ~/.config/elephant/menus/omadeb_themes.lua
ln -snf $OMADEB_PATH/default/elephant/omadeb_background_selector.lua ~/.config/elephant/menus/omadeb_background_selector.lua
