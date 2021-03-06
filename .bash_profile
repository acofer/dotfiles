# .bash_profile is for all *login* shells (new terminal windows)
# tmux does not necessarily run it for new panes. Therefore, put
# things in .bashrc. Source .bashrc here so changes will apply to 
# both cases.

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/go

[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

export BASH_SILENCE_DEPRECATION_WARNING=1
