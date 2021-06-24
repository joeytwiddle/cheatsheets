## List updates available for snap packages

```bash
snap refresh --list
```

## Update snap packages

```bash
snap refresh
```

## List all versions available for a package

```bash
snap info <snap_package_name>
```

## List all installed versions of a package

```bash
snap list --all <snap_package_name>
```

## Search for snap packages

```bash
snap find "media player"
```

## Use an earlier version of a snap

```bash
snap revert <snap_package_name>
```

For example, I reverted VSCode, because the latest version kept crashing on me.  Doing that disabled version 39.

```
code   17299e41   38    latest/stable  vscode✓     classic
code   91899dce   39    latest/stable  vscode✓     disabled,classic
```

But version 38 crashed a lot too.
