# Super Teacher for Claude Code

[English](./README.md) | [中文](./README.zh-CN.md)

**An evidence-based teaching workflow that turns AI from an answer machine into a Socratic tutor — any domain, including computer science.**

<p align="center">
  <img src="docs/skill-logo.png" width="220" alt="teacher-skill logo" />
</p>

Traditional tutoring and most LLM Q&A compress knowledge and dump it to users. It feels efficient, but retention is weak.

This skill uses retrieval practice, interleaving, dual coding, self-explanation, metacognition, and Socratic questioning to force active thinking and improve transfer.

Research anchor: Freeman et al. (2014), *Active learning increases student performance in science, engineering, and mathematics*, *PNAS* 111(23), 8410-8415.  
https://www.pnas.org/doi/10.1073/pnas.1319030111

<p align="center">
  <a href="https://github.com/caapapx/teacher-skill">GitHub</a> · <a href="https://github.com/caapapx/teacher-skill/issues">Issues</a>
</p>

---

## Quick Start

Copy the skill folder to your runtime's global or project skills path:

```bash
cp -r teacher ~/.claude/skills/teacher   # Claude Code (example)
```

Or symlink globally (recommended for development):

```bash
./scripts/install-global.sh
# or: cd teacher && ./scripts/install-global.sh
```

Restart Cursor, Claude Code, and Codex after install.

**Uninstall** (symlinks only; repo untouched):

```bash
./scripts/uninstall-global.sh
```

The install script also removes legacy `teacher-cs` global links from older layouts.

---

## One Skill, All Domains + CS

Computer science (algorithms, LeetCode, system design, interviews, languages, distributed systems, AI/LLM) is built into the same **`teacher`** skill:

- Core workflow: `teacher/SKILL.md` (~115 lines)
- CS adapter: `teacher/references/domain-cs.md` (read when topic is CS)
- Mode details: `teacher/references/modes.md`
- Routing detail: `teacher/references/routing.md`
- Viz patterns: `teacher/references/viz-patterns.md`

There is no separate `teacher-cs` skill anymore.

---

## System Architecture (At a Glance)

<img src="docs/skill-desribe.png" width="900" alt="Resource flow architecture and teacher new skillset" />

---

## Seven Teaching Modes

| Mode | Name | Typical trigger |
|---|---|---|
| A | Guided Decomposition | Problems, algorithms, derivations |
| B | Socratic + Advanced Retrieval | Exams, interviews, deep dive |
| C | Mental Model + Dual Coding | Abstract concepts, system internals |
| D | Simplification + Analogy | Intro concepts, "what is X?" |
| E | Deep Inquiry | Mechanism, why/how questions |
| F | Interleaving + Generative Learning | Systematic study plans |
| G | Metacognitive Strategy | Stuck, low retention |

---

## Repo Structure

```text
teacher-skill/
├── README.md
├── README.zh-CN.md
├── CONTRIBUTING.md
├── scripts/
│   ├── install-global.sh      # wrapper → teacher/scripts/
│   └── uninstall-global.sh
└── teacher/
    ├── SKILL.md
    ├── scripts/
    ├── references/
    │   ├── domain-cs.md
    │   ├── modes.md
    │   ├── routing.md
    │   └── ...
    └── evals/
        └── evals.json
```

---

## Real Teaching Scenarios

- "How do I solve Two Sum?" → Mode A + `domain-cs.md`; variable table + trace, not full code upfront
- "Redis persistence interview prep" → Mode B; question chain + weak spots
- "Explain Transformer attention" → Mode C; ASCII/visual + checks
- "Systematically learn distributed systems" → Mode F; time-boxed plan + mixed drills

---

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md).

---

## License

MIT
