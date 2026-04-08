#!/bin/bash

# Pakai sudo hanya jika tidak punya akses tulis
use_sudo() {
  [ -w "$1" ] && echo "" || echo "sudo"
}

echo "🔍 Memindai direktori proyek di ~/Projects ..."

remove_if_exists() {
  local path="$1"
  local sudo_prefix
  sudo_prefix=$(use_sudo "$path")

  if [ -d "$path" ]; then
    $sudo_prefix rm -rf "$path"
    echo "  ✔ Dihapus: $path"
  fi
}

for dir in ~/Projects/*/; do
  echo "🧹 Membersihkan: $dir"
  cd "$dir" || continue

  # Go
  remove_if_exists vendor

  # Node.js
  remove_if_exists node_modules

  # PHP
  remove_if_exists vendor

  # Python
  remove_if_exists .venv
  find . -type d -name '__pycache__' -exec $(use_sudo "{}") rm -rf {} + && echo "  ✔ Dihapus: __pycache__"

  # Ruby
  remove_if_exists vendor

  # Rust
  remove_if_exists target

  # Java
  remove_if_exists .gradle
  remove_if_exists build
  remove_if_exists target

  # .NET
  remove_if_exists obj
  remove_if_exists bin

  # Deno
  remove_if_exists deno_modules

  # Haskell
  remove_if_exists .stack-work
done

echo "✅ Selesai membersihkan semua subdirektori di ~/Projects."
