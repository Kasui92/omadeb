# Must not be on a LVM partition
LVM_DETECTED=false
if [[ -f /etc/fstab ]]; then
  if grep -Pq '/dev/(mapper/|disk/by-id/dm)' /etc/fstab; then
    LVM_DETECTED=true
  fi
fi

# ==============================================================================
# PLYMOUTH SETUP
# ==============================================================================

apply_plymouth() {
  # Set theme only if different
  current_theme=$(plymouth-set-default-theme 2>/dev/null || echo "")
  if [ "$current_theme" != "omadeb" ]; then
      sudo cp -r "$HOME/.local/share/omadeb/default/plymouth" /usr/share/plymouth/themes/omadeb/ >/dev/null 2>&1

      if sudo plymouth-set-default-theme omadeb >/dev/null 2>&1; then
          # Update initramfs after setting theme
          sudo update-initramfs -u >/dev/null 2>&1
      fi
  fi

  if [ ! -f /etc/systemd/system/plymouth-quit.service.d/wait-for-graphical.conf ]; then
    # Make plymouth remain until graphical.target
    sudo mkdir -p /etc/systemd/system/plymouth-quit.service.d
    sudo tee /etc/systemd/system/plymouth-quit.service.d/wait-for-graphical.conf <<'EOF'
[Unit]
After=multi-user.target
EOF
  fi

  # Mask plymouth-quit-wait.service only if not already masked
  if ! systemctl is-enabled plymouth-quit-wait.service | grep -q masked; then
    sudo systemctl mask plymouth-quit-wait.service
    sudo systemctl daemon-reload
  fi

  # Final initramfs update to ensure all Plymouth changes are applied
  sudo update-initramfs -u
}

if [[ $LVM_DETECTED == true ]]; then
  echo "Warning: LVM partition detected. Plymouth may not work properly with encrypted LVM setups. Skipping Plymouth installation."
else
  apply_plymouth
fi