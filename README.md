First install XCode, open it and accept terms, then install the command line tools with

```
xcode-select --install
```

Then run ./osx.sh and you're off to the races.


## Brewfile ##

To update the Brewfile in this directory, run `brew bundle dump -f`.

./osx.sh should contain the command `brew bundle` to install everything
