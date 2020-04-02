# See also: shell-aliases.sh

alias gs='git status'
alias gl='git log --oneline --graph'
alias gll='git log --stat --patch'

alias gd='git diff'
# Use this to stage changes
alias gap='git add --patch'
# Use this to stage new files
alias ga='git add'
# This shows what you have staged so far
alias gdc='git diff --cached'
alias gc='git commit'

alias gb='git branch -v'
alias gbr='git branch -v --remote'
alias gco='git checkout'

alias gfo='git fetch origin'
alias gfa='git fetch --all'

alias gmom='git merge origin/master'
alias gmod='git merge origin/develop'
alias grom='git rebase --autostash origin/master'
alias grod='git rebase --autostash origin/develop'
alias gmu='git merge @{upstream}'
alias gru='git rebase --autostash @{upstream}'

alias gri='git rebase --interactive'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias gcp='git cherry-pick'

alias gss='git stash save'
alias gsp='git stash pop'
# For stashing away some unwanted changes, but keeping the rest
# Only stashes those lines you say 'y' to (remove them for now, pop them back later)
alias gssp='git stash --patch'
# Remove ("kill") whatever lines you say 'y' to (stashes what you select, then drops the stash)
alias gssk='git stash --patch && git stash drop'
# This is safer than `git reset --hard` because if you did accidentally kill
# something you wanted, recovery is possible from `git reflog`
