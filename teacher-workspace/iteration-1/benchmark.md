# Iteration 1 — Post-merge validation

Static and routing smoke checks after merging `teacher-cs` into `teacher`.

## Results

| Check | Status |
|-------|--------|
| SKILL.md < 180 lines (actual: 115) | pass |
| references/modes.md, routing.md, domain-cs.md present | pass |
| teacher-cs/ removed | pass |
| 8 eval cases (5 general + 3 CS) | pass |
| CS triggers in description | pass |
| Global install `~/.agents/skills/teacher` | pass |

See `static_validation.json` for machine-readable output.

Full LLM with_skill vs without_skill runs can be added in a follow-up using skill-creator eval workspace.
