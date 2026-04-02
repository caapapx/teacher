# teacher-cs

one skill. three runtimes. same teaching goal.

the folders here are installable runtime packages, not abstract docs.

## install

### global symlinks (Cursor + Claude Code + Codex)

from this `teacher-cs/` directory:

```bash
./scripts/install-global.sh
```

this creates primary links under `~/.agents/skills/` (`teacher-cs-cursor`, `teacher-cs-claude`, `teacher-cs-codex` pointing at `cursor/`, `claude/`, `codex/`) and links each client’s `skills/teacher-cs` to the matching package. **restart** all clients after install.

**uninstall** (symlinks only; repo untouched):

```bash
./scripts/uninstall-global.sh
```

agent-side links are removed only when they resolve to **this** repo’s `cursor/`, `claude/`, and `codex/` folders.

### project copy (manual)

| runtime | copy this folder | install to |
|---|---|---|
| Claude Code | [`claude/`](./claude/) | `.claude/skills/teacher-cs/` |
| Codex | [`codex/`](./codex/) | `.codex/skills/teacher-cs/` |
| Cursor | [`cursor/`](./cursor/) | `.cursor/skills/teacher-cs/` |

## what changes by runtime

| runtime | distinctive files | reason |
|---|---|---|
| Claude Code | `evals/`, `references/knowledge-sources.md` | Claude skill packaging already used those files |
| Codex | `agents/openai.yaml` | Codex supports runtime agent metadata |
| Cursor | leaner package | Cursor version currently tracks the core teaching prompt and references |

## what stays invariant

- the teacher-cs teaching modes
- the CS routing logic
- the visualization decision rules
- the focus on retrieval, self-explanation, and adaptive questioning

## shared evals

[`evals/evals.json`](./evals/evals.json) is the shared benchmark set for the skill family.

use it to verify:

- routing accuracy
- visualization choice
- user-output requirements
- source-priority behavior

## source of truth

runtime packages here are synced from the live skill variants developed in `letsgo`.
