#!/usr/bin/env python3
"""Static + routing smoke validation after teacher/teacher-cs merge."""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TEACHER = ROOT / "teacher"
SKILL = TEACHER / "SKILL.md"
EVALS = TEACHER / "evals" / "evals.json"

MODE_KEYWORDS = {
    "A": [r"leetcode", r"algorithm", r"quadratic", r"derive", r"两数之和", r"solve", r"problem"],
    "B": [r"exam", r"interview", r"面试", r"oral defense", r"prepare"],
    "C": [r"abstract", r"diagram", r"draw", r"transformer", r"mitosis", r"抽象", r"画个图"],
    "F": [r"systematically", r"30.minute", r"study plan", r"系统学习", r"learning path"],
}


def check_files() -> list[str]:
    errors: list[str] = []
    required = [
        SKILL,
        TEACHER / "references/modes.md",
        TEACHER / "references/routing.md",
        TEACHER / "references/domain-cs.md",
        TEACHER / "references/viz-patterns.md",
        EVALS,
    ]
    for p in required:
        if not p.is_file():
            errors.append(f"missing file: {p.relative_to(ROOT)}")
    if (ROOT / "teacher-cs").exists():
        errors.append("teacher-cs/ should be removed")
    text = SKILL.read_text(encoding="utf-8")
    if text.count("\n") + 1 > 180:
        errors.append(f"SKILL.md too long: {text.count(chr(10))+1} lines (target <180)")
    if "name: teacher-cs" in text or "teacher-cs" in text.split("---", 1)[0]:
        errors.append("SKILL frontmatter should not reference teacher-cs")
    for ref in ["domain-cs.md", "modes.md", "routing.md"]:
        if ref not in text:
            errors.append(f"SKILL.md missing pointer to {ref}")
    fm = text.split("---", 2)
    if len(fm) < 3 or "name: teacher" not in fm[1]:
        errors.append("invalid YAML frontmatter")
    if "LeetCode" not in fm[1] and "algorithm" not in fm[1]:
        errors.append("description should mention CS triggers")
    return errors


def route_prompt(prompt: str, tests_mode: str) -> bool:
    p = prompt.lower()
    patterns = MODE_KEYWORDS.get(tests_mode, [])
    return any(re.search(k, p, re.I) for k in patterns) or tests_mode == "mixed"


def check_evals() -> list[str]:
    errors: list[str] = []
    data = json.loads(EVALS.read_text(encoding="utf-8"))
    evals = data.get("evals", [])
    if len(evals) < 8:
        errors.append(f"expected >=8 evals, got {len(evals)}")
    cs = [e for e in evals if e.get("domain") in {"algorithm", "interview", "ai", "system-design"}]
    if len(cs) < 3:
        errors.append(f"expected >=3 CS evals, got {len(cs)}")
    for e in evals:
        mode = e.get("tests_mode", "")
        if mode != "mixed" and not route_prompt(e.get("prompt", ""), mode):
            errors.append(f"eval {e.get('id')} prompt may not match tests_mode {mode}")
    return errors


def main() -> int:
    errors = check_files() + check_evals()
    out = ROOT / "teacher-workspace" / "iteration-1"
    out.mkdir(parents=True, exist_ok=True)
    report = {
        "validation": "static+routing-smoke",
        "passed": len(errors) == 0,
        "errors": errors,
        "skill_md_lines": SKILL.read_text(encoding="utf-8").count("\n") + 1,
        "eval_count": len(json.loads(EVALS.read_text())["evals"]),
    }
    (out / "static_validation.json").write_text(json.dumps(report, indent=2), encoding="utf-8")
    if errors:
        print("FAIL:")
        for e in errors:
            print(f"  - {e}")
        return 1
    print("PASS:", json.dumps(report, indent=2))
    return 0


if __name__ == "__main__":
    sys.exit(main())
