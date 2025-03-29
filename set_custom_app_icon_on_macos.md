See: https://www.reddit.com/r/MacOS/comments/1fxwjqm/howto_change_macos_system_icons_works_on_sequoia/

- Open the *terminal*

- Make a new directory with the name of the app you want to change. I'll use the notes app for an example.

  ```
  mkdir ~/Applications/Notes.app
  ```

- Now that you have the fake app you need to link it to the real app.

  ```
  ln -s /System/Applications/Notes.app/Contents ~/Applications/Notes.app/
  ```

  I'm using `/System/Applications...` because that's where my Notes app is located, but if your app is located somewhere else use that pathname.

- Change the app Icon for the "new" application located in `~/Applications/` as you would for any other app, file, or folder:

  Right click it, Get Info, then paste/drag your icon into the old icon that should be in the top left.

Downsides of this method:

- You end up with two instances of the same application just with different icons. They still work functionally identically, but they have different icons.

- For a while, your app with the custom icon will be the second one offered by Spotlight, Alfred and Raycast, not the first, although if you keep choosing it, it may get moved to the top.

- If macOS restores your apps after restarting, it will likely load the official app, rather than your tweaked version. So after a restart, you may need to quit those apps, so you can start your tweaked versions.
