# These are the aliases I use most frequently on the command line.
#
# To install:
#
# - Save this file in ~/.shell-aliases
#
# - Add the following line to your ~/.bashrc and your ~/.zshrc
#
#     source ~/.shell-aliases
#
# You can also use that source command to update your running shell after you
# have changed this file.
#
# See also: git-aliases.sh
#
# See also: https://github.com/ohmyzsh/ohmyzsh

# Beautiful ls, most recent at the bottom
alias ll='ls -lartFh --color'

# Easily navigate up a few folders
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias g='grep'
alias ig='grep -i'
alias h='history'
# In bash, search your history with: h   | g something
# In  zsh, search your history with: h 1 | g something

# Use 'm' instead of 'more' to read files or page output.
# It is safe to use on binaries, offers better navigation, and displays colors.
alias m='less -REX'

# Make it safer when moving files.  -i = ask before overwriting target
alias mv='mv -i'
# Make it safer when copying files.  -i = ask before overwriting target
# Also copy everything.  -a = copy recursively, and keep file times and permissions
alias cp='cp -i -a'

# I also use recommend using rsync with -ai, although in this case -i shows information

# Check disk usage of everything in the current folder (slow but maybe worth the wait)
alias dusk='du -skx * | sort -n -k 1'

# Search filenames with fewer keystrokes
# Example: fnd \*.txt
alias fnd='find . -not \( -path "*/node_modules" -prune -or -path "*/.git" -prune \) -iname'

# Lists any text files in the current folder
alias ltxt='ll *.txt *.TXT *.md *.MD *.markdown *.MARKDOWN README 2>/dev/null'
