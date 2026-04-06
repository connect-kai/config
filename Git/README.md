# Git

## GitLab with glab

Use `glab` as the credential helper for GitLab HTTPS requests such as Git LFS.
If `glab` is not installed, the setup script installs it with Homebrew first.

```bash
bash ~/Developer/config/Git/setup-gitlab-glab.sh
```

If your `glab` host config is not using SSH for Git operations, re-run login:

```bash
glab auth login --hostname gitlab.com --git-protocol ssh --use-keyring
```
