---
type: synthesis
para: resource
domain: obsidian-ai
title: "Claude + Obsidian Project Workflow"
status: developing
created: 2026-06-26
updated: 2026-06-26
tags:
  - synthesis
  - obsidian
  - ai
  - claude-obsidian-workflow
---

# Claude + Obsidian Project Workflow

> [!summary] TL;DR
> 1. **Code project（要 push GitHub / 商業 / 合作）→ Pattern B（Linked Repo + Vault）** —— 同你 NMN 用緊嘅 model 一樣，starmorph blog 認呢個 "simplest"。
> 2. **純 PKM / personal note project → Pattern A（Vault-as-Everything）** —— starter kit 例如 ballred/obsidian-claude-pkm 即可。
> 3. **多 project 老手要跨 query vault → Pattern C（Pattern B + MCP）** —— jacksteamdev/obsidian-mcp-tools 或 iansinnott/obsidian-claude-code-mcp。
> 4. **大神觀點（kepano、Karpathy、Matuschak）一致 favour 分層**（B 或 C 而非 A）—— 「Agents read, humans write」、「avoid mixing scopes」。
> 5. **starter-kit popularity（ballred 1.5k★）≠ best practice** —— 受眾係新手；power user 通常 B / C。

---

## 1. 個 fundamentally 問題

你已經有 Obsidian vault 做 PKM（個人知識管理）。而家想開 project 用 Claude Code。**揀錯 pattern 嘅成本好高**：
- A 揀錯 → personal vault 同 code git history 混晒、AI 唔小心見私密 note、難 reverse
- B 揀錯（其實適合 A 嘅情境用咗 B）→ over-engineered、雙 pointer 維護負擔
- C 揀錯 → plugin debugging time sink

呢頁綜合 [[Vault-as-Everything (Pattern A)]] / [[Linked Repo + Vault (Pattern B)]] / [[Unified via MCP (Pattern C)]] 三個 concept + [[Claude + Obsidian Workflow Pattern Comparison]] matrix，提供 practical 決策框架 + Pattern B recipe（your most likely 推薦）。

---

## 2. 決策框架（按項目 dimension 揀）

### Step 1: 項目係咩性質？
| 性質 | 推薦 |
|---|---|
| 純 PKM、純筆記、無 code、無 push | **A** |
| Code project、要 GitHub push / 開源 / 多人 | **B**（或 C） |
| Code project + 想 Claude 隨時讀 vault knowledge | **C** |
| 商業 / sensitive data / IP | **B 或 C**（永遠唔好 A） |
| Throwaway script | 唔需要 vault correspondence、直接 code |

### Step 2: 你嘅 setup 經驗？
| 經驗 | 推薦 |
|---|---|
| 第一次試 Claude + Obsidian | A starter kit 入門、後期再拆 |
| 已用過 Claude Code、有 git workflow | **B**（你呢個 level） |
| 老手 + 多 project + 想 vault 自動 query-able | **C**（B 嘅延伸） |

### Step 3: 大神／哲學偏好？
| 偏好 | 推薦 |
|---|---|
| kepano「avoid mixing scopes」 | B / C |
| Karpathy「LLM as compiler over curated wiki」 | B（vault 純 compounding） |
| Matuschak「evergreen notes by human」 | B / C（agent 唔 auto-populate） |
| 「方便就好」 | A |

→ **大神普遍 favour 分層（B/C），但 starter-kit popularity 反映受眾不同**（新手 + frictionless > best practice）。

---

## 3. 你 vault 嘅 prior art（已驗證例子）

| Vault 已有 | Pattern | 啟示 |
|---|---|---|
| **NMN project**（2026-06-24 起）：`~/AI/Claude/nmn-2026-06-24/` external repo + `Projects/NMN (project).md` 用 `code_path:` 互指 + `Business/NMN/` 知識層 | **B 純粹實作** | ✅ 適合任何商業／code project；後續 project 沿用 |
| **Claude history Stop hook**（2026-06-19）：自動 mirror conversations 入 `Claude history/<date>/` | 混合：vault 內動作 + state 喺 `~/.claude/state/` | 純 vault-internal automation，唔係 A/B/C 三 pattern 本身 |
| **Vault `.claude/settings.json` auto-commit hook**：wiki/raw/.vault-meta/Business 改動自動 commit | A-typical（vault 自身 git workflow） | Vault 自己係 git repo、自身 maintain，唔同 project repo |
| **`mcp__obsidian-vault__*` MCP server**：user-level config | C foundation | 你已經有 MCP 嘅 plumbing；要 Pattern C 全套只需加 jacksteamdev plugin |
| **[[Recording Claude Conversations in Obsidian]]** | Methodology 文 | 唔係 pattern 本身、係 research |

→ **你 vault 係多 pattern 並存**。新 project 選 pattern 唔係換 vault，而係 per-project 揀。

---

## 4. Recommended recipe — Pattern B（for new code project）

### 預期 deliverable
- 外部 repo（git push 去 GitHub）
- Vault 入面 `Projects/<Name> (project).md` 控制頁
- Optional：`Business/<Name>/` 或 `wiki/<Domain>/<Name>/` 知識層

### Setup 步驟

#### Step 1: 起外部 repo
```bash
cd ~/AI/Claude
mkdir <name>-$(date +%Y-%m-%d) && cd <name>-$(date +%Y-%m-%d)
git init
```

#### Step 2: 寫 repo `CLAUDE.md`（Model B 反指 vault）
```markdown
# <ProjectName> — Claude Code Context

## Project nature
（描述項目係咩、target、stack、constraints）

## Vault correspondence (Model B)
Vault hub note: `/Users/.../second-brain-2026-06-06/Projects/<Name> (project).md`
- 該頁 frontmatter `code_path:` 反指本 repo
- Log decisions / Next Actions / Open Questions 入該頁
- 知識層（如有）：`Business/<Domain>/` 或 `wiki/<Domain>/<Name>/`

## Tech stack / conventions
（具體）

## Permissions / scope
（如有 sensitive data／API key handling）
```

#### Step 3: 起 vault 控制頁
抄 `Meta/templates/project-overview.md` 做模板，加入 frontmatter:
```yaml
---
type: project
para: project
code_path: ~/AI/Claude/<name>-<date>
status: active
created: 2026-XX-XX
updated: 2026-XX-XX
tags: [project]
---
```
Body section：
- `## Log`（append-only）
- `## Key Decisions`
- `## Next Actions`
- `## Open Questions`
- `## Resources / Related`（link vault knowledge）

**檔名 convention**：`Projects/<Name> (project).md`（加「(project)」suffix 避免同 [[Business/X/X.md]] 知識 hub 撞名，參考 [[Projects/NMN (project)]]）。

#### Step 4: 登記 [[Projects]] hub
編輯 `wiki/Projects.md` MOC，加入 `[[<Name> (project)]]` 連結。

#### Step 5: 如有獨立知識領域 → 起 `Business/<Name>/` 或 `wiki/<Domain>/<Name>/`
跟 [[project-business-knowledge-layer]] 規矩：
- 商業／供應商／市場研究 → `Business/<Name>/`（rotation: typed-folder when content 累積到 trigger）
- 一般領域研究 → `wiki/<Domain>/`
- 知識頁 frontmatter `domain: <name>`，互指 project 控制頁

#### Step 6: Auto-commit hook scope（檢查）
Vault auto-commit hook（`.claude/settings.json`）覆蓋 `wiki/ raw/ .vault-meta/ Business/`；**你 project repo 唔喺 hook scope**，由你自己 `git commit` + 自己 terminal `git push`（per [[project-github-remote]]）。

#### Step 7: log `project-start`
- `wiki/log.md` append `## [HKT] project-start | <name>`
- mirror 落 `~/AI/Claude/General/claude-activity-log.csv`（per [[feedback-dual-log-vault-and-global]]）

### 對應現實
```
你做 code：           cd ~/AI/Claude/<name>-<date> && claude
你寫 decision log：    Obsidian 打開 vault → Projects/<Name> (project).md → ## Log 加 entry
你做 research：       Obsidian 打開 vault → Business/<Name>/<新頁>.md 或 wiki/<Domain>/<新頁>.md
```

---

## 5. 進階：何時加 Pattern C（MCP）

當你達到以下任一情況：
- **多 project（≥3）平行**，經常 forget「個 decision 上次 log 喺邊」
- **Vault 大**（>500 篇），grep / wikilinks 唔夠快揾相關 context
- **Code session 經常需要 vault knowledge**（research 結論、prior decision、客戶 spec）

加 MCP 步驟（per [[Unified via MCP (Pattern C)]]）：
1. Obsidian 裝 plugin（jacksteamdev/obsidian-mcp-tools 或 iansinnott/obsidian-claude-code-mcp）
2. ~/.claude/settings.json 加 MCP server entry
3. 重啟 Claude Code session

你已經有 `mcp__obsidian-vault__*` MCP user-level server，可能已經夠用。加 jacksteamdev 只係多 semantic search 嘅 enhancement。

---

## 6. 何時 hybrid（A + B）

實際 vault 通常**多 pattern 並存**（同你 vault 一樣）：
- Vault 自身 = A typical（vault has its own git + auto-commit + `.claude/`）
- 個別 project = B（external repo + vault hub）
- 跨查 = C（MCP server）

→ 三 pattern **唔互相排斥**。重要係**個別 project 揀啱 pattern**，唔係 vault 整體鎖死一個。

---

## 7. Skills / Templates 資源

### 你 vault 已裝
- `kepano obsidian-skills` (`obsidian@obsidian-skills`)：5 skills（obsidian-markdown、obsidian-bases、obsidian-cli、json-canvas、defuddle）
- `obsidian-vault` MCP server（user-level）
- `obsidian-visual-skills`（excalidraw-diagram、mermaid-visualizer、obsidian-canvas-creator）
- Auto-commit hook（自製，per [[project-auto-commit-hook-bug]]）
- Stop hook（per [[project-claude-history-hook]]）
- Playwright MCP（per [[project-playwright-mcp]]）

### 你 vault 已有 template
- `Meta/templates/project-overview.md` —— 直接套 Pattern B step 3
- `Meta/templates/bookmark.md` —— bookmark pipeline 模板
- `Meta/templates/area/concept/entity/source/synthesis.md` —— Karpathy 6 type 模板

### 外部 reference-grade（已 bookmark）
全部喺 `Bookmarks/AI/Claude Code/Obsidian Integration/`：
- ballred/obsidian-claude-pkm （A 代表 starter kit）
- kepano-obsidian + stephango.com/vault（大神 vault template + 寫法）
- starmorph integration guide（3 strategies 分類最清晰）
- parazettel Theo Stowell（B/C hybrid 實踐）
- whytryai、mindstudio、jdhwilkins（Pattern A blog post）
- jacksteamdev/obsidian-mcp-tools、iansinnott/obsidian-claude-code-mcp（MCP server）
- educalvolopez、dev.to stevengonsalvez（kepano Obsidian Skills review）

### 你 explicit reject 嘅
- AgriciDaniel claude-obsidian plugin（per [[feedback-no-claude-obsidian-plugin]]，2026-06-16 removed）

---

## 8. 信心評級

| Claim | 證據強度 |
|---|---|
| Code project 用 Pattern B 最佳 | 🟢 高（starmorph 明寫 "simplest"；kepano principle；你 NMN 驗證；Karpathy + Matuschak align） |
| Pure PKM 用 Pattern A | 🟢 高（多 starter kit 1.5k★+；frictionless） |
| Pattern A 違反大神 mix-scopes 原則 | 🟢 高（kepano 自己 published site 都拆 vault） |
| MCP (C) 係 future-proof 方向 | 🟡 中（protocol 新、plugin 仲在發展、debug 較複雜） |
| 你 NMN 用 Pattern B 係 correct choice | 🟢 高（同 starmorph、Theo Stowell 一致） |
| 「網上最多人用 A」 | 🟡 中（starter-kit 受眾 bias；power user 未必） |

---

## 9. Open questions

- **Pattern B 嘅 vault context bottleneck**：而家你 code session 想讀 vault 嘅 decision log 點做？manual `cat` 定 open 第二個 Claude session？值得試 jacksteamdev MCP 加 vault semantic search？
- **Vault Skills 跨 client（Codex/Cursor）兼容**：你 vault 嘅 skill catalog（`Meta/extensions/skills.md`）幾多係 Claude-only？
- **多 project decision log 跨頁查**：而家 NMN 有 log、Pillow research 有 log、之後第 3 個 project 又有 log；點 search「邊個 project 喺 2026 年某月做過咩 decision」？候選：vault `.base` view across `type: project` notes。

## Sources（reference-grade）

科學／權威：（pillow research 嘅 sources 唔適用呢個 topic；以下係 community / 大神 / 實作者）

- **GitHub starter kits**：
  - [[ballred-obsidian-claude-pkm]] —— 1.5k★，Pattern A 代表
  - [[kepano-obsidian]] —— 大神 vault template
  - [[Obsidian Skills (kepano)]] —— 35.9k★，官方 agent skill kit
  - [[jacksteamdev obsidian-mcp-tools]] —— MCP semantic search
  - [[iansinnott obsidian-claude-code-mcp]] —— MCP WebSocket bridge
- **Long-form integration guide**：
  - [[starmorph integration guide]] —— 3 strategies 分類最清晰
  - [[whytryai Build Second Brain]] —— vault-as-subfolder
  - [[mindstudio AI Second Brain Guide]] —— 7-folder + CLAUDE.md
- **Practitioner blog**：
  - [[parazettel Theo Stowell]] —— PARAZETTEL 創始人、B/C hybrid 實踐
  - [[jdhwilkins AI Task System]] —— task system + obsidian-cli skill
  - [[stephango.com vault]] —— kepano 寫嘅 vault setup
- **Educational / 大神觀**：
  - [[educalvolopez Obsidian Agents]] —— 西班牙 second-brain practitioner
  - [[dev.to stevengonsalvez Obsidian Skills review]] —— kepano Skills 入門

→ 全部喺 `Bookmarks/AI/Claude Code/Obsidian Integration/` 有 full archive。
