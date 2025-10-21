#/etc/bash/bashrc.d/20-flavour-git-branch-color.bash

git_branch() {
    branch=$(cat .git/HEAD 2> /dev/null | cut -d "/" -f 3-)
    if [[ $(echo -n ${branch} | wc -c) -ne 0 ]]; then
    	echo "[${branch}]"
    fi
}

getcolor() {
    branch=$(git_branch | tr -d '[]')
    
    if [ "${branch}" == "master" ] || [ "${branch}" == "main" ]; then
        # yellow = 3
        color=$(tput setaf 3)
    elif [ "${branch}" == "tst" ]; then
        color=$(tput setaf 208)
    else
        # red = 1
        color=$(tput setaf 1)
    fi
    
    if [[ $(echo -n ${branch} | wc -c) -ne 0 ]]; then
        echo ${color}
    fi
}

if (( EUID == 0 )); then
        # If root, omit the username and print the hostname in red.
        PS1='\[\e[01;31m\]\h\[\e[01;34m\] \w \$\[$(getcolor)\] $(git_branch) \[\033[00m\]'
else
        # Otherwise, print the username and hostname in green.
        PS1='\[\033]0;\u@\h:\w\007\]\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[$(getcolor)\] $(git_branch) \[\033[00m\]'
fi
