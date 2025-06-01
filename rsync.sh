#!/bin/bash

# Config folders inside ~/.config
CONFIG_FOLDERS=("nvim" "nvim-php" "nvim-js" "nvim-golang" "nvim-godot")

# Other files/folders in $HOME
HOME_ITEMS=(".zshrc" ".bashrc")

# Git repo root
DEST_ROOT="$HOME/config-git"
mkdir -p "$DEST_ROOT"

### 1. Sync .config folders
for NAME in "${CONFIG_FOLDERS[@]}"; do
  SRC="$HOME/.config/$NAME"
  DEST="$DEST_ROOT/.config/$NAME"

  if [ ! -d "$SRC" ]; then
    echo "⚠️  $SRC does not exist, skipping."
    continue
  fi

  mkdir -p "$DEST"
  rsync -a --delete "$SRC/" "$DEST/"
  echo "✅ Synced $SRC → $DEST"
done

### 2. Sync home dotfiles and folders
for ITEM in "${HOME_ITEMS[@]}"; do
  SRC="$HOME/$ITEM"
  DEST="$DEST_ROOT/$ITEM"

  if [ ! -e "$SRC" ]; then
    echo "⚠️  $SRC does not exist, skipping."
    continue
  fi

  if [ -d "$SRC" ]; then
    mkdir -p "$DEST"
    rsync -a --delete "$SRC/" "$DEST/"
  else
    rsync -a "$SRC" "$DEST"
  fi

  echo "✅ Synced $SRC → $DEST"
done

### 3. Git add, commit, and push
# cd "$DEST_ROOT" || exit 1
#
# git add .
# COMMIT_MSG="Sync on $(date '+%Y-%m-%d %H:%M:%S')"
# git commit -m "$COMMIT_MSG"
# git push

echo "🚀 All changes pushed to remote Git repository."
