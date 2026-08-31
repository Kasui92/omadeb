# Alt+F4 is very cumbersome
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>w']"

# Make it easy to maximize like you can fill left/right
gsettings set org.gnome.desktop.wm.keybindings maximize "['<Super>Up']"

# Make it easy to resize undecorated windows
gsettings set org.gnome.desktop.wm.keybindings begin-resize "['<Super>BackSpace']"

# For keyboards that only have a start/stop button for music, like Logitech MX Keys Mini
gsettings set org.gnome.settings-daemon.plugins.media-keys next "['<Shift>AudioPlay']"

# Full-screen with title/navigation bar
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Shift>F11']"

# Remove default app hotkeys, we set our own later
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys home "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys www "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys help "[]"

# Cancel input capture with Super+Shift+Escape
gsettings set org.gnome.mutter.keybindings cancel-input-capture "['<Super><Shift>Escape']"

# Open Tactile settings with Super+Control+T
gsettings set org.gnome.shell.extensions.tactile show-settings "['<Super><Control>t']"

# Use alt for pinned apps
gsettings set org.gnome.shell.keybindings switch-to-application-1 "['<Alt>1']"
gsettings set org.gnome.shell.keybindings switch-to-application-2 "['<Alt>2']"
gsettings set org.gnome.shell.keybindings switch-to-application-3 "['<Alt>3']"
gsettings set org.gnome.shell.keybindings switch-to-application-4 "['<Alt>4']"
gsettings set org.gnome.shell.keybindings switch-to-application-5 "['<Alt>5']"
gsettings set org.gnome.shell.keybindings switch-to-application-6 "['<Alt>6']"
gsettings set org.gnome.shell.keybindings switch-to-application-7 "['<Alt>7']"
gsettings set org.gnome.shell.keybindings switch-to-application-8 "['<Alt>8']"
gsettings set org.gnome.shell.keybindings switch-to-application-9 "['<Alt>9']"

# Use super for workspaces
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Super>5']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 "['<Super>6']"

# Reserve slots for input source switching
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Shift><Super>space']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Shift><Super><Alt>space']"

# Set some utility hotkeys
gsettings set org.gnome.mutter.wayland.keybindings restore-shortcuts "['<Shift><Super>Escape']"

# Empty the custom keybindings to start fresh
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "[]"

# Menus
omadeb-gnome-keybinding-add 'Launch apps' 'omadeb-menu-app' '<Super>space'
omadeb-gnome-keybinding-add 'Omadeb menu' 'omadeb-menu' '<Alt><Super>space'
omadeb-gnome-keybinding-add 'System menu' 'omadeb-menu system' '<Super>Escape'

# Aesthetics
omadeb-gnome-keybinding-add 'Theme menu' 'omadeb-menu theme' '<Super><Shift><Control>space'
omadeb-gnome-keybinding-add 'Background menu' 'omadeb-menu background' '<Super><Control>space'

# Toggles
omadeb-gnome-keybinding-add 'Nightlight toggle' 'omadeb-toggle-nightlight' '<Super><Control>n'

# Screenshots
omadeb-gnome-keybinding-add 'Flameshot' 'sh -c -- "flameshot gui"' '<Control>Print'

# File sharing
omadeb-gnome-keybinding-add 'Share menu' 'omadeb-menu share' '<Super><Control>s'

# Transcoding
omadeb-gnome-keybinding-add 'Transcode' 'omadeb-transcode' '<Super><Control>period'

# Reminders
omadeb-gnome-keybinding-add 'Set reminder' 'omadeb-menu reminder-set' '<Super><Control>r'
omadeb-gnome-keybinding-add 'Show reminders' 'omadeb-reminder show' '<Super><Control><Alt>r'
omadeb-gnome-keybinding-add 'Clear reminders' 'omadeb-reminder clear' '<Super><Shift><Control>r'

# Control panels
omadeb-gnome-keybinding-add 'Activity' 'omadeb-launch-tui btop' '<Super><Shift>t'

# Control Apple Display brightness
omadeb-gnome-keybinding-add 'Apple Brightness down' "omadeb-brightness-apple-display -5000" '<Control>F1'
omadeb-gnome-keybinding-add 'Apple Brightness up' "omadeb-brightness-apple-display +5000" '<Control>F2'
omadeb-gnome-keybinding-add 'Apple Brightness max' "omadeb-brightness-apple-display +60000" '<Control><Shift>F2'

# Application bindings
omadeb-gnome-keybinding-add 'Terminal' 'xdg-terminal-exec' '<Super>Return'
omadeb-gnome-keybinding-add 'Terminal' 'xdg-terminal-exec' '<Control><Alt>t'
omadeb-gnome-keybinding-add 'Tmux' 'xdg-terminal-exec bash -c "tmux attach || tmux new -s Work"' '<Super><Alt>Return'
omadeb-gnome-keybinding-add 'Browser' 'omadeb-launch-browser --new-window' '<Shift><Super>b'
omadeb-gnome-keybinding-add 'Browser' 'omadeb-launch-browser --new-window' '<Shift><Super>Return'
omadeb-gnome-keybinding-add 'Browser (private)' 'omadeb-launch-browser --private' '<Shift><Alt><Super>b'
omadeb-gnome-keybinding-add 'File manager' 'nautilus --new-window' '<Shift><Super>f'
omadeb-gnome-keybinding-add 'Docker' 'omadeb-launch-tui lazydocker' '<Super><Shift>d'
omadeb-gnome-keybinding-add 'Music' 'spotify' '<Super><Shift>m'
omadeb-gnome-keybinding-add 'Editor' 'omadeb-launch-editor' '<Super><Shift>n'

# Set webapps hotkeys
omadeb-gnome-keybinding-add 'ChatGPT' 'omadeb-launch-webapp "https://chatgpt.com" "ChatGPT"' '<Super><Shift>a'
omadeb-gnome-keybinding-add 'WhatsApp' 'omadeb-launch-webapp "WhatsApp" "https://web.whatsapp.com/" "WhatsApp"' '<Super><Shift><Alt>g'
omadeb-gnome-keybinding-add 'YouTube' 'omadeb-launch-webapp "https://youtube.com/" "YouTube"' '<Super><Shift>y'
omadeb-gnome-keybinding-add 'GitHub' 'omadeb-launch-webapp "https://github.com/" "GitHub"' '<Super><Shift>h'

# Enable Compose key on Caps Lock
gsettings set org.gnome.desktop.input-sources xkb-options "['compose:caps']"
