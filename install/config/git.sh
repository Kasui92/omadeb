# Set identification from install inputs
if [[ -n ${OMADEB_USER_NAME//[[:space:]]/} ]]; then
  git config --global user.name "$OMADEB_USER_NAME"
fi

if [[ -n ${OMADEB_USER_EMAIL//[[:space:]]/} ]]; then
  git config --global user.email "$OMADEB_USER_EMAIL"
fi
