See also: Apparently this offers a customisable auto-setup: https://github.com/minamarkham/formation

Go to App Store and start downloading XCode first, because it is big.  XCode is needed for homebrew.

Open Safari, install Chrome, iTerm2 and homebrew.

In System Preferences:
- Under Trackpad -> Point & Click, enable "Tap to click".
- Under Trackpad -> More Gestures, disable "Swipe between pages" (the annoying thing that happens when you accidentally swipe with three fingers)
- Under Keyboard -> Keyboard, enable "Use F1, F2, ... as standard function keys"
- Under Keyboard -> Modifier Keys, set Caps Lock to perform Control.
- Under Keyboard -> Shortcuts, go to "App Shortcuts" and create a new binding with action "Zoom" and shortcut "Cmd-Shift-Equals".  (Actually that is what the web recommends, but if you want to fit with iTerm, put it on Cmd-Opt-Equals.)  See [step 3 here](http://osxdaily.com/2013/03/22/5-simple-window-management-keyboard-shortcuts-to-improve-workflow-in-mac-os-x/)

# Make Finder show hidden files

## New way

In Finder, hit `Cmd-Shift-.` to toggle hidden file display.  This appears to persist between reboots, so job done.

## Old way

In terminal, type:
```bash
defaults write com.apple.finder AppleShowAllFiles YES
```

To see it working immediately, find Finder in the Dock, hold Option, right-click it and select Relaunch.

# Install various useful software with Homebrew

```bash
brew install coreutils gnu-sed findutils
# findutils contains GNU xargs
brew install bash gnu-tar
brew install macvim
brew install tmux
# gnupg takes quite a long time (many dependencies)
brew install gnupg
```

Install iterm2 from: https://www.iterm2.com/

Install jsh and rc_files:
```bash
cd
git clone https://github.com/joeytwiddle/jsh j
git clone https://github.com/joeytwiddle/rc_files
j/jsh
linkhome
```

Install git-aware-prompt:
```bash
cd src
git clone https://github.com/joeytwiddle/git-aware-prompt
# That's it.  jsh should pick it up.
```

Install nvm and then yarn:
```bash
# Follow instructions here: https://github.com/creationix/nvm
# For example:
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

brew install --without-node yarn
```

MongoDB:
```bash
brew install mongodb
# Then as instructed by `brew info mongodb` you can start the service
brew services start mongodb
```

If you are planning to do Android development, you will need:
- Android Studio
- Java
- Gradle (`brew install gradle`)

Optional (but nice to have):
```bash
brew install dict ctags nmap ripgrep
brew install zsh zsh-completions zsh-syntax-highlighting
brew install youtube-dl
brew cask install gimp
# Big and slow to compile
brew install geeqie
brew cask install xquartz
brew cask install inkscape
brew install mplayer
```

# Desktop

To get Control when pressing CapsLock:
- Open System Preferences
- Open "Keyboard" and then click the "Modifier Keys..." button
- Change "Caps Lock" to "Control"

To get Escape when pressing Control (for OLD versions of Mac OS X, before Sierra):
- Install [Karabiner](https://pqrs.org/osx/karabiner/history.html)
- Open Preferences
- Search for "Control_L to Control_L (+ When you type Control_L only, send Escape)" and enable it
To avoid accidentally triggering <kbd>Escape</kbd> after pressing and releasing <kbd>Control</kbd>:
- Open Parameters tab
- Find "Key Overlaid Modifier > Timeout" and reduce it from 800 to 200.

To get Escape when pressing Control (from Sierra onwards):
- Install [Karabiner Elements](https://pqrs.org/osx/karabiner/)
- Open Karabiner Elements and configure your keyboard
- Visit this site and import the rule: https://pqrs.org/osx/karabiner/complex_modifications/#caps_lock
- Under "Complex Modifications" tab, click "Add Rule" and choose "Change caps_lock to control if pressed with other keys, to escape if pressed alone."
To avoid accidentally triggering <kbd>Escape</kbd> after pressing and releasing <kbd>Control</kbd>:
- Switch to the "Parameters" sub-tab and change `to_if_alone_timeout_milliseconds` from 1000 to 200

Install [Spectacle](https://www.spectacleapp.com/) to allow easy manipulation of windows.
- Maximize (gone):        <kbd>Ctrl-Opt-Cmd-M</kbd>
- Left half:              <kbd>Opt-Cmd-Left</kbd>
- Center:                 <kbd>Opt-Cmd-C</kbd>
- Make larger:            <kbd>Ctrl-Shift-Opt-Right</kbd>

Or alternatively try [ShiftIt](https://github.com/fikovnik/ShiftIt).
- Maximize:               <kbd>Ctrl-Opt-Cmd-M</kbd>
- Left:                   <kbd>Ctrl-Opt-Cmd-Left</kbd>
- Center:                 <kbd>Ctrl-Opt-Cmd-C</kbd>
- Increase:               <kbd>Ctrl-Opt-Cmd-=</kbd>

I changed the ShiftIt mappings to:
- Maximize:               <kbd>Opt-Z</kbd>
- Left:                   <kbd>Cmd-Opt-K</kbd>
- Center:                 <kbd>Cmd-Opt-L</kbd>
- Increase:               <kbd>Cmd-Opt-;</kbd>
- I also changed the size to Fixed 50x28

You might also like to take a look at [Moom](https://manytricks.com/moom/).
