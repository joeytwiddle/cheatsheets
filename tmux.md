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
tmux set-window-option -g window-status-current-bg colour255
tmux set-window-option -g window-status-current-fg colour16

# Navigate between windows and panes with Shift-ArrowKeys
tmux bind-key -n S-Left select-window -t -1
tmux bind-key -n S-Right select-window -t +1
tmux bind-key -n S-Up select-pane -U
tmux bind-key -n S-Down select-pane -D

# Move current window with Ctrl-Shift-Arrow-Keys (newer version of tmux)
tmux bind-key -n C-S-Left swap-window -t -1
tmux bind-key -n C-S-Right swap-window -t +1

# Move current window with Ctrl-Shift-Arrow-Keys (older version of tmux)
#tmux bind-key -n C-S-Left swap-window -t -1 '\;' select-window -t -1
#tmux bind-key -n C-S-Right swap-window -t +1 '\;' select-window -t +1

# Since I like to name my windows, I prefer to turn this off
tmux set-option -g allow-rename off
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
# (There are also status-left-fg and status-right-fg but perhaps we can leave those to inherit from status-fg?)

# If you chose a light background, and colour0 is not black enough for you (perhaps due to your terminal's settings) you may try the darkest grey instead
tmux set-window-option -g window-status-fg colour232
# You can also do this for the text in the current window marker
tmux set-window-option -g window-status-current-fg colour232
# Soften the text at the left and right of the bar
tmux set-window-option -g status-fg colour238
```

# How to search (default mode)

1. Hit `<Prefix> [` to start copy/scroll mode
2. Hit `<Ctrl-R>` to search backwards, or
2. Hit `<Ctrl-S>` to search forwards (may jump up to the top)
3. To repeat search, you can hit `n` or `N` for the reverse direction

# How to copy and paste (default mode)

1. Hit `<Prefix> [` to start copy/scroll mode
2. Find the start of your selection and hit `<Ctrl-Space>`
3. Find the end of your selection and hit `<Alt-W>` or `<Ctrl-W>`
4. Go to the pane or window where you want to paste, and hit `<Prefix> ]` to paste

# Keybinds

Hit the prefix key (Ctrl-B by default) before using one of the keybinds below.

So, to see the help, press `Ctrl-B` and then `?`

# Help

    ? list-keys            (show all keybindings)
    q leave help page

You can also run from the command line, inside or outside of tmux:

    tmux list-keys

# Create windows

    c new-window
    " split-window
    % split-window -h      (horizontally)

# Navigate windows

    n next-window
    p previous-window      (in list)
    l last-window          (you were focused on)
    w choose-window        (from list)
    x confirm-before -p "kill-pane #P? (y/n)" kill-pane
    0 select-window -t :0
    ...
    9 select-window -t :9
    . command-prompt "move-window -t '%%'"
        prompts for new window position (but will only move to empty spot)

    :swap-window -t <target_window>
        use -1 for target_window to swap this window with the window to its left

# Navigate panes

    ; last-pane
    o select-pane -t :.+   (cycle through panes by moving cursor)
    C-o rotate-window      (cycle through panes by moving panes)
    q display-panes
    { swap-pane -U
    } swap-pane -D
    -r      Up select-pane -U
    -r    Down select-pane -D
    -r    Left select-pane -L
    -r   Right select-pane -R

# Navigate panes

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

# Disconnecting and getting back

    ( switch-client -p
    ) switch-client -n
    d detach-client
    D detach another client

# Search (when in copy mode)

With Emacs key bindings (the default):

    C-s search forwards
    C-r search backwards

Or with vi keybindings (`set-window-option -g mode-keys vi`):

    / search forwards
    ? search backwards

And then:

    n jump to next match
    N jump to previous match

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
