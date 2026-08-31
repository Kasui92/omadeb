# Copy over Omadeb configs
mkdir -p ~/.config
cp -R ~/.local/share/omadeb/config/* ~/.config/

# Configure the bash shell using Omadeb defaults
cp ~/.local/share/omadeb/default/bashrc ~/.bashrc