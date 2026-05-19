# Routing Reference

Read this file when the quick routing table in SKILL.md is not enough — ambiguous input, multiple strong signals, or mode transitions mid-session.

## Decision Tree

```
User input
  │
  ├─ CS domain? (algorithm, LeetCode, system design, interview, language internals…)
  │   → Read references/domain-cs.md first, then route below with CS signals
  │
  ├─ Contains a specific problem / exercise / step-by-step derivation?
  │   → Mode A: Guided Decomposition (CS: Algorithm Concretization)
  │
  ├─ Asking "what is X" / "how do I understand X" (conceptual)?
  │   ├─ Complex / abstract concept? → Mode C: Mental Model + Dual Coding
  │   └─ Simple / introductory concept? → Mode D: Simplification + Analogy
  │
  ├─ Exam / interview / oral defense prep?
  │   → Mode B: Socratic + Advanced Recall
  │
  ├─ "Why does X work this way" / mechanism / source-level inquiry?
  │   → Mode E: Deep Elaboration
  │
  ├─ Want to study a topic or domain systematically?
  │   → Mode F: Interleaved Practice + Generative Learning
  │
  └─ Feeling stuck or inefficient in learning?
      → Mode G: Metacognitive Strategy
```

## Signal Reference

| Signal | Matched Mode |
|--------|-------------|
| problem, exercise, derive, calculate, prove, solve… | Guided Decomposition (A) |
| LeetCode, algorithm problem, two-sum, DP, linked list… | Guided Decomposition (A) — CS |
| what is, how to understand, concept, intro to a principle… | Mental Model (C) / Simplification (D) |
| exam, interview, oral defense, mock test, system design… | Socratic + Advanced Recall (B) |
| why, underlying principle, mechanism, how does it work, source code… | Deep Elaboration (E) |
| systematic study, learning path, from scratch, comprehensive mastery… | Interleaved Practice (F) |
| can't focus, low efficiency, don't know how to study… | Metacognitive Strategy (G) |

## Mode Transition Rules

| Current Mode | Transition Signal | Switch To |
|-------------|------------------|----------|
| B (Socratic) | User fails two rounds in a row — missing foundational knowledge | A to fill gaps, then back to B |
| A (Guided Decomposition) | User answers easily with no challenge | B to increase depth |
| C/D (Conceptual) | User says "I get it, give me a problem to try" | B or F |
| Any mode | User shows clear confusion or frustration | G to diagnose, then continue |
| F (Interleaved Practice) | User repeatedly misses a sub-topic | A to tackle it, then back to F |

When switching, briefly tell the user: "It looks like we need to [do X] first — we'll come back to this after." Don't switch silently, but don't over-explain either.
