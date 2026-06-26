---
type: concept
para: resource
domain: obsidian-ai
title: "Vault-as-Everything (Pattern A)"
status: developing
created: 2026-06-26
updated: 2026-06-26
tags:
  - concept
  - obsidian
  - ai
  - claude-obsidian-workflow
---

# Vault-as-Everything (Pattern A)

## Definition
**Claude Code（或其他 agent）直接喺 Obsidian vault folder 入面 run**（`cd ~/vault && claude`）。Vault 既係 PKM（個人知識管理 / Personal Knowledge Management）storage、又同時係 project workspace。Code project files（如有）放 vault 內 `Projects/<name>/` folder，每個 project 有自己嘅 `CLAUDE.md`。

## How it works

```
~/Documents/MyVault/
├── CLAUDE.md                    ← 整個 vault 嘅 context、agent 進入時讀
├── CLAUDE.local.md              ← 個人 override，gitignored
├── .claude/
│   ├── commands/                ← slash commands
│   ├── skills/                  ← /daily, /weekly, /push, /onboard…
│   ├── agents/                  ← specialized AI agents with memory
│   ├── hooks/                   ← auto-commit、session init
│   ├── output-styles/           ← coach.md 等 mode
│   └── settings.local.json
├── Daily Notes/
├── Goals/
├── Projects/
│   └── My App/
│       ├── CLAUDE.md            ← project-specific context
│       ├── src/                  ← code 喺 vault 入面
│       └── notes.md
├── Inbox/, Areas/, Resources/, Archive/, Templates/
└── .git/                        ← vault git
```

進入方式：
```bash
cd ~/Documents/MyVault
claude /onboard       # load vault + skills context
claude /daily         # create today's note
claude                # 對話開始
```

## Pros

- **零 friction install** —— 一個 starter kit 即用（ballred、AgriciDaniel 等）
- **Claude 即時讀晒所有 context** —— 無需 manual paste 任何 note
- **Slash commands 可以 reach 任何 note**（`/weekly` review、`/task` add 等）
- **Agent memory + skill chain**—— 全部 inside vault scope
- **Auto-commit hook** 一招 cover 晒所有 vault 改動

## Cons

- **Mix code + personal vault git** —— `git log` 同時記 todo 改動 + code refactor，污染 history、難 cherry-pick
- **AI 操作邊界模糊** —— Claude 寫 `Projects/MyApp/src/` 時都見到 `Daily Notes/2026-06-26.md` 嘅私密內容；privacy 邊界一旦俾 third-party AI vendor scrape 就 leak 多
- **違反 kepano 大神原則** —— 「avoid splitting content into multiple vaults」係正面，但「**避免將 personal + work content 混入同一個 publish/share scope**」，所以佢自己 published site 都另開 vault
- **「Agents read, humans write」破口** —— Claude generated note 易污染 personal vault 嘅 compounding（Karpathy 派）
- **Repo push 同 vault git 撞** —— 如果 project 又要 GitHub push，要分 branch／subtree 處理；複雜化
- **Vault 越行越大、Obsidian sync 變慢**（含 code、build artifacts）

## When to use

✅ Pure PKM / 個人筆記 project（無 deploy、無 push remote、無合作）  
✅ Solo experiment、short-lived prototype  
✅ 初學者：starter kit 入手最快，後期再拆都未遲

❌ Code project 要 GitHub push  
❌ 商業 project 含 sensitive data／IP（mixing 風險）  
❌ 多人合作 project（其他人唔需要你 personal note）

## Real-world examples

| 項目 | Stars | 備註 |
|---|---|---|
| **[[ballred-obsidian-claude-pkm]]** | 1.5k★ | 「execution system 連 3-year vision 到 daily」；含 4 agents + 10 skills；vault 自身 + `.claude/` 一齊 ship |
| **[[AgriciDaniel claude-obsidian]]** | — | 「self-organizing AI second brain」based on Karpathy LLM Wiki pattern；**你 reject 咗**（[[feedback-no-claude-obsidian-plugin]]） |
| [[mindstudio Build AI Second Brain]] | blog post | Inbox/Projects/Areas/Resources/Archive/AI/Templates 7 folders + vault-as-cwd |
| [[jdhwilkins AI Task System]] | blog post | 6 note types、`todo-vault` skill atop `obsidian-cli` |
| [[heyitsnoah claudesidian]] | — | Inbox/Projects/Areas/Resources/Archive 結構 |

## Comparison cross-reference
- [[Linked Repo + Vault (Pattern B)]] —— 「code 出 vault」嘅相對選擇
- [[Unified via MCP (Pattern C)]] —— code 出 vault 但 vault knowledge 仍 reachable
- [[Claude + Obsidian Workflow Pattern Comparison]] —— 三 pattern 全 dimension matrix
