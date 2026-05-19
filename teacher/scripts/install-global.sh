#!/usr/bin/env bash
# Install teacher skill globally for Cursor / Claude Code / Codex
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
AGENTS_SKILLS="${HOME}/.agents/skills"
mkdir -p "${AGENTS_SKILLS}" "${HOME}/.cursor/skills" "${HOME}/.claude/skills" "${HOME}/.codex/skills"

# Remove legacy teacher-cs install paths (pre-unified skill)
for legacy in \
  "${HOME}/.agents/skills/teacher-cs-cursor" \
  "${HOME}/.agents/skills/teacher-cs-claude" \
  "${HOME}/.agents/skills/teacher-cs-codex" \
  "${HOME}/.cursor/skills/teacher-cs" \
  "${HOME}/.claude/skills/teacher-cs" \
  "${HOME}/.codex/skills/teacher-cs" \
  "${HOME}/.claude/commands/teacher-cs.md"; do
  [[ -L "$legacy" || -e "$legacy" ]] && rm -rf "$legacy" 2>/dev/null || true
done

ln -sfn "${ROOT}" "${AGENTS_SKILLS}/teacher"
ln -sfn "../../.agents/skills/teacher" "${HOME}/.cursor/skills/teacher"
ln -sfn "../../.agents/skills/teacher" "${HOME}/.claude/skills/teacher"
ln -sfn "../../.agents/skills/teacher" "${HOME}/.codex/skills/teacher"
echo "OK: teacher -> ${ROOT}"
echo "  ~/.agents/skills/teacher"
echo "  ~/.cursor/skills/teacher  ~/.claude/skills/teacher  ~/.codex/skills/teacher"
echo "Restart Cursor / Claude Code / Codex after install."
