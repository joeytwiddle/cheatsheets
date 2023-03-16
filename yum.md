## Uninstall a package

You can remove a single packge with:

```
# NOT RECOMMENDED
yum remove <package_name>
```

However that won't remove any dependencies that were fetched to satisfy the package.

To remove dependencies as well, you can instead:

```
# Find the transaction where the package was installed
yum history

# Undo that transaction, to remove the package and all its dependencies
yum history undo <transaction_id>
```

