#!/bin/bash

# Simpan folder kerja sekarang
ROOT_DIR=$(pwd)

# Loop semua subfolder yang mengandung .git
find . -type d -name ".git" | while read -r gitdir; do
  REPO_DIR=$(dirname "$gitdir")
  echo "🔍 Processing repo: $REPO_DIR"

  cd "$REPO_DIR" || continue

  git diff --summary | grep '100644 => 100755' | while IFS= read -r line; do
    file=$(echo "$line" | sed -E 's/.*100644 => 100755 //')
    file="$(echo "$file" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"

    if [ -f "$file" ]; then
      chmod 644 "$file"
      git add "$file"
      echo "✅ Reverted permission: $file"
    else
      echo "⚠️ File not found: $file"
    fi
  done

  # Kembali ke root folder untuk loop repo berikutnya
  cd "$ROOT_DIR" || exit
done
