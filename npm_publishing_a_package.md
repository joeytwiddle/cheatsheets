# Publishing a package to npm

- [ ] Remember to add any new files to `package.json`, or they won't be published with the package!

    ```bash
    vim package.json
    ```

- [ ] When updating the package (or just updating the README) you must bump the version before you publish.

    ```bash
    npm version patch

    # Consider also bumping the version number in other relevant files, e.g. plugin.xml for cordova plugins
    ```

- [ ] Test the package, and if all is well, do the actual publish.

    ```
    npm publish --dry-run

    npm publish
    ```

