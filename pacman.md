Install package: `pacman -S <package_name>`

Install package without prompting: `pacman -Sy <package_name>`

Although the wiki recommends:

> Avoid using `pacman -Sy` or `pacman -Syy`.  Instead update your database and packages at the same time with `pacman -Syu` or `pacman -Syyu`

Update lists: `pacman -Sy`

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



[1] https://wiki.manjaro.org/index.php?title=System_Maintenance
