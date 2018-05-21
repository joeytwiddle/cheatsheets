# Quick introduction

Open a folder in Vim:

    $ vim ./project

Or if you already have Vim open:

    :e ./project

You can switch netrw to tree list view if you like:

    iii

Move down to a file you want to open and open it in a vertical split:

    v

Now if you want the file view on the left, you might want to swap the windows (panes):

    CTRL-W x

Now if you want to open another file, `v` would create another split, giving you three windows (panes).  That's probably not what you want.

So to open another file in the same ("previous") window, hover over the file and hit:

    P

You can expand or shrink the current window with:

    30 CTRL-W >

    5 CTRL-W <


# Configuration

I use the following defaults in my `.vimrc`:

    " Default to tree view

    let g:netrw_liststyle = 3

    " Make `v` open the file on the right rather than the left

    let g:netrw_altv = 1

    " Make the split use more space for editor than for tree

    let g:netrw_winsize = 80

