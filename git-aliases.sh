alias gs='git status'
alias gl='git log'
alias gll='git log --oneline --graph'
alias glp='git log --patch'

alias gd='git diff'
alias gap='git add --patch'
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

alias gri='git rebase --interactive'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias gcp='git cherry-pick'

alias gss='git stash save'
alias gsp='git stash pop'
# Only stash those lines you say 'y' to (remove them for now, pop them back later)
alias gssp='git stash --patch'
# Remove ("kill") whatever lines you say 'y' to (stashes what you select, then drops the stash)
alias gssk='git stash --patch && git stash drop'
# (If you accidentally kill something you wanted, recovery is possible using
# `git reflog`, which means this is safer than `git reset --hard`)
