# Set XCompose
if [[ -f ~/.XCompose ]]; then
  rm ~/.XCompose
fi

tee ~/.XCompose >/dev/null <<EOF
# Run omadeb-restart-xcompose to apply changes

# Include fast emoji access
include "%H/.local/share/omadeb/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$OMADEB_USER_NAME"
<Multi_key> <space> <e> : "$OMADEB_USER_EMAIL"
EOF

# Refresh XCompose
omadeb-restart-xcompose