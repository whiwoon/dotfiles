#!/usr/bin/env bash
set -euo pipefail

# Chezmoi run-before script: back up existing managed files before apply.
# Backup format is compatible with restore-dotfile-backup.

backup_parent="${DOTFILE_BACKUP_DIR:-$HOME/.dotfile-backups}"
timestamp="$(date +%Y%m%d-%H%M%S)"
backup_root="$backup_parent/$timestamp"
mkdir -p "$backup_root"

count=0
while IFS= read -r path; do
  [ -n "$path" ] || continue

  case "$path" in
    "$HOME"/*)
      abs="$path"
      rel="${path#$HOME/}"
      ;;
    /*)
      continue
      ;;
    *)
      abs="$HOME/$path"
      rel="$path"
      ;;
  esac

  [ -e "$abs" ] || [ -L "$abs" ] || continue
  [ -f "$abs" ] || [ -L "$abs" ] || continue

  dest="$backup_root/$rel"
  mkdir -p "$(dirname "$dest")"
  cp -a "$abs" "$dest"
  count=$((count + 1))
done < <(chezmoi managed 2>/dev/null || true)

if [ "$count" -eq 0 ]; then
  rmdir "$backup_root" 2>/dev/null || true
  echo "chezmoi backup: no existing managed files to back up"
else
  echo "chezmoi backup: saved $count item(s) to $backup_root"
fi
