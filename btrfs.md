# List snapshots

```bash
btrfs subvolume list /mnt/newhome
```

# Delete a snapshot

```bash
sudo btrfs subvolume delete <path_to_snapshot>
```

# Make an existing snapshot writable

```bash
btrfs property set -ts /path/to/snapshot ro false
```

# Make an existing snapshot read-only

```bash
btrfs property set -ts /path/to/snapshot ro true
```

# Generate a patch between two snapshots

```bash
btrfs send -c <earlier_snapshot> <newer_snapshot>
```

# Compare two snapshots

```bash
sudo python /home/joey/bin/btrfs-snapshots-diff.py -p @home-20181110-2053 -c @home-20181110-2057
```

# Delete a file/folder from every snapshot

Make every snapshot readable, delete the file, make each snapshot read-only again.  https://superuser.com/questions/863588/how-to-delete-a-file-in-all-snapshots-on-a-btrfs-system

# Roll back to an earlier snapshot

```bash
cd /media/btrfs
# Move the current filesystem out of the way
mv @home @home.old
# Create a new snapshot based off the one we want to roll back to.
btrfs sub snap snapshots/@home-20170105 @home
# Or if you don't want to duplicate the old snapshot, you could simply
#mv snapshots/@home-20170105 @home
# Ensure the working snapshot is writable
btrfs property set -ts /path/to/snapshot ro false
# Remount
mount -o remount /home
```

You can do the same with `/` except for the final remount.  You must reboot instead!

