# Zsh

## Install

```bash
bash ~/Developer/config/Zsh/install.sh
```
This installs `oh-my-zsh` with the default `robbyrussell` theme.

## Local overrides

```bash
bash ~/Developer/config/Zsh/create-localrc.sh
```

The generated `~/.localrc` includes:

- `pagent`: start Proton Pass SSH agent if it is not running
- `pagent_restart`: restart the Proton Pass SSH agent
- `pa`: short alias for `pagent`
- `par`: short alias for `pagent_restart`
- automatic `pagent` checks for `ssh`, `scp`, `sftp`, `rsync`, and common `git` network commands
