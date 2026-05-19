# Super Teacher for Claude Code

[English](./README.md) | [中文](./README.zh-CN.md)

**基于证据的教学流程，把 AI 从「答案机器」变成苏格拉底式导师——覆盖任意学科，包含计算机科学。**

<p align="center">
  <img src="docs/skill-logo.png" width="220" alt="teacher-skill logo" />
</p>

---

## 快速开始

```bash
cp -r teacher ~/.claude/skills/teacher
```

或全局符号链接（开发推荐）：

```bash
./scripts/install-global.sh
```

装完后重启 Cursor、Claude Code、Codex。

**卸载**：`./scripts/uninstall-global.sh`（只删链接，不删仓库）。脚本会清理旧版 `teacher-cs` 全局链接。

---

## 单一 skill，通用 + CS

计算机科学（算法、LeetCode、系统设计、面试、语言、分布式、AI/大模型）已并入 **`teacher`**：

- 核心：`teacher/SKILL.md`
- CS 适配：`teacher/references/domain-cs.md`
- 模式详情：`teacher/references/modes.md`
- 路由详情：`teacher/references/routing.md`

不再有独立的 `teacher-cs` skill。

---

## 仓库结构

```text
teacher-skill/
├── scripts/install-global.sh
└── teacher/
    ├── SKILL.md
    ├── references/domain-cs.md
    └── evals/evals.json
```

---

## 贡献

见 [CONTRIBUTING.md](./CONTRIBUTING.md)。

---

## License

MIT
