## Make tabs visible

```vim
# Make tabs visible
:set list listchars+=tab:\|\-\>

# Show trailing spaces
:set list listchars+=trail:%

# Do not show the end-of-line with a $ character
:set listchars-=eol:\$
```

```vim
# See current settings
:set listchars?

# Edit current settings
:set listchars=<Tab>

# Disable all
:set nolist
```

## Configure indentation

To indent with two spaces

```vim
:set ts=2 sw=2 expandtab
```

To indent with tabs, but make them appear with width 4:

```vim
:set ts=4 sw=4 noexpandtab
```

## Manual indentation

You can use `>[motion]` and `<[motion]` to indent or de-indent a chunk of code, or `>>` and `<<` for a single line.

For example: `{>}` will move to the start of a paragraph (block), and then indent all lines from there to the end of the paragraph (block).

## Automatic indentation

You can use `=[motion]` to automatically indent some lines.  For example `vip=` to select a paragraph and then reindent it.

For automatic indentation, you will need the correct filetype, and there are some options you can tweak.  Try experimenting with these:

```vim
:setfiletype bash autoindent smartindent nocindent

:setfiletype javascript autoindent cindent
```

## Paste without reindenting

```vim
CTRL-R CTRL-O {register}
```

Registers `+` and `*` are used for the system clipboard.

## Paste something you had earlier

Look at the registers, then choose which number register you want to paste.

```vim
:reg

"4P
```

## Change Vim's working folder to that of the current file

```vim
:cd %:p:h
```

## Put a file explorer in the sidebar

See: [vim_use_netrw_as_a_file_tree_sidebar.md](./vim_use_netrw_as_a_file_tree_sidebar.md)

## The fastest way to quit Vim

Hit `ZZ` to save your changes, and quit Vim.

Hit `ZQ` to discard your changes, and quit Vim.

