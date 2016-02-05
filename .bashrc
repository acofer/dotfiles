# exports
export PATH=$PATH:~/bin
# wine needs:
export DBUS_SESSION_BUS_ADDRESS="launchd:env=DBUS_FINK_SESSION_BUS_SOCKET"
# wine does NOT need because /opt/local/bin/wine is a shell script that sets it
# export DYLD_FALLBACK_LIBRARY_PATH=/opt/local/lib
# export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
# eval "$(/Users/acofer/miniconda2/bin/register-python-argcomplete conda)"
# PostGIS
#export PATH=$PATH:/usr/local/pgsql/bin
# shell prompt
export PS1='\u@\h:\W>'

# aliases
alias cpwd='pwd | pbclip'
alias ppwd='cd `pbpaste`'
alias shome='ssh adam@acofer.ddns.net -X -L 5901:127.0.0.1:5901 -L 6697:127.0.0.1:6697 -L 1194:127.0.0.1:1194'
alias scer='ssh acofer@cerberus -X'
alias ssto='ssh acofer@SCE-storage'
alias sclu='ssh acofer@SCE-cluster'
alias tstudio='wine ~/.wine/drive_c/Program\ Files/TRANSIMS\ Studio/TransimsGUI.exe'
alias rl='python -c "import os,sys;print os.path.realpath(sys.argv[1])"' # note: use greadlink
alias ll='ls -AlG'
alias ls='ls -G'
alias ipy='ipython qtconsole --pylab=inline'
alias gitlog='git log --graph --oneline --decorate --all'

# # TMUX
# # If not running interactively, do not do anything
# [[ $- != *i* ]] && return
# [[ -z "$TMUX" ]] && exec tmux
