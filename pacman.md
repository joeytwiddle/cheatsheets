Install package: `pacman -S [package_name]`

Install package without prompting: `pacman -Sy [package_name]`

Update lists: `pacman -Sy`

Upgrade everything (not really recommended): `pacman -Su`

For faster installs we can use powerpill, which downloads files in parallel.

Remove a package: `pacman -R`

Search local packages: `pacman -Q <pkg_name>`
Search local package names or descriptions: `pacman -Qs <partial_text>`

Search for available packages by name or description: `pacman -Ss <partial_text> | more`

Find the package which owns a file: `pacman -Qo <file>`

To remove a package: `pacman -R <pkg_name>` (the pkg_name should **not** include the namespace)


# Community packages

For packages from the wider community, we need to connect to AUR.  There are multiple ways to do this.

- Install `pacaur`

  It looks like pacman but:
  - It pulls packages from the community repositories.
  - It does not work when run as root.  Use it as a normal user, and it will call sudo when necessary.
  - It requires slightly less interaction: `n` instead of `n<Enter>`

