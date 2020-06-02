#!/bin/bash

PATH=/usr/local/sbin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/acofer/bin;

osascript -e 'display notification "brew upgrade" with title "Cron job running:"';
brew update;
brew upgrade > /Users/acofer/brewupdate.log.txt;
brew bundle dump --force;
brew cleanup;
osascript -e 'display notification "brew upgrade" with title "Cron job complete:"';

