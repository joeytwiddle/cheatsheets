# Installing

Install package: `pacman -S <package_name>`

Install package and also sync package databases: `pacman -Sy <package_name>`

# Updating

Update lists: `pacman -Sy`

Although the wiki recommends:

> Avoid using `pacman -Sy` or `pacman -Syy`.  Instead update your database and packages at the same time with `pacman -Syu` or `pacman -Syyu`

(Unlike Debian, it would appear that when we install a package with pacman, it checks that the dependencies are installed, but it does not check for the correct versions of those dependencies.  It rather assumes that the latest version is installed.)

#

Remove a package: `pacman -R <package_name>` (the package_name should **not** include the namespace)

For faster installs we can use powerpill, which downloads files in parallel.

Search local packages: `pacman -Q <package_name>`
Search local package names or descriptions: `pacman -Qs <partial_text>`

Search for available packages by name or description: `pacman -Ss <partial_text> | more`

Find the package which owns a file: `pacman -Qo <file>`

List files in package: `pacman -Ql <package_name>`

List dependencies of an installed package: `pacman -Qi <package_name> | sed -n '/Depends\ On/,/:/p' | sed '$d' | cut -d: -f2`

List dependencies of a remote package: `pacman -Si <package_name> | sed -n '/Depends\ On/,/:/p' | sed '$d' | cut -d: -f2`

List dependencies of an installed package using pactree: `pactree -u <package_name>`

List reverse dependencies of an installed package using pactree: `pactree -r <package_name>`

List dependencies of an installed package using expac: `expac -S '%r/%n: %D' <package_name>`

Upgrade everything (not really recommended to do this too often): `pacman -Su`

If you just want to check to see what updates are available use the command `checkupdates`.  It provides a safe way to check for upgrades to installed packages without running a system update at the same time.


# Community packages

For packages from the wider community, we need to connect to AUR.  There are multiple ways to do this.

- Install `pacaur`

  It looks like pacman but:
  - It pulls packages from the community repositories.
  - It does not work when run as root.  Use it as a normal user, and it will call sudo when necessary.
  - It requires slightly less interaction: `n` instead of `n<Enter>`


# Clean cache

Safe: This will remove archived packages, all except the last 3 versions.

```sh
du -sh /var/cache/pacman/pkg
sudo paccache -r
```

Medium: This will clear all except currently installed versions.

```sh
sudo pacman -Sc
```

Heavy: Remove all cached packages.

```sh
sudo pacman -Scc
```

You could also automate the cleaning some pacman hooks: https://www.ostechnix.com/recommended-way-clean-package-cache-arch-linux/

## My update process

### Clear caches

```sh
# Clear out some old data from the pacman cache (but keep the last 3 versions of each package)
du -sh /var/cache/pacman/pkg
sudo paccache -r
du -sh /var/cache/pacman/pkg
# (I'm not sure how much I need the old versions, given that I tend to snapshot the entire volume)

# If you are using pacaur, this will remove everything from the pacman and pacaur caches, except for the currently installed packages
# That's fine if you are happy with your current set, but if you want to keep the last 3 from the pacman cache as above, then you should hit n/y here, to act only on the AUR cache
# Implemented here: https://github.com/rmarquis/pacaur/issues/559#issuecomment-250909385
du -sh ~/.cache/pacaur
pacaur -Sc
du -sh ~/.cache/pacaur
```

### Make a snapshot

```sh
make-snapshot-of-root
make-snapshot-of-home
```

### Perform recommended manjaro upgrade process

```sh
sudo pacman -Sy
sudo pacman -S archlinux-keyring
sudo pacman -Su
```

### Do the same upgrade but with pacaur

Note that this can take some time and some disk space, because some of these packages are compiled from source.

```sh
pacaur -Su
```

### Reboot

```sh
sudo update-grub
sudo grub-install

# Test if you like
# Press 'c' then type 'exit' to quit
sudo grub-emu
```

# See also

- https://wiki.manjaro.org/index.php?title=System_Maintenance
