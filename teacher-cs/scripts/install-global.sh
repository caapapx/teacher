#!/usr/bin/env bash
# 将 teacher-cs 三端 runtime 包以符号链接安装到 Cursor / Claude Code / Codex 全局 skills
# 主链接在 ~/.agents/skills/（按 runtime 分子目录），再链到各客户端 skills/teacher-cs
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
AGENTS_SKILLS="${HOME}/.agents/skills"
mkdir -p "${AGENTS_SKILLS}" "${HOME}/.cursor/skills" "${HOME}/.claude/skills" "${HOME}/.codex/skills"
ln -sfn "${ROOT}/cursor" "${AGENTS_SKILLS}/teacher-cs-cursor"
ln -sfn "${ROOT}/claude" "${AGENTS_SKILLS}/teacher-cs-claude"
ln -sfn "${ROOT}/codex" "${AGENTS_SKILLS}/teacher-cs-codex"
ln -sfn "../../.agents/skills/teacher-cs-cursor" "${HOME}/.cursor/skills/teacher-cs"
ln -sfn "../../.agents/skills/teacher-cs-claude" "${HOME}/.claude/skills/teacher-cs"
ln -sfn "../../.agents/skills/teacher-cs-codex" "${HOME}/.codex/skills/teacher-cs"
echo "OK: teacher-cs -> ${ROOT}"
echo "  ~/.agents/skills/teacher-cs-cursor  -> ${ROOT}/cursor"
echo "  ~/.agents/skills/teacher-cs-claude  -> ${ROOT}/claude"
echo "  ~/.agents/skills/teacher-cs-codex   -> ${ROOT}/codex"
echo "  ~/.cursor/skills/teacher-cs  ~/.claude/skills/teacher-cs  ~/.codex/skills/teacher-cs"
echo "Restart Cursor / Claude Code / Codex after install."
