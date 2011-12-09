# Setup PS1 to show git info
function git_branch {
    status=`git status 2> /dev/null`
    check=`echo $status | grep -i 'branch'`
    cancommit=`echo $status | grep -i 'to be committed'`
    notstage=`echo $status | grep -i 'not staged'`

    if [ -n "$check" ]; then
        if [[ "$check" == *Not* ]]; then
            branch='none'
        else
            branch=`echo $check | cut -d ' ' -f 4`
        fi
        if [ -n "$notstage" ]; then
            branch=$branch*
        elif [ -n "$cancommit" ]; then
            branch=$branch#
        fi
        echo " ($branch)";
    fi
}

#PS1="\u@\h \W\$ "
PS1="[\[\033[37m\]\u@\w\[\033[0m\]]\[\033[32m\]\$(git_branch)\[\033[0m\]\$ "

alias ls='ls -GF'
alias la='ls -a'
alias ll='la -l'

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Setup git bash completion
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
    . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

# History completion using up/down arrows
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

