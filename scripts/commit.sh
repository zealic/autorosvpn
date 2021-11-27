#!/bin/bash
git config user.name  "$GITLAB_USER_NAME"
git config user.email "$GITLAB_USER_EMAIL"
git remote set-url origin "git@gitlab.com:${CI_PROJECT_PATH}.git"

# Ignore host key
cat > ~/.ssh/config <<EOF
Host *
    StrictHostKeyChecking no
EOF

git add **/*.txt **/*.rsc || true
git commit -am "Update list @ $(date '+%F')"
git push origin HEAD:master
