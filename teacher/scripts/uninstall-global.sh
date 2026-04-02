#!/usr/bin/env bash
# 撤销 install-global.sh 写入的全局符号链接（不删除本仓库目录）
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

remove_if_symlink() {
  local target=$1
  if [[ -L "$target" ]]; then
    rm -f "$target"
    echo "removed: $target"
  elif [[ -e "$target" ]]; then
    echo "skip (not a symlink): $target"
  fi
}

echo "teacher global uninstall (symlinks only, repo at ${ROOT} is kept)"
remove_if_symlink "${HOME}/.cursor/skills/teacher"
remove_if_symlink "${HOME}/.claude/skills/teacher"
remove_if_symlink "${HOME}/.codex/skills/teacher"

agents_teacher="${HOME}/.agents/skills/teacher"
if [[ -L "$agents_teacher" ]]; then
  resolved=$(readlink -f "$agents_teacher" || true)
  root_resolved=$(readlink -f "$ROOT" || true)
  if [[ -n "$resolved" && "$resolved" == "$root_resolved" ]]; then
    rm -f "$agents_teacher"
    echo "removed: $agents_teacher"
  else
    echo "skip: $agents_teacher -> $resolved (not this repo at $root_resolved)"
  fi
elif [[ -e "$agents_teacher" ]]; then
  echo "skip (not a symlink): $agents_teacher"
fi

echo "Done. Restart Cursor / Claude Code / Codex if they were using this skill."
