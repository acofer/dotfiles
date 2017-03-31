if [ -f ~/.bashrc ]; then
       source ~/.bashrc
   fi
if [ -f $(brew --prefix)/etc/bash_completion ]; then
   . $(brew --prefix)/etc/bash_completion
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

source /usr/local/opt/autoenv/activate.sh

