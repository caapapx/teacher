# Contributing to teacher

Thank you for contributing domain adapters, eval cases, and teaching improvements.

---

## License

MIT

---

## Contribution Types

### 1. Add a Domain Adapter

1. Create `teacher/references/domain-<name>.md` (e.g. `domain-medicine.md`)
2. Follow the structure in `teacher/references/domains.md`
3. Link from `teacher/SKILL.md` routing section if the domain needs explicit trigger guidance

Built-in: `domain-cs.md` for computer science and software engineering.

### 2. Add Eval Cases

Add to `teacher/evals/evals.json`:

```json
{
  "id": 99,
  "name": "short-descriptive-name",
  "prompt": "what the user would type",
  "expected_output": "which mode should activate and why",
  "assertions": ["verifiable behaviors"],
  "domain": "domain-name",
  "tests_mode": "A"
}
```

### 3. Improve the Skill

- Keep `teacher/SKILL.md` lean (<180 lines); move mode detail to `references/modes.md`
- Put routing trees in `references/routing.md`
- Update `description` frontmatter when trigger scope changes

### 4. Knowledge Source Extensions

Document MCP/RAG integration in `references/source-<type>.md`; core protocol stays in `knowledge-sources.md`.

---

## Cross-Runtime Notes

| Concern | Solution |
|---------|----------|
| Search tool names vary | Use whatever search tool is available — no hardcoded names |
| MCP availability | Graceful degradation in `knowledge-sources.md` |
| Visualizations | ASCII/Mermaid default; HTML when interaction helps (see `viz-patterns.md`) |
| Global install | `./scripts/install-global.sh` → `~/.agents/skills/teacher` + client links |

---

## Before Opening a PR

- No private data in committed files
- Eval cases include verifiable assertions
- Run `teacher/scripts/install-global.sh` locally if you changed install paths
