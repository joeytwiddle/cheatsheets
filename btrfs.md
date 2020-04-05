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

# Balancing

A good explanation of [why balancing is needed](https://unix.stackexchange.com/a/378056/33967).

When balancing it's important to use filters to limit the amount of work that is does, otherwise the balance might do more work than necessary, take ages to run, and tempt you to cancel it, which is not advisable!

Using `dlimit` and `mlimit` will limit the number of blocks that will be rebalanced on one pass.

So you can safely run [this command](https://unix.stackexchange.com/a/409572/33967) regularly (daily, weekly or monthly, depending on how much churn you put your disk through):

```bash
df -h /
sudo btrfs filesystem show
sudo btrfs filesystem df /
sudo btrfs balance start -dusage=50 -dlimit=2 -musage=50 -mlimit=4 /
```

(If you are desperate to recover some disk space, you may try increasing dusage and musage, and the limits.)

Another way to avoid rebalancing everything in one long run, is to start with `-dusage=10` and grow it by 10 each time you run it, until you are satisfied than enough blocks have been balanced.
