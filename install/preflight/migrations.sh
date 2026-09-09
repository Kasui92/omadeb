omadeb_migrations_state_path=~/.local/state/omadeb/migrations
mkdir -p $omadeb_migrations_state_path

for file in ~/.local/share/omadeb/migrations/*.sh; do
  touch "$omadeb_migrations_state_path/$(basename "$file")"
done
