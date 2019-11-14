It is possible to use Vim's built-in file explorer `netrw` like the sidebar file explorer we find in many IDEs.  We just need to remember the required keystrokes: first `v` and then `P`.  Here is a full walkthrough.

# Quick introduction

Open Vim's file explorer on a folder:

    $ vim ./project

Or if you already have Vim open:

    :e ./project

You can switch netrw to tree list view if you like:

    iii

Move down to a file you want to open and open it in a vertical split:

    v

Now you probably want the file list on the left and the editor on the right, so swap the windows (panes):

    CTRL-W x

You can change focus between windows using:

    CTRL-W [arrow_key]
      or
    CTRL-W h/j/k/l

You can set the width of the current window with:

    120 CTRL-W |

Now focus back on the netrw explorer.

If you want to open another file, `v` would create another split, giving you three windows (panes).  That's probably not what you want.

If you opened a third pane by accident, you could use `CTRL-W c` to close the currently focused pane.

Now let's do it the right way.

To open another file but **re-use the same window**, hover over the file and hit:

    P

Here `P` refers to the "previously focused" window.

If you ever accidentally hit `Enter` to try to open a file, the file explorer will disappear and the pane will become an editor pane!  But you can easily get the file explorer back by hitting Vim's "back button":

    CTRL-O

If you want to be able to open multiple files without the edits being saved, you will need:

    :set hidden



# Change the top folder of the tree view

Focus over the folder you want to be the root of the tree, and type:

    :Ntree



# Configuration

I use the following defaults in my `.vimrc` for convenience:

```vim
" When netrw opens, default to the tree view mode

let g:netrw_liststyle = 3

" Make `v` open the file on the right rather than the left

let g:netrw_altv = 1

" Make the split use more space for the editor than for the tree

let g:netrw_winsize = 80
```

You could also use these configurations but I don't recommend it because _they will not help you remember how to use default vim!_

```vim
" When first opening the preview/previous window, use a vertical split

let g:netrw_preview = 1

" When hitting Enter, open the file in the previous window instead of the current window (or 2 to always split)

let g:netrw_browse_split = 4
```

I think it's better to train muscle memory to use `v` and `P` so when faced with an unconfigured Vim, we can easily operate it.

(I do not train muscle memory for the configuration mentioned earlier because I already know those operations well enough that I will not forget them.)

(Note that the MiniBufExplorer plugin seems to mess up the behaviour the above settings anyway.)



# Moving files

If you want to move some files to a different folder, first mark each file with:

    mf

Then focus your cursor on the target folder, and move the marked files with:

    mm

