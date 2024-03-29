# Home

rm -rfv ~/.local/share/Trash/*

rm -rfv ~/.cache/pacaur/*

"$HOME"/.local/share/ktorrent/delete-old-dnd-files.sh

# Not so much volume, but lots of tiny files accumulated here
cd ~/.config/session
./remove_old_files.sh
cd -

# Root

rm -rf /var/cache/pacman/pkg/*

rm -rf /var/lib/snapd/cache/*

echo
echo "Have docker images created some volumes you don't need?"
sudo du -sk /var/lib/docker/volumes/* | sort -n -k 1
echo

# See also: [clear_some_space_on_macos.sh](clear_some_space_on_macos.sh)
