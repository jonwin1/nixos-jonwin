#!/usr/bin/env bash

echo "Pulling latest changes…"
git pull --rebase --autostash

nvim index.md

if [[ -n "$(git status --porcelain)" ]]; then
  git add -A
  git commit -m "sync"
  clear
  echo "Pushing changes…"
  git push

  notify-send "Wiki" "Changes pushed successfully"
fi
