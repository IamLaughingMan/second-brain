---
type: comparison
para: resource
domain: obsidian-ai
title: "Claude + Obsidian Workflow Pattern Comparison (A vs B vs C)"
status: developing
created: 2026-06-26
updated: 2026-06-26
tags:
  - comparison
  - analyses
  - obsidian
  - ai
  - claude-obsidian-workflow
---

# Claude + Obsidian Workflow Pattern Comparison (A vs B vs C)

對比 [[Vault-as-Everything (Pattern A)]]、[[Linked Repo + Vault (Pattern B)]]、[[Unified via MCP (Pattern C)]] 三個 mainstream pattern 嘅 dimension matrix + decision tree。

## Full dimension matrix

| Dimension | A. Vault-as-Everything | B. Linked Repo + Vault | C. Unified via MCP |
|---|---|---|---|
| **Claude Code cwd** | `~/vault/` | `~/code/proj/` | `~/code/proj/` |
| **Project files location** | 喺 vault `Projects/` 入面 | 獨立 repo (vault 外) | 獨立 repo (vault 外) |
| **Vault git scope** | Vault + code 一齊 commit | Vault 純 personal/knowledge | Vault 純 personal/knowledge |
| **Code git scope** | 同 vault git，混 personal note | 獨立 repo | 獨立 repo |
| **Claude 對 vault context 嘅 access** | ✅ 即時、全部 | ⚠️ 要 manual cat / cd vault session | ✅ 經 MCP server 即時 query |
| **Setup 難度** | 🟢 低（裝 starter kit） | 🟡 中（雙 pointer convention） | 🔴 高（plugin + MCP + config） |
| **Maintenance 負擔** | 🟢 低 | 🟡 中（兩 pointer sync） | 🔴 高（plugin update / MCP debug） |
| **Privacy boundary**（AI 見唔見私密 note） | 🔴 模糊（全 vault） | 🟢 清晰（code-only） | 🟡 中（MCP 可控但要設） |
| **適合 code project 要 push GitHub** | ❌ 唔好 | ✅ 好 | ✅ 好 |
| **適合純 PKM/personal note** | ✅ 完美 | 🟡 OK 但 over-engineered | 🟡 OK 但 over-engineered |
| **kepano 大神 alignment** | ❌ 違反 vault separation principle | ✅ 對齊 | ✅ 對齊 |
| **Karpathy compounding wiki alignment** | 🟡 OK 但 risk pollution | ✅ 對齊（vault 純 curation） | ✅ 對齊 |
| **「Agents read, humans write」** | ❌ 易 violated | ✅ 對齊 | ✅ 對齊 |
| **多 project 平行 scale** | 🟡 一個 vault 塞晒 messy | ✅ 每 repo 獨立 cwd | ✅ 每 repo 獨立 + MCP 跨查 |
| **跨 AI client（Cursor/Codex/Gemini）** | 🟡 限 vault scope | 🟡 manual | ✅ MCP protocol-agnostic |
| **Starter-kit popularity（GitHub stars proxy）** | 🟢 最高（ballred 1.5k★ 等） | 🟡 中（starmorph blog level） | 🟡 中（jacksteamdev / iansinnott） |
| **Auto-commit hook scope** | 🟢 一招 cover 晒 | 🟡 vault + repo 兩條 hook | 🟡 同 B |
| **Vault sync 速度（如用 Obsidian Sync）** | 🔴 慢（含 code/build artifact） | ✅ 純 markdown 快 | ✅ 同 B |
| **Obsidian Skills（kepano 35.9k★）兼容** | ✅ 直接 | 🟡 要透過 MCP 或 cd vault | ✅ 直接 |

## Decision tree

```
你嘅 project 性質？

├─ 純 PKM／個人筆記、無 push remote、無合作
│  └─ ✅ Pattern A（frictionless、starter kit 即可）
│
├─ Code project 要 git push GitHub／開源／合作
│  ├─ 需要 vault context（reference 你 vault decisions / past research）？
│  │  ├─ 經常需要 → ✅ Pattern C（B + MCP）
│  │  └─ 偶爾 → ✅ Pattern B（用得到時手動 cat / 開 vault session）
│  └─ 唔需要 vault context（純獨立 code project）
│     └─ ✅ Pattern B（係 starmorph 認 "simplest"）
│
└─ 商業 project / sensitive data / IP
   └─ ✅ Pattern B 或 C（永遠唔好 A）
```

## 進一步維度

### 1. Privacy / data leak surface
- **A**：Claude 寫 code 同時見全 vault；如果 vendor cache prompts，全 vault 入 prompt history（最大暴露）
- **B**：Claude 只見 repo files + repo CLAUDE.md（最小暴露）
- **C**：Claude 見 repo + MCP query 嘅 vault subset；可控但需要設 MCP server permissions

### 2. Context window economics
- **A**：cwd = 整個 vault，Claude session 開頭 load vault CLAUDE.md + onboard files；session context 易 bloat
- **B**：cwd = repo only，context 細
- **C**：cwd = repo + on-demand MCP query；按需要 load vault subset，最 efficient

### 3. Cross-AI 兼容（Codex／Cursor／Gemini）
- **A**：依賴 starter kit 嘅 commands；如果用其他 AI agent，要重 port slash commands
- **B**：純 file 結構，agent-agnostic；用任何 agent 都 work
- **C**：MCP protocol-agnostic，最 future-proof

### 4. Skills / template availability
- **A**：豐富（ballred 10 skills、AgriciDaniel 嘅 wiki/save/think/canvas、heyitsnoah claudesidian）；多數 vault-coupled
- **B**：較少 dedicated；但 vault 嘅 [[Karpathy LLM Wiki Pattern]] + Meta/templates/ 可以借 → repo CLAUDE.md
- **C**：Obsidian Skills（kepano）+ MCP tools 為主

## 推薦 mapping（依使用者 profile）

| Profile | 推薦 |
|---|---|
| 「新手第一次試 Claude + Obsidian」 | A（starter kit, ballred） |
| 「想 production code project + 用 vault 做 reference」 | B（你 NMN 已係呢個）|
| 「老手有多 project、想 vault 內容自動可查」 | C |
| 「commercial project 同 client 合作」 | B（隔離強制） |
| 「純 second-brain compounding、無 code」 | A 或 root-level vault（甚至 hybrid，例如你 vault auto-commit hook + Stop hook） |
| **你（vault 已有 multi-pattern，新開 NMN 樣 project）** | **B**（per [[Claude + Obsidian Project Workflow]] 推薦） |

## 反例 / 唔屬呢三個 pattern

- **Notion + Claude API**：唔係 Obsidian、唔涉 local file
- **VS Code + Copilot + 隨手 markdown note**：無 vault 結構、無 PKM
- **Claude Desktop only + Obsidian MCP**：屬 C 嘅 variant（client 唔係 Claude Code）；SMU library 推呢條

## Sources（reference-grade）

- [[ballred-obsidian-claude-pkm]] —— Pattern A 代表 starter kit
- [[starmorph integration guide]] —— 明確列 3 strategies，A/B/C 概念雛形
- [[parazettel Theo Stowell]] —— Pattern B / C hybrid 實踐者
- [[whytryai Build Second Brain]] —— Pattern A 嘅 vault-as-subfolder 變奏
- [[mindstudio AI Second Brain Guide]] —— Pattern A 嘅 7-folder 結構
- [[stephango.com vault]] —— kepano 個人 vault setup，多 vault 拆分原則
- [[kepano-obsidian]] —— 公開 vault template
- [[jdhwilkins AI Task System]] —— Pattern A 嘅 task-system 變奏

## Cross-reference
- [[Vault-as-Everything (Pattern A)]] · [[Linked Repo + Vault (Pattern B)]] · [[Unified via MCP (Pattern C)]]
- [[Claude + Obsidian Project Workflow]] —— practical 決策 + Pattern B recipe
- [[AI/Obsidian/overview|Overview]] —— catalog-narrative
