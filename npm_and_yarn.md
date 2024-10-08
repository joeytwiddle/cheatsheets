### What version of this package is installed?
```bash
npm ls <package_name>
yarn list <package_name>
```

### What versions of this package are available?
```bash
npm info <package_name> versions
yarn info <package_name> versions
```

### When were different versions of this package released?
```bash
npm view <package_name> time [--json]
```

### What are the dependencies of this package?
```bash
yarn info <package_name> dependencies
```

### Which packages depend on this package, aka why is this package installed, aka reverse deps?
```bash
npm ls <package_name>
yarn why <package_name>
```

### Which packages have vulnerabilities, and should be upgraded?
```bash
npm audit
yarn audit
```

### Upgrade packages selectively / interactively
```bash
npx npm-check -u
yarn upgrade-interactive
```

To ignore semver:
```bash
yarn upgrade-interactive --latest
```

### Installing different versions of node

[nvm](https://github.com/nvm-sh/nvm) is a popular solution.

[fnm](https://github.com/Schniz/fnm) is a modern alternative with similar goals.

### Clean cache (to reclaim disk space)
```bash
du -sh "$HOME"/.npm/_cacache
npm cache clean
du -sh "$(yarn cache dir)"
yarn cache clean
```

If you use `nvm` that also has a cache folder (although it seems to manage it quite well itself)
```bash
du -sh "$(nvm cache dir)"
du -sh "$NVM_DIR"/.cache
nvm cache clear
```

You can also remove some `node_modules` from old projects:
```bash
cd
# Largest first (quick)
npx npkill -s size
# Alphabetically (thorough)
npx npkill
```
Navigate with up/down keys, and press `<Space>` to remove the focused `node_modules` folder.
