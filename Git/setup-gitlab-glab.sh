#!/bin/bash

set -euo pipefail

if ! command -v glab >/dev/null 2>&1; then
  echo "glab is not installed, installing with Homebrew..."
  brew install glab
fi

GLAB_BIN="$(command -v glab)"

git config --global --replace-all credential.https://gitlab.com.helper "!$GLAB_BIN auth git-credential"
git config --global --replace-all credential.https://gitlab.com.useHttpPath true

cat <<EOF
Configured GitLab HTTPS credentials to use glab:

  credential.https://gitlab.com.helper = !$GLAB_BIN auth git-credential
  credential.https://gitlab.com.useHttpPath = true

If needed, re-run:

  glab auth login --hostname gitlab.com --git-protocol ssh --use-keyring
EOF
