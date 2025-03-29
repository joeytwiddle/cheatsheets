See also: Apparently this offers a customisable auto-setup: https://github.com/minamarkham/formation

Go to App Store and start downloading XCode first, because it is big.  XCode is needed for homebrew.  (You might be able to install only the tools, but if you might later engage in development using XCode, then perhaps tidier just get the whole thing.)

Open Safari, install Chrome, iTerm2 and homebrew.

In System Preferences:
- Under Trackpad -> Point & Click, enable "Tap to click".
- Under Trackpad -> More Gestures, disable "Swipe between pages" (the annoying thing that happens when you accidentally swipe with three fingers)
- Under Accessibility -> Pointer Control -> Trackpad Options, set Dragging Style to "Without Drag Lock" ([docs](https://support.apple.com/en-gb/guide/mac-help/unac899/14.0/mac/14.0#:~:text=Without%20Drag%20Lock%3A%20Double%2Dtap,the%20edge%20of%20the%20trackpad))
- Under Keyboard, set "Key repeat rate" and "Delay until repeat" to far right (fastest) settings.
- Under Keyboard -> Keyboard Shortcuts -> Function Keys, disable "Use F1, F2, ... as standard function keys" (for easier access to media controls)
- Under Keyboard -> Keyboard Shortcuts -> Modifier Keys, set Caps Lock to perform Control.
- Under Keyboard -> Keyboard Shortcuts -> App Shortcuts, create a new binding with action (Menu Title) "Zoom" and shortcut "Ctrl-Cmd-Equals".
  (The web recommends Cmd-Shift-Equals, but Cmd-Opt-Equals fit with iTerm.  However, only Ctrl-Cmd-Equals works with VSCode.)
  See [step 3 here](http://osxdaily.com/2013/03/22/5-simple-window-management-keyboard-shortcuts-to-improve-workflow-in-mac-os-x/)
  I wanted to map this to `Opt-Z` to match my Linux, but for some reason that binding would not respond.
  Note: This (somewhat inconsistent) binding may no longer be needed.  Try Fn-Ctrl-C or F instead.

In case you choose to remap Ctrl-Left and Ctrl-Right in future, you can make desktop switching like Linux by doing:

- Under Keyboard -> Keyboard Shortcuts -> Mission Control -> Mission Control reconfigure move left a space and move right a space to Ctrl-Cmd-Left and Ctrl-Cmd-Right.

- If you also want to free up Ctrl-Up and Ctrl-Down, then disable "Application windows" and "Mission Control" here

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
# GNU less avoids some annoyances that macOS less exhibits when used through my |m alias
brew install less
brew install fzf ripgrep bat tmux
# Disables bluetooth when the Macbook goes to sleep (useful if you want to connect your headphones to something else!)
brew install bluesnooze
# gnupg takes quite a long time (many dependencies)
brew install gnupg
brew install --cask tigervnc-viewer
```

You will need to run bluesnooze once to set it up.  It will appear in the taskbar.

OLD: If you want colours to work in ls, you can either:

- Add `/opt/homebrew/Cellar/coreutils/9.4/libexec/gnubin` to `$PATH`, or
- `sudo ln -s /opt/homebrew/Cellar/coreutils/9.4/libexec/gnubin/{ls,dircolors} /usr/local/bin/` and then `rehash`

NEW: In fact I recommend adding all of the following to `~/.zprofile`:

  ```sh
  export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
  export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
  export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
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

To install Docker Desktop:
```bash
#brew install --cask docker
# Then open "Docker" from Spotlight (Cmd-Space) and log in

# Or for a more lightweight docker installation
brew install docker
brew install colima
# Although note that colima has to fetch many other packages, including python and qemu
# This didn't do much for me:
#sudo brew services start colima
# But this did the job
colima start
# However, when building you may see the error: "the --mount option requires BuildKit"
# To fix that:
brew install docker-buildx
# and follow the instructions to add cliPluginsExtraDirs to the docker config
# This didn't work for me, with or without swarm init
echo "my_secret_value" | docker secret create foo -
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
brew install dict ctags nmap
brew install zsh zsh-completions zsh-syntax-highlighting
#brew install --cask gimp
brew install --cask inkscape imagemagick
#brew install youtube-dl
brew install --cask mpv

# Big and slow to compile
brew install geeqie
brew cask install xquartz
#brew install mplayer

# Won't open if installed normally
brew install --no-quarantine libreoffice
```

Better to install GIMP from [their website](https://www.gimp.org/downloads/).  (One of my Macbooks refused to run the Homebrew version.)

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

## Mouse and trackpad

If you want the trackpad to use natural scrolling, but the mouse to use unnatural scrolling, then you need to install an app! ([github](https://github.com/ther0n/UnnaturalScrollWheels))

```bash
brew install --cask unnaturalscrollwheels
```

Then open Spotlight and open "unnaturalScrollWheels".  In settings you may need to toggle "Invert vertical scrolling" off, apply and then back on again.

If you want to click both mouse buttons at the same to to generate a middle-click, try installing [Middle](https://middleclick.app/) app.  Unfortunately, it didn't work with my external mouse.

If you want to move and resize windows convenients (like Alt-click-drag on Xwindows) there are some options for macOS which provide partial behaviour: https://superuser.com/questions/53051/altclick-drag-window-resizing-on-a-mac-similar-to-x-windows

## Keyboard mapping

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

Your Fn and Control keys may be swapped, compared to PC keyboards.  If you haven't done it already, you can swap them back, using:

- Keyboard > Keyboard Shortcuts > Modifier Keys > Swap Control and Globe

  This may cause problems if you have an external keyboard.  Solutions:

    - Check that Keyboard Shortcuts > Modifier Keys are NOT rewired for the Karabiner DriverKit VirtualHID Keyboard. Set them to normal, and rewire only the Apple Internal Keyboard.

    - (Drastic) Tell Karabiner > Devices to NOT modify events on the external keyboard, and then configure modifier keys separately for each keyboard under Keyboard Shortcuts.

- It is also possible to [remap](https://apple.stackexchange.com/a/313244/159962) these keys in Karabiner Elements, but I also found that quite buggy.

- If you did not do the above, then you may like to do this: To get PageUp/PageDown when pressing Fn-Up/Down, install the ["FN + Arrow Keys" rule](https://ke-complex-modifications.pqrs.org/#fn_arrows) for Karabiner Elements.

- To get arrow keys when pressing Opt-H/J/K/L, install the ["Map Left Option plus h/j/k/l to Arrows" rule]() for Karabiner Elements.

  However, if you have already swapped Fn and Ctrl, then this may apply to the wrong key.

- Alternatively, try ["left_option twice toggle to get into vim-like hjkl arrows in specified apps"](https://ke-complex-modifications.pqrs.org/#toggle_vim)

- You can find more Karabiner Elements rules to import here:
  - https://ke-complex-modifications.pqrs.org/

## More keyboard settings

- Keyboard > Keyboard navigation: On (to move around controls via Tab)

- Keyboard > Keyboard shortcuts > Function keys > Use F1, F2 etc. keys as standard keys: Disable (to get media controls more easily)

- Keyboard > Dictation > Shortcut: I switched it to "Press Right Command Key Twice" (because it was on "Press Control Key Twice" which was far too easy to trigger accidentally)

Sequoia introduced shortcuts for tiling windows.  But I like to use the following two for moving tabs left/right in Firefox.  So I need to disable them.  To disable them, we actually need to [assign them to something else](https://www.reddit.com/r/MacOSBeta/comments/1e26ljh/comment/lt57o3a/).  (Strangely, in Chrome these shortcuts only move the tabs, but in Firefox they both move the tabs _and_ tile Firefox, which is the problem.)

- Keyboard > Keyboard shorcuts > App Shortcuts > +, then set:

  - Application: All Applications
  - Menu Title: Top
  - Keyboard Shortcut: Ctrl+Opt+Up (or whatever)

  Do the same for `Bottom`, then (perhaps with Shift added) for `Top & Bottom`, `Bottom & Top`

  (The original shortcuts for Top/Bottom tiling can be found in the menu bar under Window > Move & Resize > Halves > Top / Bottom)

## Manipulating windows with keyboard

Since Sequoia, we now have:

    Maximize ('Fill')                   Fn-Ctrl-F
    Centralise ('Center')               Fn-Ctrl-C
    Restore original size ('Return'?)   Fn-Ctrl-R

I tried remapping `Fill` to `Opt-Z` but none worked except for `Cmd-Opt-Z`

On Linux I `Push Down` with `Meta-Alt-J` but the same stroke `Cmd-Opt-J` on macOS should probably be reserved for opening the DevTools.

Tiling:

    Tile 'Left'                         Fn-Ctrl-Left         (my remap: Cmd-Opt-Left)
    Tile 'Right'                        Fn-Ctrl-Right        (my remap: Cmd-Opt-Right)
    Tile 'Top'                          Fn-Ctrl-Up           (my remap: Cmd-Opt-Up)
    Tile 'Bottom'                       Fn-Ctrl-Down         (my remap: Cmd-Opt-Down)
    Below are fine, but above are a problem, because Cmd-Opt-Left and Right switch tabs in Chrome
    Tile 'Top & Bottom'                 Fn-Ctrl-Shift-Up     (my remap: Cmd-Opt-Shift-Up)
    Tile 'Bottom & Top'                 Fn-Ctrl-Shift-Down   (my remap: Cmd-Opt-Shift-Down)
    Tile 'Left & Right'                 Fn-Ctrl-Shift-Left   (my remap: Cmd-Opt-Shift-Left)
    Tile 'Right & Left'                 Fn-Ctrl-Shift-Right  (my remap: Cmd-Opt-Shift-Right)

Mappings which did not work out:

    Default Fn-Ctrl-Up/Down move tabs left/right in Chrome and Firefox
    Cmd-Opt-Left and Right switch tabs in Chrome

Note that the default settings for `Top` and `Bottom` end up tiling poor Firefox when I try to move tabs left or right.

(OLD) Suggest: Try out Rectangle before any of these.

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

The `§ / ±` key below `Escape` may be more familiar if it performs `Backtick / Tilde`.  This will also enable `Alt-§` to cycle windows in the same app (usually `Alt-backtick`).  To configure that:

- OLD: [these instructions](https://apple.stackexchange.com/a/401673/159962).  Last time `launchctl` was producing an error `Load failed: 5: Input/output error`, so I ended up [using Automator](https://web.archive.org/web/20231119010622/https://kitcross.net/remapping-tilde-key-macos/) to run `hidutil` on startup.

- NEW: In Karabiner Elements > Simple Modifications > Apple Internal Keyboard, configure:

  - Controls and symbols > non_us_backslash -> Controls and symbols > grave_accent_and_tilde

Since we are now not using the grave/tilde button in the bottom-left of the keyboard, we can repurpose it to backslash and pipe:

- Controls and symbols > grave_accent_and_tilde -> Controls and symbols > backslash (I find this useful for UK keyboard layout, where that button is otherwise unused)

Swap `£` and `#` using the "Exchange £ and #" rule from [here](https://ke-complex-modifications.pqrs.org/?q=british).  You may need to edit it to remove the conditions that make it only work on a specific keyboard.

## Fonts

Grab Hasklug Nerd Font Complete from Joey's Dropbox.  (Can also grab Lucida Console and Lucida TypeWriter if you like.)

- https://www.dropbox.com/home/fonts/custom_nerdfonts
- https://www.dropbox.com/home/fonts/FOR_MAC

After downloading, drag and drop these into the FontBook application.

## Settings for iTerm2

In macOS, give iTerm full disk access, otherwise you will (eventually) get a lot of dialogues asking if iTerm can access specific folders.

- Go to: System Settings > Full Disk Access, and enable for iTerm

Instead of configuring all the various settings below, you can load them from a file:

- Go to Settings > General > Settings
- Enable "Load settings from a custom folder or URL"
- Select the folder `.../preferences_sync/preferences/iterm_settings`
- Also enable "Save changes: Automatically"

If you didn't load the settings file above, then you could make the following changes manually:

Restore favourite profile and colours from:

- https://www.dropbox.com/home/preferences/iterm_profiles
- https://www.dropbox.com/home/preferences/iterm_colors

- General > Startup > Use system window restoration settings

  This may be controlled by macOS, in which case, click the yellow warning icon, which will bring you to:

  - System Settings > Desktop & Dock

  where you should

  - Disable "Close windows when quitting an application"

- General > Closing > Confirm "Quit iTerm2 (⌘Q)"

- General > Window > Adjust window when changing font size: OFF

- Appearance > General > Tab bar location: Bottom

- Appearance > Tabs > Show tab bar even when there is only one tab

- Profile > Colors > Color Presets > Import > Jargo (Joey's Argonaut)

- Profiles > Terminal > Scrollback lines: 10,000
- Profiles > Terminal > Silence bell: On
- Profiles > Terminal > Flash visual bell: On

- Profiles -> General -> Working Directory set Reuse previous session's directory (might not work until restart)

## Screen zoom

Go to System Settings > Accessibility > Zoom and set "Use scroll guesture with modifier key"

I set the `Option` key plus scroll to zoom in and out of the desktop.

## Final setup

Git might only start working after you have accepted the Xcode/developers license. When it is working, you will need to setup your passcode.

In `~/.gitconfig`, ensure `credentials.helper = osxkeychain`

Now try a `git push` on one of your private repos (e.g. `~/Dropbox/cheatsheets`) to get prompted for your passcode.

## Other apps of interest

- [Stats](https://github.com/exelban/stats) for showing stats in the menu bar. However, I found this didn't work too well on Apple M1 Max in January 2025.
- Alfred - non-free app launcher, faster than Spotlight
- Raycast - non-free app launcher, faster than Spotlight, and with clipboard history
