See: https://code.visualstudio.com/api/working-with-extensions/publishing-extension

npm install -g @vscode/vsce

vsce package --no-yarn

cursor --install-extension ./XXX.vsix

Or use this little script:

```
# Usage: vsix bierner markdown-checkbox
vsix() {
    curl https://$1.gallery.vsassets.io/_apis/public/gallery/publisher/$1/extension/$2/latest/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage > /tmp/$1.$2.vsix &&
    cursor --install-extension /tmp/$1.$2.vsix &&
    rm /tmp/$1.$2.vsix
}
```
