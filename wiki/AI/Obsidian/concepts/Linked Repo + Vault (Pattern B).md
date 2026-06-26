---
type: concept
para: resource
domain: obsidian-ai
title: "Linked Repo + Vault (Pattern B)"
status: developing
created: 2026-06-26
updated: 2026-06-26
tags:
  - concept
  - obsidian
  - ai
  - claude-obsidian-workflow
  - model-b
---

# Linked Repo + Vault (Pattern B)

## Definition
**Claude Code 喺獨立 repo folder 入面 run**（`cd ~/code/myproj && claude`），**Obsidian vault 完全分開 root**。Vault 入面有個 project hub note（典型 `Projects/<Name> (project).md`）用 frontmatter 嘅 `code_path:` 反指 repo 路徑；repo 嘅 `CLAUDE.md` 反指 vault hub note。兩個 pointer 互指 = 同一個 project 嘅「actionable 控制頁」（vault）同「真實 code/file storage」（repo）。

呢個喺呢個 vault 叫 **Model B**（per CLAUDE.md「Model B 對應」段落）。

## How it works

```
~/code/myproj/                              ← external repo（git push 去 GitHub）
├── CLAUDE.md                                ← repo context + 反指 vault：
│                                                vault_note: ~/AI/Claude/.../Projects/MyProj (project).md
├── src/
├── docs/
├── tests/
└── .claude/settings.json                    ← repo-only hooks、permissions

~/AI/Claude/second-brain/                   ← vault（git push 自家 repo）
├── Projects/
│   └── MyProj (project).md                  ← 「control page」
│       frontmatter:
│         type: project
│         para: project
│         code_path: ~/code/myproj
│         status: active
│       body:
│         ## Log（append）
│         ## Key Decisions
│         ## Next Actions
│         ## Open Questions
└── Business/MyProj/                         ← 知識層（可選；NMN 用呢個）
    ├── MyProj.md hub
    ├── overview.md
    └── ...
```

進入方式：
```bash
# code 工作時
cd ~/code/myproj
claude
# Claude 讀 CLAUDE.md，知道個 vault hub 喺邊；要 cross-reference 嗰陣可以 cat 對應 vault 檔

# vault 工作時（log decisions、organize notes）
cd ~/AI/Claude/second-brain
claude
# Claude 讀 vault CLAUDE.md，知道 NMN 有 code_path、可以建議 context-switch
```

## Pros

- **Clean separation** —— code git 純淨，唔混 personal note
- **Vault 保持 personal**—— Claude 操作 code 時唔見到日記／健康／private context；privacy 邊界清晰
- **Repo 可獨立 share / open source** 不洩 vault 內容
- **「Agents read, humans write」遵守** —— vault 內容由你沉澱，Claude 唔 auto-populate
- **Auto-commit hook scope 分開** —— vault hook 唔 trigger code commit；vice versa
- **多 project 平行**，每個 repo 自有 cwd context；vault 統一 dashboard
- **「Model B」係 starmorph blog 「Strategy 1: simplest」嘅推薦做法**

## Cons

- **要維護兩個 pointer**（vault `code_path:` + repo `CLAUDE.md` 反指）；改 path 要兩邊改
- **Claude 想跨 reach context 要 manual** —— 想 vault 嘅 decision log 入到 code session 要 `cat` 或開埋 vault Code session（解法：Pattern C MCP）
- **Session 開兩個 instance 較佔資源**（如果想同時 work code + vault）
- **新手 setup 較複雜** —— vault Projects 模板 + repo CLAUDE.md 反指 + 命名一致性
- **MOC 維護**：vault [[Projects]] hub 要記得加入新 project 嘅 `[[Proj (project)]]` 連結

## When to use

✅ **Code project 要 GitHub push** / 開源 / 合作  
✅ 商業 / 含 sensitive data 嘅 project（IP 隔離）  
✅ 已有獨立 repo workflow（CI、Docker、deploy）  
✅ 想保 vault 純粹 personal compounding（Karpathy 派 + kepano alignment）  
✅ 多 project 平行嘅 power user  
✅ 你 NMN 同類 ecom／research project

❌ 純筆記 project（搬 vault 內就足夠，多嗰 layer 浪費）  
❌ 一次性 throwaway script（無需 vault 控制頁）

## Real-world examples

| 項目 | 備註 |
|---|---|
| **NMN (your project)** | `~/AI/Claude/nmn-2026-06-24/` external repo + `Projects/NMN (project).md` + `Business/NMN/` 知識層；2026-06-24 起 |
| **[[starmorph integration guide]]** | Strategy 1 「symlinks」approach (variant of B)；明寫 "simplest" for active coding |
| **[[parazettel Theo Stowell]]** | 維持 single vault + 獨立 website (Hugo) repo；Claude Code 喺 repo 處理 HTML/CSS，vault 經 plugin / MCP 入 context |
| **starmorph「Agents read, humans write」原則** | 哲學依據：keep Claude generated output OUT of personal vault |

## Setup recipe（建議步驟，新 project）

```bash
# Step 1: 起 repo
mkdir ~/code/myproj && cd ~/code/myproj
git init
# 寫 CLAUDE.md，反指 vault hub
cat > CLAUDE.md <<EOF
# MyProj — Claude Code Context

## Project nature
（描述 project 係咩）

## Vault correspondence (Model B)
Vault hub note: \`/Users/.../second-brain/Projects/MyProj (project).md\`
- 該頁 frontmatter \`code_path:\` 反指本 repo
- Log decisions / Next Actions 入該頁；唔好 log 入本 repo

## Tech stack / conventions
...
EOF
git add CLAUDE.md && git commit -m "init: project + Model B vault correspondence"

# Step 2: 起 vault control page
cd ~/AI/Claude/second-brain
# 抄 Meta/templates/project-overview.md 做新檔
cat > "Projects/MyProj (project).md" <<EOF
---
type: project
para: project
code_path: ~/code/myproj
status: active
created: $(date +%Y-%m-%d)
updated: $(date +%Y-%m-%d)
tags: [project]
---

# MyProj (project)

External repo: \`~/code/myproj\`

## Log
- $(date +%Y-%m-%d): project-start

## Key Decisions
（待補）

## Next Actions
（待補）

## Open Questions
（待補）
EOF

# Step 3: 加入 Projects hub MOC
# 編輯 wiki 嘅 Projects.md，加 [[MyProj (project)]] 連結
```

## Comparison cross-reference
- [[Vault-as-Everything (Pattern A)]] —— 「code 入 vault」嘅相對選擇；frictionless 但 mix
- [[Unified via MCP (Pattern C)]] —— Pattern B 嘅 enhancement，加 MCP 令 Claude 從 code session 都讀到 vault
- [[Claude + Obsidian Workflow Pattern Comparison]] —— 全 dimension matrix
- [[Claude + Obsidian Project Workflow]] —— synthesis 嘅 practical recipe（recommended for code projects）
