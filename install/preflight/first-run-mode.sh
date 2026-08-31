# Set first-run mode marker so we can install stuff post-installation
mkdir -p ~/.local/state/omadeb
touch ~/.local/state/omadeb/first-run.mode

# Register systemd user service to auto-run first-run script on next login
mkdir -p ~/.config/systemd/user
cat > ~/.config/systemd/user/omadeb-first-run.service <<EOF
[Unit]
Description=Omadeb first-run setup
After=default.target

[Service]
Type=oneshot
Environment=DISPLAY=:0
Environment=DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/%U/bus
ExecStart=/bin/bash $OMADEB_PATH/bin/omadeb-first-run
ExecStartPost=systemctl --user disable omadeb-first-run.service
RemainAfterExit=no

[Install]
WantedBy=default.target
EOF

systemctl --user daemon-reload
systemctl --user enable omadeb-first-run.service

# Setup sudo-less access for first-run
sudo tee /etc/sudoers.d/first-run >/dev/null <<EOF
Defaults:$USER !use_pty
Cmnd_Alias FIRST_RUN_CLEANUP = /usr/bin/rm -f /etc/sudoers.d/first-run
$USER ALL=(ALL) NOPASSWD: /usr/bin/systemctl *
$USER ALL=(ALL) NOPASSWD: /usr/bin/ufw *
$USER ALL=(ALL) NOPASSWD: /usr/sbin/ufw *
$USER ALL=(ALL) NOPASSWD: /usr/local/bin/ufw-docker *
$USER ALL=(ALL) NOPASSWD: FIRST_RUN_CLEANUP
EOF
sudo chmod 440 /etc/sudoers.d/first-run
