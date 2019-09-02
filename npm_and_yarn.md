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
