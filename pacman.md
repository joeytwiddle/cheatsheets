# Installing

Search for available packages by name or description: `pacman -Ss <partial_text> | more`

Install package: `pacman -S <package_name>`

Install package and also sync package databases (not recommended): `pacman -Sy <package_name>`

Build (and install with `-i`) your own package from a `PKGBUILD` file: `makepkg -si` (`-s` syncs dependencies)

# Updating

Update lists: `pacman -Sy`

Although the wiki recommends:

> Avoid using `pacman -Sy` or `pacman -Syy`.  Instead update your database and packages at the same time with `pacman -Syu` or `pacman -Syyu`

(Unlike Debian, it would appear that when we install a package with pacman, it checks that the dependencies are installed, but it does not check for the correct versions of those dependencies.  It rather assumes that the latest version is installed.)

#

Remove a package (and dependencies): `pacman -Rcnsu <package_name>` (the package_name should **not** include the namespace) (Adding `-u` or doing just `-Rus` might be safer.) (I believe `-n` removes config and backup files, suitable if you don't intend to reinstall the package again in future, but not suitable if they might contain some useful configuration.)
Remove a package (leaving dependencies installed): `pacman -R <package_name>`

For faster installs we can use powerpill, which downloads files in parallel.

Search local packages: `pacman -Q <package_name>`
Search local package names or descriptions: `pacman -Qs <partial_text>`

See full description of a package: `pacman -Qi <package_name>`

Find the package which owns a file: `pacman -Qo <file>` ("query owner")

List installed packages: `pacman -Qn`

OK but this is crazy, trying but failing to find vscode:

```
$ pacaur -Q code
visual-studio-code-bin 1.54.2-1
$ pacaur -Q visual
error: package 'visual' was not found
$ pacaur -Qn | egrep '(code|visual)'
... no visual-studio-code-bin ...
$ pacaur -Qs vscode
local/visual-studio-code-bin 1.54.2-1
    Visual Studio Code (vscode): Editor for building and debugging modern web and cloud applications (official binary version)
```

List packages which could be upgraded: `pacman -Sy && pacman -Qu` (note that this updates lists, so you should do a full upgrade before installing individual packages, or risk them not working)

List files in package: `pacman -Ql <package_name>`

List dependencies of an installed package: `pacman -Qi <package_name> | sed -n '/Depends\ On/,/:/p' | sed '$d' | cut -d: -f2`

List dependencies of a remote package: `pacman -Si <package_name> | sed -n '/Depends\ On/,/:/p' | sed '$d' | cut -d: -f2`

List dependencies of an installed package using pactree: `pactree -u <package_name>`

List reverse dependencies (why installed) of an installed package using pactree: `pactree -r <package_name>`

List dependencies of an installed package using expac: `expac -S '%r/%n: %D' <package_name>`

Upgrade everything (not really recommended to do this too often): `pacman -Su`

If you just want to check to see what updates are available use the command `checkupdates`.  It provides a safe way to check for upgrades to installed packages without running a system update at the same time.

List packages by size:

```bash
LANG=C pacman -Qi | sed -n '/^Name[^:]*: \(.*\)/{s//\1 /;x};/^Installed[^:]*: \(.*\)/{s//\1/;H;x;s/\n//;p}' | sort -n -k 2 | grep MiB
# or better
LC_ALL=C pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -h
```

See also: https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks

And: https://wiki.archlinux.org/index.php/System_maintenance#Clean_the_filesystem

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

This is now implemented in the script `~/bin/update-manjaro`

### Clear caches

We clear caches before making a snapshot.

```sh
# Clear out some old data from the pacman cache (but keep the last 3 versions of each package)
du -sh /var/cache/pacman/pkg
sudo paccache -r -k 2
du -sh /var/cache/pacman/pkg
# (I'm not sure how much I need the old versions, given that I tend to snapshot the entire volume)

# NOTE: If you are using pacaur, this will remove everything from the pacman and pacaur caches, except for the currently installed packages
# That's fine if you are happy with your current set, but if you want to keep the last 3 from the pacman cache as above, then you should answer NO to the first two questions, to act only on the AUR cache
# Implemented here: https://github.com/rmarquis/pacaur/issues/559#issuecomment-250909385
du -sh ~/.cache/pacaur
pacaur -Sc
du -sh ~/.cache/pacaur
```

### Snapshot your system, in case something goes wrong

```sh
make-snapshot-of-root
make-snapshot-of-home
```

### Remove lockfile, if present

If you see the error "unable to lock database" this can usually be solved with:

```sh
rm /var/lib/pacman/db.lck
```

### Perform recommended manjaro upgrade process

```sh
# DO NOT USE THIS.  Use pacaur below instead!
sudo pacman -Sy &&
sudo pacman -S archlinux-keyring &&
sudo pacman -Su
```

### Do the same, but use pacaur instead

Note that this can take some time and some disk space, because some of these AUR packages are compiled from source.

```sh
pacaur -Syu
# Experimenting:
pacaur -Syu 2>&1 | tee ~/logs/"pacaur_update.$(geekdate -fine).log"
```

### Reboot

```sh
sudo update-grub
sudo grub-install

# Test if you like
# Press 'c' then type 'exit' to quit
sudo grub-emu
```

### Remove orphaned packages

List orphaned packages: `pacman -Qtd`

# See also

- https://wiki.manjaro.org/index.php?title=System_Maintenance

# Kernels on Manjaro

List installed kernels:

```sh
mhwd-kernel -li
```

Do the following to install an extra kernel.  To remove the existing kernel, append the argument `rmc`.

```sh
mhwd-kernel -l
sudo mhwd-kernel -i linux49
sudo mhwd-kernel -i linux58
```

Usually the above will also install the kernel headers.  But if not, you can do that yourself:

```sh
pacman -S linux49-headers linux58-headers
```

You can remove old kernels with: `mhwd-kernel -r linux[version]`

# Note to self

I tried linux59 but it no longer accepts NVidia drivers, and at one point my X-windows display became so broken I had to reboot mid-session.

I knew this was an issue because it only installed three packages:

- linux59-5.9rc6.d0920.gba4f184-1
- linux59-bbswitch-0.8-0.6
- linux59-headers-5.9rc6.d0920.gba4f184-1

Whereas earlier kernels installed more packages

- linux58 5.8.11-1
- linux58-bbswitch 0.8-18 (linux58-extramodules)
- linux58-headers 5.8.11-1
- linux58-nvidia-430xx 430.64-18 (linux58-extramodules)
- linux58-virtualbox-host-modules 6.1.14-6 (linux58-extramodules)

However it seems linux510, linux519 and linux60 do have support for nvidia drivers.

- linux519-5.19.17-2
- linux519-headers-5.19.17-2
- linux519-nvidia-525.60.11-1

# Installing nvidia drivers

The easiest way is:

```sh
pacaur -S nvidia
```

and then select the driver for your current kernel (or a newer kernel if you want).  It will usually be a package like `linux60-nvidia` so you could just install that package directly.

