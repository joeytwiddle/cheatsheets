# === Home ===

rm -rfv ~/.local/share/Trash/*

#rm -rfv ~/.cache/pacaur/*

"$HOME"/.local/share/ktorrent/delete-old-dnd-files.sh

# Not so much volume, but lots of tiny files accumulated here
cd ~/.config/session
./remove_old_files.sh
cd -

# === Root ===

rm -rf /var/cache/pacman/pkg/*
# or
sudo paccache -r -k 0

# Clear build files for uninstalled packages
sudo pamac clean -ub
# If desperate, clear build files for all packages.  Beware these may return on future updates.
#sudo pamac clean -b

rm -rf /var/lib/snapd/cache/*

# Docker images (which can always be re-fetched / re-built, unlike docker data volumes)
du -sh /var/lib/docker/overlay2
docker system prune --all --force
du -sh /var/lib/docker/overlay2

# Docker volumes (data)
echo
echo "Have docker images created some volumes you don't need?"
sudo du -sk /var/lib/docker/volumes/* | sort -n -k 1
echo

# See also: [clear_some_space_on_macos.sh](clear_some_space_on_macos.sh)
