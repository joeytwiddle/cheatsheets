### Search, install and uninstall

```bash
brew search [part_of_package_name]

brew install [package_name]
brew uninstall [package_name]
```

### Remove unused dependencies

```bash
brew autoremove
```

This will remove any orphaned dependencies after an uninstall.

### List files in package

```bash
brew list --verbose [package_name]
```

