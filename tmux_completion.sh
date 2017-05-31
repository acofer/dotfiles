#!/bin/bash

# tmux completion
# See: http://www.debian-administration.org/articles/317 for how to write more.
# Usage: Put "source bash_completion_tmux.sh" into your .bashrc
# Based upon the example at http://paste-it.appspot.com/Pj4mLycDE

_tmux_expand () 
{ 
    [ "$cur" != "${cur%\\}" ] && cur="$cur"'\';
    if [[ "$cur" == \~*/* ]]; then
        eval cur=$cur;
    else
        if [[ "$cur" == \~* ]]; then
            cur=${cur#\~};
            COMPREPLY=($( compgen -P '~' -u $cur ));
            return ${#COMPREPLY[@]};
        fi;
    fi
}

_tmux_filedir () 
{ 
    local IFS='
';
    _tmux_expand || return 0;
    if [ "$1" = -d ]; then
        COMPREPLY=(${COMPREPLY[@]} $( compgen -d -- $cur ));
        return 0;
    fi;
    COMPREPLY=(${COMPREPLY[@]} $( eval compgen -f -- \"$cur\" ))
}

function _tmux_complete_client() {
    local IFS=$'\n'
    local cur="${1}"
    COMPREPLY=( ${COMPREPLY[@]:-} $(compgen -W "$(tmux -q list-clients | cut -f 1 -d ':')" -- "${cur}") )
}
