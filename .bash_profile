# .bash_profile is for all *login* shells (new terminal windows)
# tmux does not necessarily run it for new panes. Therefore, put
# things in .bashrc. Source .bashrc here so changes will apply to 
# both cases.

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
