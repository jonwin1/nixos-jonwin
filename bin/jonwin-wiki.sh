#!/usr/bin/env bash

set -e

echo "Pulling latest changes…"
git pull --rebase --autostash

while true; do
  nvim index.md

  if [[ -z "$(git status --porcelain)" ]]; then
    break
  fi

  clear
  echo "Changes detected"
  echo
  echo "────────────────────"
  git diff --stat
  echo "────────────────────"
  echo
  echo "[c] Commit & push"
  echo "[e] Continue editing"
  echo "[q] Quit without committing"
  echo
  read -rp "Choose an option: " choice

  case "$choice" in
    c)
      git add -A
      git commit -m "sync"
      clear
      echo "Pushing changes…"
      git push
      break
      ;;
    e)
      continue
      ;;
    *)
      break
      ;;
  esac
done
