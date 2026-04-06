# Config

Personal macOS setup for daily development.

## Installation guide

This repository assumes:

- macOS
- Xcode Command Line Tools installed
- Homebrew installed

## Install all

```bash
bash ~/Developer/config/install.sh
```

## Structure

- `Ghostty/`: Ghostty config
- `Git/`: GitLab and `glab` setup
- `Homebrew/`: packages and apps
- `Rime/`: Squirrel input method setup
- `SSH/`: SSH config template for Proton Pass agent
- `System/`: macOS defaults and Dock setup
- `Zsh/`: shell setup, Java helpers, and local overrides template
- `Tmux/`: minimal tmux configuration

## Setup

1. Install Xcode Command Line Tools.

```bash
xcode-select --install
```

2. Install Homebrew by following the official instructions at [brew.sh](https://brew.sh).

3. Clone this repository to any local path.

```bash
git clone https://github.com/connect-kai/config ~/Developer/config
```

4. Run the Homebrew bootstrap script.

```bash
bash ~/Developer/config/Homebrew/brew.sh
```

This installs the Rust toolchain through `rustup`, configures Git LFS, and adds terminal tools such as `jq`, `fd`, and `fzf`.

5. Configure GitLab credentials for Git and Git LFS.

```bash
bash ~/Developer/config/Git/setup-gitlab-glab.sh
```

6. Apply macOS defaults and Dock settings.

```bash
bash ~/Developer/config/System/set-osx-defaults.sh
bash ~/Developer/config/System/set-osx-dock-apps.sh
```

7. Install Ghostty config.

```bash
bash ~/Developer/config/Ghostty/install.sh
```

8. Install Rime custom files.

```bash
bash ~/Developer/config/Rime/install.sh
```

9. Install and link Zsh config.

```bash
bash ~/Developer/config/Zsh/install.sh
```

10. Create a local shell override file if needed.

```bash
bash ~/Developer/config/Zsh/create-localrc.sh
```

11. Create an SSH config for the Proton Pass agent if needed.

```bash
bash ~/Developer/config/SSH/create-config.sh
```

12. Install tmux config.

```bash
bash ~/Developer/config/Tmux/install.sh
```
