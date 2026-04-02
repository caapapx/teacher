#!/usr/bin/env bash
# 将本 skill 以符号链接方式安装到 Cursor / Claude Code / Codex 全局 skills
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
AGENTS_SKILLS="${HOME}/.agents/skills"
mkdir -p "${AGENTS_SKILLS}" "${HOME}/.cursor/skills" "${HOME}/.claude/skills" "${HOME}/.codex/skills"
ln -sfn "${ROOT}" "${AGENTS_SKILLS}/teacher"
ln -sfn "../../.agents/skills/teacher" "${HOME}/.cursor/skills/teacher"
ln -sfn "../../.agents/skills/teacher" "${HOME}/.claude/skills/teacher"
ln -sfn "../../.agents/skills/teacher" "${HOME}/.codex/skills/teacher"
echo "OK: teacher -> ${ROOT}"
echo "  ~/.agents/skills/teacher"
echo "  ~/.cursor/skills/teacher  ~/.claude/skills/teacher  ~/.codex/skills/teacher"
echo "Restart Cursor / Claude Code / Codex after install."
