abort() {
  echo -e "\e[$OMADEB_BRAND install requires: $1\e[0m"
  echo
  gum confirm "Proceed anyway on your own accord and without assistance?" || exit 1
}

# Must be a valid OS
[[ -f /etc/os-release ]] || abort "/etc/os-release"

. /etc/os-release

# Check if running on Debian 13+
[[ $ID != "debian" ]] && abort "Debian 13 or higher"
[[ $(echo "$VERSION_ID >= 13" | bc) != "1" ]] && abort "Debian 13 or higher"

# Must be x86 only to fully work
ARCH=$(uname -m)
if [[ $ARCH != "x86_64" ]] && [[ $ARCH != "i686" ]]; then
  abort "x86_64 CPU"
fi

# Must have GNOME as desktop environment
# (other DEs may work but are not officially supported)
if [[ $XDG_CURRENT_DESKTOP != "GNOME" ]]; then
  abort "GNOME desktop environment"
fi

# Cleared all guards
echo "Guards: OK"
