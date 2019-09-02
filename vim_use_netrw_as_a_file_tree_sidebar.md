It is possible to use Vim's default file explorer "netrw" like the sidebar file explorer of an IDE.  We just need to remember the required keystrokes.  Here they are.

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

You can change focus between windows using:

    CTRL-W [arrow_key]
      or
    CTRL-W h/j/k/l

You can expand or shrink the current window with:

    30 CTRL-W >

    5 CTRL-W <

Now focus back on the netrw explorer.

If you want to open another file, `v` would create another split, giving you three windows (panes).  That's probably not what you want.

So to open another file in the same ("previous") window, hover over the file and hit:

    P

If you want to be able to open multiple files without the edits being saved, you will need:

    :set hidden



# Change the top folder of the tree view

Focus over the folder you want to be the root of the tree, and type:

    :Ntree



# Configuration

I use the following defaults in my `.vimrc`:

    " Default to tree view

    let g:netrw_liststyle = 3

    " Make `v` open the file on the right rather than the left

    let g:netrw_altv = 1

    " Make the split use more space for editor than for the tree

    let g:netrw_winsize = 80



# Moving files

Mark files with

    mf

Move files with

    mm

