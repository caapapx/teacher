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

remove_agents_if_points_to_repo() {
  local link=$1
  local expected_sub=$2
  if [[ -L "$link" ]]; then
    resolved=$(readlink -f "$link" || true)
    expected=$(readlink -f "${ROOT}/${expected_sub}" || true)
    if [[ -n "$resolved" && -n "$expected" && "$resolved" == "$expected" ]]; then
      rm -f "$link"
      echo "removed: $link"
    else
      echo "skip: $link -> $resolved (not ${expected})"
    fi
  elif [[ -e "$link" ]]; then
    echo "skip (not a symlink): $link"
  fi
}

echo "teacher-cs global uninstall (symlinks only, repo at ${ROOT} is kept)"
remove_if_symlink "${HOME}/.cursor/skills/teacher-cs"
remove_if_symlink "${HOME}/.claude/skills/teacher-cs"
remove_if_symlink "${HOME}/.codex/skills/teacher-cs"
remove_agents_if_points_to_repo "${HOME}/.agents/skills/teacher-cs-cursor" "cursor"
remove_agents_if_points_to_repo "${HOME}/.agents/skills/teacher-cs-claude" "claude"
remove_agents_if_points_to_repo "${HOME}/.agents/skills/teacher-cs-codex" "codex"

echo "Done. Restart Cursor / Claude Code / Codex if they were using this skill."
