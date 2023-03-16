## Automatically install types for installed modules

This asks a bunch of questions, but does the job

```
npx types-installer
```

This works well

```
npx install-types [--yarn]
```

This requires you to specify the package name.  It installs the package and the types.  Unlike the other two, it detects yarn automatically.

```
npx typac <package_name>
```

