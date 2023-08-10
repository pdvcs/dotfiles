# ~/.bashrc: executed by bash(1) for interactive shells.

# exit if subshell or not running interactively
[[ "$-" != *i* ]] && return
[[ $SHLVL > 1 ]] && return

stty -ixon
[[ -f /etc/bash_completion ]] && . /etc/bash_completion
[[ -f "${HOME}/.bash_aliases" ]] && . "${HOME}/.bash_aliases"

# aliases
alias lh='ls -lrth'
alias me=micro
alias subl="/C/Program\ Files/Sublime\ Text/subl.exe"

function parse_git_dirty {
    [[ $(git status --porcelain 2> /dev/null) ]] && echo "●"
}
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
}

# TODO improve this (but it's quick)
export PS1="\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
