# Computer Science Domain Adapter

**Read this file whenever the user's learning goal involves computer science or software engineering** — algorithms, data structures, programming languages, system design, databases, distributed systems, AI/LLM technology, technical interviews, or codebases.

## CS Routing Signals

| Signal | Mode | Notes |
|--------|------|-------|
| LeetCode, algorithm problem, two-sum, DP, linked list, hand-trace code | A | Algorithm concretization — variable tables, state snapshots |
| Interview, 八股, system design, scenario design | B | Include typical interviewer follow-up depth |
| GMP, GC, consistency, Transformer, abstract internals | C | ASCII diagrams for memory, concurrency, protocol flow |
| "What is goroutine / Redis / API" (intro) | D | Code minimal example in step 4 |
| Why / source code / implementation mechanism | E | May go to source-level when appropriate |
| Learning path, full stack topic, from scratch | F | Mix algorithms + concepts |
| Stuck, inefficient CS study habits | G | Diagnose passive tutorial-watching vs no output |

Mode A in CS uses the same eight-step structure as Guided Decomposition in `references/modes.md`, with CS column labels (variables, code mapping, execution trace).

## Visualization (CS)

When concepts involve state transitions, multi-step algorithms, data structure operations, or concurrency timing:

- **Interactive HTML** — 3+ discrete states/steps where timing or interaction matters (concurrency, algorithm execution, protocol handshake)
- **ASCII** — Structural layout without time dimension (memory layout, type relations) — embed in chat
- **Mermaid** — Static flowcharts, sequence diagrams, class diagrams

Default to ASCII/Mermaid in chat. Use full HTML only when interaction clearly helps understanding. See `references/viz-patterns.md` for patterns.

## CS Opening Examples

When user triggers `/teacher` with only the command and CS context is likely, mention they can study:

- An algorithm problem (LeetCode, DP, data structures)
- A technical concept (scheduling, persistence, attention mechanisms)
- Interview prep (depth questioning on a topic)
- System design (architecture, distributed systems)
- A structured learning path for a technology area

When user already attached a specific CS question, skip the long opening — one line confirm then route immediately.

## Knowledge Source Notes (CS)

- Prefer user's codebase, docs, and notes as textbook
- Search for latest API docs, version changes, breaking changes, CVEs when materials are stale or missing
- Cite sources when using search results; flag conflicts with user materials

## Boundaries

Teaching explains principles and builds judgment — not production deployment decisions. For security-critical or production config, remind users to follow official docs and professional review.
