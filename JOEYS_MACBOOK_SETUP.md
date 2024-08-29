See also: Apparently this offers a customisable auto-setup: https://github.com/minamarkham/formation

Go to App Store and start downloading XCode first, because it is big.  XCode is needed for homebrew.

Open Safari, install Chrome, iTerm2 and homebrew.

In System Preferences:
- Under Trackpad -> Point & Click, enable "Tap to click".
- Under Trackpad -> More Gestures, disable "Swipe between pages" (the annoying thing that happens when you accidentally swipe with three fingers)
- Under Keyboard, set "Key repeat rate" and "Delay until repeat" to far right (fastest) settings.
- Under Keyboard -> Keyboard Shortcuts -> Function Keys, enable "Use F1, F2, ... as standard function keys"
- Under Keyboard -> Keyboard Shortcuts -> Modifier Keys, set Caps Lock to perform Control.
- Under Keyboard -> Keyboard Shortcuts -> Modifier Keys, set Globe to perform Control.
- Under Keyboard -> Keyboard Shortcuts -> Modifier Keys, set Control to perform Globe.
- Under Keyboard -> Keyboard Shortcuts -> App Shortcuts, create a new binding with action (Menu Title) "Zoom" and shortcut "Cmd-Shift-Equals".  (Actually that is what the web recommends, but if you want to fit with iTerm, put it on Cmd-Opt-Equals.)  See [step 3 here](http://osxdaily.com/2013/03/22/5-simple-window-management-keyboard-shortcuts-to-improve-workflow-in-mac-os-x/)  I wanted to map this to `Opt-Z` to match my Linux, but for some reason that binding would not respond.

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
brew install fzf ripgrep bat tmux
# Surprisingly light
brew install docker docker-compose
# gnupg takes quite a long time (many dependencies)
brew install gnupg
```

If you want colours to work in ls, you can either:

- Add `/opt/homebrew/Cellar/coreutils/9.4/libexec/gnubin` to `$PATH`, or
- `sudo ln -s /opt/homebrew/Cellar/coreutils/9.4/libexec/gnubin/{ls,dircolors} /usr/local/bin/` and then `rehash`

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
brew cask install imagemagick # many dependencies
brew install mplayer
```

### VSCode

```bash
cd ~/Library/"Application Support"
ln -s ~/rc_files/.config/Code .

cd Code
./install_extensions_from_list.sh
```

To get `code` on your PATH, in VSCode run command "Shell Command: Install 'code' command in PATH"

When I press and hold `k` in VSCode, something pops up and stops it from repeating.  (Others have the issue when holding `k`.)  To [fix this](https://stackoverflow.com/a/44010683):

```bash
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
# then restart VSCode
```

# Desktop

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

Your Fn and Control keys may be swapped, compared to PC keyboards.  You can swap them back, using:

- Not recommended (causes incompatibilities elsewhere): Keyboard > Keyboard Shortcuts > Modifier Keys

- Recommended: [Do it](https://apple.stackexchange.com/a/313244/159962) in Karabiner Elements

  - Under Karabiner Elements > Simple Modifications > For all devices, set:

    - fn -> left_control
    - left_control -> fn

    - grave_accent_and_tilde -> backslash (I find this useful for UK keyboard layout, where that button is unused)

- If you did not do the above, then you may like to do this: To get PageUp/PageDown when pressing Fn-Up/Down, install the ["FN + Arrow Keys" rule](https://ke-complex-modifications.pqrs.org/#fn_arrows) for Karabiner Elements.

- To get arrow keys when pressing Opt-H/J/K/L, install the ["Map Left Option plus h/j/k/l to Arrows" rule]() for Karabiner Elements.

  However, if you have already swapped Fn and Ctrl, then this may apply to the wrong key.

- Alternatively, try ["left_option twice toggle to get into vim-like hjkl arrows in specified apps"](https://ke-complex-modifications.pqrs.org/#toggle_vim)

(OLD) Install [Spectacle](https://www.spectacleapp.com/) to allow easy manipulation of windows.
- Maximize (gone):        <kbd>Ctrl-Opt-Cmd-M</kbd>
- Left half:              <kbd>Opt-Cmd-Left</kbd>
- Center:                 <kbd>Opt-Cmd-C</kbd>
- Make larger:            <kbd>Ctrl-Shift-Opt-Right</kbd>

(OLD) Install [ShiftIt](https://github.com/fikovnik/ShiftIt) to get:
- Maximize:               <kbd>Ctrl-Opt-Cmd-M</kbd>
- Left:                   <kbd>Ctrl-Opt-Cmd-Left</kbd>
- Center:                 <kbd>Ctrl-Opt-Cmd-C</kbd>
- Increase:               <kbd>Ctrl-Opt-Cmd-=</kbd>
But I changed the ShiftIt mappings to:
- Maximize:               <kbd>Opt-Z</kbd>
- Left:                   <kbd>Cmd-Opt-K</kbd>
- Center:                 <kbd>Cmd-Opt-L</kbd>
- Increase:               <kbd>Cmd-Opt-;</kbd>
- I also changed the size to Fixed 50x28

You might also like to take a look at [Moom](https://manytricks.com/moom/).

Another is [MAGNET](https://magnet.crowdcafe.com/).

Install [Hammerspoon](https://www.hammerspoon.org/) and configure it with [ShiftIt Spoon](https://github.com/peterklijn/hammerspoon-shiftit).

## Dealing with a UK keyboard layout

If you have a MacBook with a UK layout, but are accustomed to keys in a US layout, then you may like to reconfigure some keys.

Convert Alt-§ into Alt-backtick using [these instructions](https://apple.stackexchange.com/a/401673/159962).

Swap `£` and `#` using the "Exchange £ and #" rule from [here](https://ke-complex-modifications.pqrs.org/?q=british).

Since we are now not using the grave/tilde button in the bottom-left of the keyboard, we can repurpose it to backslash and pipe: To do that, under Karabiner Elements > Simple Modifications > For all devices, set:

- grave_accent_and_tilde -> backslash (I find this useful for UK keyboard layout, where that button is unused)

## Fonts

Grab Hasklug Nerd Font Complete from Joey's Dropbox.  (Can also grab Lucida Console and Lucida TypeWriter if you like.)

- https://www.dropbox.com/home/fonts/custom_nerdfonts
- https://www.dropbox.com/home/fonts/FOR_MAC

After downloading, drag and drop these into the FontBook application.

## Settings for iTerm2

- Appearance > General > Tab bar location: Bottom

- Appearance > Tabs > Show tab bar even when there is only one tab: 

- Profile > Colors > Color Presets > Import > Jargo (Joey's Argonaut)

- Turn off General > Window > Adjust window when changing font size

- Profiles > Terminal > Scrollback lines: 10,000

Restore favourite profile and colours from:

- https://www.dropbox.com/home/preferences/iterm_profiles
- https://www.dropbox.com/home/preferences/iterm_colors

## Screen zoom

Go to System Settings > Accessibility > Zoom and set "Use scroll guesture with modifier key"

I set the `Option` key plus scroll to zoom in and out of the desktop.

