# Starting tmux

Rejoin an existing tmux session:

```bash
tmux a
```

Or if there isn't an existing session, you can start a new one:

```bash
tmux
```

To rejoin one of multiple running sessions:

```bash
tmux list-sessions
tmux a -t <target-session>
```

# Some basics I like to do after starting a new tmux session

You can just copy-paste this into your terminal, once you are inside tmux.

```bash
# Make the currently selected window stand out with a brighter background
#tmux set-window-option -g window-status-current-bg white
# Better compatibility with older terminal clients
tmux set-window-option -g window-status-current-bg colour7
tmux set-window-option -g window-status-current-fg colour0
# May be preferable on newer terminals, for stronger contrast and/or to bypass the terminal_s colour scheme
#tmux set-window-option -g window-status-current-bg colour255
#tmux set-window-option -g window-status-current-fg colour16
# For modern tmux
tmux set-window-option -g window-status-current-style 'fg=black bg=brightwhite'

# Navigate between windows and panes with Shift-ArrowKeys
# (Sadly these do not work through Putty on Windows, but they do through Kitty)
tmux bind-key -n S-Left select-window -t -1
tmux bind-key -n S-Right select-window -t +1
tmux bind-key -n S-Up select-pane -U
tmux bind-key -n S-Down select-pane -D

# Move current window with Ctrl-Shift-Arrow-Keys (older versions of tmux)
#tmux bind-key -n C-S-Left swap-window -t -1
#tmux bind-key -n C-S-Right swap-window -t +1
# Move current window with Ctrl-Shift-Arrow-Keys (newer versions of tmux)
tmux bind-key -n C-S-Left swap-window -t -1 '\;' select-window -t -1
tmux bind-key -n C-S-Right swap-window -t +1 '\;' select-window -t +1

# Since I like to name my windows, I prefer to turn this off
tmux set-option -g allow-rename off

# Increase scrollback history (default 2000 I think)
tmux set-option -g history-limit 6000
```

To make things clearer, I like to name each window:

```bash
<Prefix> , config
<Prefix> , logs
# or
tmux rename-window <new_title>
```

If you have lots of different tmux sessions running (perhaps as different users, or on different machines, or for different projects) then you might like to change the color of each session, to help make it recognisable:

```bash
# Instead of showing [0], give the session a recognisable name
# (You may want to set your own string here)
tmux rename-session "$(hostname)"

# Set a colour by name
tmux set-window-option -g status-bg magenta
# Or keep running this command, until you find a colour you like
tmux set-window-option -g status-bg colour$((RANDOM % 256))

# If you choose a dark background, then you might like to choose a slightly lighter foreground
tmux set-window-option -g window-status-fg colour6
tmux set-window-option -g window-status-fg colour7
tmux set-window-option -g window-status-fg colour15
# You should also do the same for the text at the left and right of the bar
tmux set-window-option -g status-fg colour7
tmux set-window-option -g status-fg colour15
# (There are also status-left-fg and status-right-fg but perhaps we can leave those to inherit from status-fg?)

# If you chose a light background, and colour0 is not black enough for you (perhaps due to your terminal's settings) you may try colour16 instead
tmux set-window-option -g window-status-fg colour16
# a dark grey
tmux set-window-option -g window-status-fg colour234
# or the darkest grey
tmux set-window-option -g window-status-fg colour232
# You can also make the text in the current window marker darker
tmux set-window-option -g window-status-current-fg colour232
# Soften the text at the left and right of the bar
#tmux set-window-option -g status-fg colour238
# Darken the text at the left and right of the bar
tmux set-window-option -g status-fg colour232
```

# Disable the mouse

```bash
tmux set-window-option -g mouse off
```

or for older versions of tmux:

```bash
tmux set-window-option -g mouse-select-pane off
tmux set-window-option -g mouse-resize-pane off
tmux set-window-option -g mouse-select-window off
```

# Search scrollback (when in copy mode)

First, hit `<Prefix> [` to start copy/scroll mode.

Then with Emacs key bindings (the old default):

    <Ctrl-S> search forwards
    <Ctrl-R> search backwards

Or with vi keybindings (the new default, or `set-window-option -g mode-keys vi`):

    / search forwards
    ? search backwards

And then:

    n to jump to the next match
    N to jump to the previous match

# How to copy and paste (default mode)

1. Hit `<Prefix> [` to start copy/scroll mode
2. Find the start of your selection with arrow keys (in emacs mode) or vi keybinds (in vi mode)
3. To mark the start, hit `<Ctrl-Space>` (in emacs mode) or `<Space>` or `y` (in vi mode)
4. Move to the end of your selection and hit `<Enter>` or `<Alt-W>` or `<Ctrl-W>` to copy
5. Hit `q` to get out of copy/scroll mode
6. Go to the pane or window where you want to paste, and hit `<Prefix> ]` to paste

# Keybinds

Hit the prefix key (`<Ctrl-B>` by default) before using one of the keybinds below.

For example, to see the help, press `<Ctrl-B>` and then `?`

# Help

    ? list-keys            show all keybindings
    q (without prefix)     leave help page

You can also run from the command line, inside or outside of tmux:

    $ tmux list-keys
    <Prefix> :tmux list-keys

# Create and destroy windows

    c new-window
    C-d (without prefix) exit the shell, causing the window to close, or
    x confirm-before -p "kill-pane #P? (y/n)" kill-pane

# Disconnecting from a tmux session

This will drop you back out to your original shell, but leave the tmux windows running.

    d detach-client
    D detach another client
    ( switch-client -p
    ) switch-client -n

# Reconnecting to a tmux session

To get back to the most recently used session:

    $ tmux attach
    # or
    $ tmux a

If you have multiple sessions, and need to choose:

    $ tmux a
    <Prefix> :choose-session

or:

    $ tmux list-sessions
    $ tmux a -t [session_name]

# Navigate windows

    # Above I put these on Shift-Right/Left
    n next-window
    p previous-window      (in list)
    l last-window          (you were focused on)
    w choose-window        (from list)
    0 select-window -t :0
    ...
    9 select-window -t :9

    . command-prompt "move-window -t '%%'"
        prompts for new window position (but will only move to empty spot)

    # Above I put this on Ctrl-Shift-Left/Right
    :swap-window -t <target_window>
        use -1 for target_window to swap this window with the window to its left

# Navigate panes

    " split-window
    % split-window -h      (horizontally)
    o select-pane -t :.+   (cycle through panes by moving cursor)
    C-o rotate-window      (cycle through panes by moving panes)
    ; last-pane
    { swap-pane -U
    } swap-pane -D
    q display-panes
    # Above I put these on Shift-Up/Down
    k      Up select-pane -U
    j    Down select-pane -D
    h    Left select-pane -L
    l   Right select-pane -R

# Manage panes

    ! break-pane           (current pane breaks out into a new window)

To pull/bring another window here:

    :join-pane -s <other_window_number>

You can use `!` to refer to the previous focused window.

Or to push the current pane somewhere:

    :join-pane -t <target_window_numer:target_pane_number>

This will place your current pane below the existing pane at `target_pane_number`.  Since pane numbers are zero-indexed, to place your pane last, use the number of panes minus 1 as the `target_pane_number`.

Alternatively, mark a pane with:

    :select-pane -m

And then bring the marked pane with:

    :join-pane

# More

    C-b send-prefix
    C-z suspend-client
    Space next-layout
    # list-buffers
    $ command-prompt -I #S "rename-session '%%'"
    & confirm-before -p "kill-window #W? (y/n)" kill-window
    ' command-prompt -p index "select-window -t ':%%'"
    , command-prompt -I #W "rename-window '%%'"
    - delete-buffer
    : command-prompt
    = choose-buffer
    ? list-keys
    D choose-client
    L switch-client -l
    [ copy-mode
    ] paste-buffer
    f command-prompt "find-window '%%'"
    i display-message

    r refresh-client
    s choose-session
    t clock-mode
    ~ show-messages
    PPage copy-mode -u
    M-1 select-layout even-horizontal
    M-2 select-layout even-vertical
    M-3 select-layout main-horizontal
    M-4 select-layout main-vertical
    M-5 select-layout tiled
    M-n next-window -a
    M-o rotate-window -D
    M-p previous-window -a
    -r    M-Up resize-pane -U 5
    -r  M-Down resize-pane -D 5
    -r  M-Left resize-pane -L 5
    -r M-Right resize-pane -R 5
    -r    C-Up resize-pane -U
    -r  C-Down resize-pane -D
    -r  C-Left resize-pane -L
    -r C-Right resize-pane -R

    , rename-window

# Listing options

To see all the available options, and their current setting:

```bash
tmux show -g
```

And to see all the window options:

```bash
tmux show -gw
```

# Sharing

Different terminals can use different windows in one tmux session.

To do this, instead of joining an existing tmux session with:

    tmux attach [-t target-session]

Join it like this:

    tmux new-session -t target-session

Although the two terminals can use different windows, they CANNOT use different panes in the same window.

That tip, and some others, was mentioned here: http://mutelight.org/practical-tmux

[This answer](https://unix.stackexchange.com/a/292303/33967) lists the steps required to set up a two-pane tmux with two different views of the same session.

# Take a window from another session and attach it to your current session

    move-window -s [other_session_id]:[window_id] -t [target_window_id]

Before doing that you may like to list the windows from that session

    list-windows -t [other_session_id]

# Send the same keystrokes to all visible panes

    setw synchronize-panes on

# Dealing with reduced dimensions

If you attach to an existing tmux session, and the width and height are reduced, this is likely because another session is attached from a different terminal.  This can also happen if your ssh connection died, and the old "ghost" session stays alive for a while.

To resolve this, if you are sure nobody is using the other session, you can use `<Prefix> D` and select the session you want to force to disconnect.  Look for the one with the lower width x height.
