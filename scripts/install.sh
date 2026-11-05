#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 /path/to/GTNH-instance"
  exit 1
fi

instance="$1"
preset="tecnologico-rapido"
repo="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
replacement_file="$repo/config/easy-mode.replacements.tsv"
stamp="$(date +%Y%m%d-%H%M%S)"
backup="$instance/.gtnh-easy-mode-backups/$stamp"

if [[ ! -d "$instance" ]]; then
  echo "The GTNH instance directory does not exist: $instance" >&2
  exit 1
fi

if [[ ! -f "$replacement_file" ]]; then
  echo "Replacement table missing: $replacement_file" >&2
  exit 1
fi

mkdir -p "$backup"

applied=0
skipped=0

while IFS=$'\t' read -r path key old new; do
  [[ "$path" == "path" ]] && continue
  [[ -z "${path:-}" ]] && continue

  file="$instance/$path"
  if [[ ! -f "$file" ]]; then
    echo "Warning: file missing; skipped: $file" >&2
    skipped=$((skipped + 1))
    continue
  fi

  backup_file="$backup/$path"
  mkdir -p "$(dirname "$backup_file")"
  cp "$file" "$backup_file"

  if grep -Eq "^[[:space:]]*${key}[[:space:]]*=.*$" "$file"; then
    sed -i -E "s|^([[:space:]]*)${key}[[:space:]]*=.*$|\\1${key}=${new}|" "$file"
    applied=$((applied + 1))
  else
    echo "Warning: key missing; skipped: $key in $file" >&2
    skipped=$((skipped + 1))
  fi
done < "$replacement_file"

for relative in \
  "config/gendustry/overrides/tuning.cfg" \
  "config/gendustry/overrides/upgrades.cfg"
do
  source="$repo/$relative"
  target="$instance/$relative"

  if [[ -f "$target" ]]; then
    backup_file="$backup/$relative"
    mkdir -p "$(dirname "$backup_file")"
    cp "$target" "$backup_file"
  fi

  mkdir -p "$(dirname "$target")"
  cp "$source" "$target"
done

mkdir -p "$instance/scripts"
for script_name in easymode_ae2_lv.zs easymode_magic.zs; do
  source="$repo/scripts/$script_name"
  target="$instance/scripts/$script_name"
  if [[ -f "$source" ]]; then
    if [[ -f "$target" ]]; then
      backup_file="$backup/scripts/$script_name"
      mkdir -p "$(dirname "$backup_file")"
      cp "$target" "$backup_file"
    fi
    cp "$source" "$target"
  fi
done

echo
echo "GTNH Easy Mode: preset '$preset'"
echo "Applied config replacements: $applied"
echo "Skipped or missing: $skipped"
echo "Backup: $backup"
echo
echo "External mods to install manually:"
echo "  EZMiner: https://github.com/czqwq/EZMiner"
echo "  EZGT:    https://github.com/KingofKeet/EZGT"
echo "  Visual Prospecting: https://github.com/GTNewHorizons/VisualProspecting"
echo
echo "Create a new world and test EZGT/easy mode changes. The script does not download jars."
