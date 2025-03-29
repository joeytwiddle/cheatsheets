# Getting started on Mac OSX

For Linux and Windows users.

I found this "cheatsheet" invaluable when I started using a Mac.  I couldn't memorize all the tips+tricks at once, but whenever I needed one, I switched to this file to look it up, and eventually my fingers learned to use the shortcuts automatically.



# The keyboard

## Keyboard shortcuts

See also: http://www.danrodney.com/mac/

and: http://support.apple.com/kb/ht1343 (doesn't seem to include Mission Control)

    Switch between apps:                Cmd-Tab

    Switch between windows in one app:  Cmd-grave
    (sends current window to the back)
    Opposite direction:                 Cmd-Shift-grave

          (grave is the ` key)

    Jump whole words:                   Option-Left/Right

    and of course you can
       select whole words:              Shift-Option-Left/Right

    Delete last word (backwards):       Opt-Del
    Delete last word (forwards):        Fn-Opt-Del

    Jump to start/end of line:          Cmd-Left/Right

    Toggle show desktop:                F11

    Show Mission Control (current desktop): Ctrl-Up
    Show Mission Control (current app):     Ctrl-Down

    You can use <Space> while in Mission Control, to preview (temporarily zoom) a window.

    To switch between desktops:         Ctrl-Left/Right

    Move to top/bottom of document      Cmd-Up/Down
                 (Home/End on PCs):     Fn-Left/Right

    PageUp/Down on MAC keyboard:        Fn-Up/Down

    Real delete instead of backspace:   Fn-Delete

    PageUp/Down in terminal:            Shift-PageUp/Down
                                        Fn-Shift-Up/Down

    Up down paragraph (start/end line): Option-Up/Down

    To bring up Chrome's DevTools:      Cmd-Option-J

    Switch tabs in iTerm or Chrome:     Cmd-Shift-[ or ]

    Screenshot the screen:              Cmd-Shift-3

    Screenshot a rectangle:             Cmd-Shift-4 then drag it

    Screenshot a window:                Cmd-Shift-4 then Space then click it

    Copy screenshot to clipboard:       Use above keybinds but also hold Ctrl

    Record a short video:               Cmd-Shift-5

    Toggle maximize in iTerm:           Cmd-Opt-Equals

    Toggle maximize in other apps:      You need to create a shortcut called "Zoom" in the Keyboard section of System Preferences.  (I put it on Ctrl-Cmd-Equals)

          (Note that Zoom will only horizontally maximize a window to fit the content; it won't fill the screen if it doesn't need to.)

    Toggle fullscreen:                  Cmd-Ctrl-F
                  or (works in Chrome): Cmd-Shift-F

    Maximize ('Fill')                   Fn-Ctrl-F
    Centralise ('Center')               Fn-Ctrl-C
    Restore original size ('Return'?)   Fn-Ctrl-R

    Enter special characters:           Ctrl-Cmd-Space

    Move up/down Skype conversations    Cmd-Opt-Left/Right

    Navigate backwards/forwards         Cmd-[ and Cmd-]
          (in Chrome, WebStorm, ...)

You can learn more shortcut keys from the menu of each application.  Command looks like a flower or four-leaf clover.  Control is the hat / upward chevron / small up arrow.  Option is the one with the crazy switch symbol (it is supposed to be an electronic switch or a railway switch).  http://osxdaily.com/2012/03/27/making-sense-of-mac-keyboard-symbols/  http://superuser.com/questions/46452/weird-symbols-for-key-combinations-on-a-mac#46459


## Shell shortcuts (for use in iTerm)

    Complete the current word           Tab
      (use this all the time,
      to save time and avoid typos)

    Up/Down                             Cycle previous commands

    Ctrl-A / Ctrl-E                     Jump to start/end of line

    Ctrl-U                              Wipe line (backwards from cursor)


## Function keys (top row)

On the laptop, by default the function keys F1-F12 do their magic action (change brightness, volume, etc.).  To actually press a function key, hold the Fn button when you press it.

If you want to toggle that behaviour (perhaps you use an app that uses F keys a lot) you can go to the Keyboard settings dialog and check "Use all F1, F2, etc. keys as standard function keys".

With a PC keyboard plugged in the function keys act normally.  I don't know how to get their magic action.


## Ctrl, Win, Alt/Cmd key order

On the laptop the key order is: Fn Control Option Command

But with a PC keyboard plugged in, the order becomes: Ctrl Command Option

This is something of a cognitive drain, so I can highly recommend swapping them around when a PC keyboard is plugged in.  Here is how:

- Go to System Preferences and open the Keyboard dialog.
- Click 'Modifier Keys' at the bottom.
- Be sure to select 'USB keyboard' or 'PC keyboard' at the top of the dialog.
- Now change Option to perform Command.
- and change Command to perform Option.


## Ctrl key is hard to reach on the laptop

Users of Windows laptops and PCs are accustomed to the Control key appearing in the leftmost position, but on the Mac the Ctrl and Fn keys are swapped.

If you use Ctrl a lot, and you wish the Macbook's Fn and Control keys were the opposite way around, you can try:

- OLD: http://moox.io/blog/switch-ctrl-fn-keys-macbook-keyboard/
- NEW: You can do this in System Settings > Keyboard > Keyboard Shortcuts > Modifier Keys.  Select the relevant keyboard, and then swap "Globe" and "Control" keys.

Alternatively you can do what old Unix keyboard did: put the Control key on the "home row", where Caps Lock is.  This can be done in the Keyboard settings dialog mentioned earlier.  http://en.wikipedia.org/wiki/Caps_lock#Caps_Lock_versus_Control_key  (The contemporary positioning of the Caps Lock key on PC keyboards was such a big mistake, the manufacturers put a step on the key to make it harder to hit it by accident!)



## Faster keyboard repeat

If you like to hold a key down to perform e.g. fast scrolling or fast deletion of characters, you may find the range of speeds offered in System Settings a bit limited.  But you can make keyboard repeat go faster by following the tip [offered here](http://hints.macworld.com/article.php?story=20090823193018149):

    $ # Pretty fast
    $ defaults write NSGlobalDomain KeyRepeat -int 1

    $ # Really fast!
    $ defaults write NSGlobalDomain KeyRepeat -int 0

*Note that you will need to log out and log in again for the change to take affect.*



# App config files

Can't find your rc-files (Unix dotfiles)?  Application data is stored under:

    ~/Library/Application Support/



# Homebrew packages

Some packages require extra setup after homebrew has installed them.  One example was the fuse4x kernel extension.  Info about what to do after installing a package can be found by doing, e.g.:

    $ brew info fuse4x-kext

And here is how one package links itself into the system to start on bootup:

    To have launchd start redis at login:
        ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
    Then to load redis now:
        launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
    Or, if you don't want/need launchctl, you can just run:
        redis-server /usr/local/etc/redis.conf



# Using iTerm2

To [attach a tab](https://apple.stackexchange.com/questions/14704/reattach-terminal-tab-to-another-window) to another window:

1. Make the tab you want to move smaller, so you can see the target window behind it.

2. Hold Shift-Option-Command and drag the _content_ of the tab into the tab bar of the target window.

   (If you drag it onto the content of the target window, you will create split panes.)



# Using MacVim

To grab the name of the current file:

- Ctrl-G will display it in the echo/command/message area, after which you can highlight with the mouse.  (Unlike Vim in an XTerm, you won't need to hold shift while doing this!)

Alternatively, run the following to copy the full file path to the clipboard:

    :let @+=expand('%:p')

(without the : it just copies the relative path.)



# Steps to get jsh working

    $ brew install gnu-sed

or I could have done:

    $ brew install coreutils

[SKIP THIS] Then I did:

    $ ln -s gsed /usr/local/bin/sed

This made GNU sed appear as sed.  This might be dangerous if our PATH is exported to scripts we call which expect to have BSD sed.  Time will tell...

Forget that last step.  Instead I added a line to jsh startup that adds /use/local/bin to the front of the PATH, so that it will be used over the system tools.
