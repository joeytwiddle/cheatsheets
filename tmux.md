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

# Some basics I like to do

Make the currently selected window stand out with a brighter background:

```
<Prefix> :set-window-option -g window-status-current-bg white
```

Name each window, to assist navigation:

```
<Prefix> , config
<Prefix> , logs
# or
tmux rename-window <new_title>
```

If the window keeps renaming itself, you may need to disable this option:

```bash
tmux set-option -g allow-rename off
```

# Make the currently selected window stand out

```
<Prefix>:set-window-option -g window-status-current-bg yellow
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

