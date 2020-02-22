# Installing

Install package: `pacman -S <package_name>`

Install package and also sync package databases: `pacman -Sy <package_name>`

# Updating

Update lists: `pacman -Sy`

Although the wiki recommends:

> Avoid using `pacman -Sy` or `pacman -Syy`.  Instead update your database and packages at the same time with `pacman -Syu` or `pacman -Syyu`

(Unlike Debian, it would appear that when we install a package with pacman, it checks that the dependencies are installed, but it does not check for the correct versions of those dependencies.  It rather assumes that the latest version is installed.)

#

Remove a package: `pacman -R`

For faster installs we can use powerpill, which downloads files in parallel.

Search local packages: `pacman -Q <pkg_name>`
Search local package names or descriptions: `pacman -Qs <partial_text>`

Search for available packages by name or description: `pacman -Ss <partial_text> | more`

Find the package which owns a file: `pacman -Qo <file>`

To remove a package: `pacman -R <pkg_name>` (the pkg_name should **not** include the namespace)

List files in package: `pacman -Ql <package_name>`

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

```
du -sh /var/cache/pacman/pkg
sudo paccache -r
```

Medium: This will clear all except currently installed versions.

```
sudo pacman -Sc
```

Heavy: Remove all cached packages.

```
sudo pacman -Scc
```

You could also automate the cleaning some pacman hooks: https://www.ostechnix.com/recommended-way-clean-package-cache-arch-linux/


[1] https://wiki.manjaro.org/index.php?title=System_Maintenance