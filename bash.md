## Setup

Some setup to make the bash shell easier to work with.

You can paste these into a running terminal.

```bash
# Handy aliases
alias l='ls -lartFh --color'
alias m='less -REX'

# Environment
export EDITOR=vim

if [ -t 0 ]
then
    # History: Cycle through history based on characters already typed on the line
    bind '"\e[A":history-search-backward'
    bind '"\e[B":history-search-forward'
    # Fix Ctrl-Left and Ctrl-Right because otherwise the history binds break them
    bind '"\e[1;5C":forward-word'
    bind '"\e[1;5D":backward-word'

    # Tab-completion: If there are multiple matches for completion, Tab should first display a list, then cycle through them
    bind 'TAB:menu-complete'
    # And Shift-Tab should cycle backwards
    bind '"\e[Z": menu-complete-backward'
    # Display a list of the matching files
    bind "set show-all-if-ambiguous on"
    # Perform partial (common) completion on the first Tab press, only start
    # cycling full results on the second Tab press (from bash version 5)
    bind "set menu-complete-display-prefix on"

    # If you have an older version of bash, this last option may exist, but it is not honoured when menu-complete is used.  Instead of the initial partial complete, it will immediately start cycling the full matches
    # If the partial complete is more important to you than the cycling, then you may prefer to disable cycling, by not using menu-complete
    if echo "$BASH_VERSION" | grep '^[1234]\.' >/dev/null; then bind 'TAB:complete'; fi
fi
```

If you want these to work in all future shells, you are supposed to put them into your `~/.bashrc`

However when placed on a remote machine, I found that caused rsync to display the warning "bind: warning: line editing not enabled".  Therefore I recommend the `bind` commands be placed inside `~/.bash_profile` (or into `~/.inputrc` but suitably modified) and only enabled for user logins.

## Keybinds

The keybinds I find the most useful:

```
Up / Down          Scroll through history

Ctrl-a             Jump to start of line
Ctrl-e             Jump to end of line

CTrl-Left/Right    Jump left/right one word (on Linux)
Shift-Left/Right   Jump left/right one word (on macOS)
Escape b           Jump left one word
Escape f           Jump right one word

Escape Backspace   Delete previous word
Ctrl-w             Delete previous word
Ctrl-Shift-_       Delete previous word

Ctrl-U             Clear from cursor to beginning of line
Ctrl-K             Clear from cursor to end of line

Ctrl-R             Search history

Escape .           Insert last argument of previous line
Meta-.             Insert last argument of previous line

Not keybinds but these evaluate to special things:

!$                 Last argument on the previous line
!#$                Previous argument on this line

Ctrl-Meta-e        Expand any special things, so you can see what they evaluate
                   to before before hitting Enter.
Alt-^ Alt-Shift-6  Seems to do the same thing
```

## See also

For more tips, see my [BASH_COMMAND_LINE_TRICKS.txt](https://github.com/joeytwiddle/jsh/blob/master/code/shellscript/BASH_COMMAND_LINE_TRICKS.txt)
