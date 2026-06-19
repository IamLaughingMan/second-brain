---
type: bookmark
para: resource
domain: ai-tools
title: "Superpowers (obra)"
url: "https://github.com/obra/superpowers"
summary: "Claude Code（及多 agent）plugin：14 個可組合 skill + session-start hook，強制一套 brainstorm→design→plan→TDD→review→finish-branch 開發方法論（Jesse Vincent / Prime Radiant，MIT）"
status: active
created: 2026-06-19
updated: 2026-06-19
related:
  - "[[skills]]"
  - "[[plugins]]"
  - "[[hooks]]"
tags:
  - bookmark
  - ai-tools
  - claude-code
  - plugin
  - skills
  - workflow
---

# Superpowers (obra)

- URL: https://github.com/obra/superpowers
- Saved date: 2026-06-19
- Topic: Claude Code plugin —— 一套「coding agent 開發方法論」（skills library + session-start hook）
- Status: active（**未安裝・parked reference**——評估完，使用者決定擺住先；已喺 `~/AI/Claude/CLAUDE.md` 加「候選工具提醒」，將來 code project 啱用先輕提，見 My Notes）

## Why I saved this

使用者掉嚟評估：想知有咩用、同現有 extensions 撞唔撞。結論（詳見 My Notes）：**無硬技術衝突**，但同 built-in `code-review`/`verify`/`write-tests` + user command 有**功能重疊**，且 session-start hook 會**每 session 注入一套硬性開發方法論**，同你 `~/.claude/CLAUDE.md`「Simplicity / Surgical」精神 + vault session-start 協定有**理念競爭風險**。對 vault 筆記工作基本無關，主要值喺**code project**。

## Summary

- **係咩**：「a complete software development methodology for your coding agents」——唔止係工具，係一套**強制流程** built on 可組合 skills + 一段 initial instructions 確保 agent 真係跟住用。
- **流程 7 步**：① Brainstorming（寫 code 前用問題 refine idea）→ ② Design validation → ③ Planning（拆成 2–5 分鐘 task）→ ④ Implementation（subagent-driven + 兩階段 review）→ ⑤ Testing（強制 RED-GREEN-REFACTOR TDD）→ ⑥ Code review（按 plan 審、severity-based blocking）→ ⑦ Finishing branch（merge/PR 決策 + cleanup）。
- **作者／License**：Jesse Vincent（obra）/ Prime Radiant ・ MIT。
- **支援 agent**：Claude Code、Antigravity、Codex、Cursor、Gemini CLI、GitHub Copilot CLI、Kimi、OpenCode、Pi、Factory Droid 等。

## Key Takeaways

- **安裝（Claude Code）**：
  - 官方 marketplace：`/plugin install superpowers@claude-plugins-official`
  - 自家 marketplace：`/plugin marketplace add obra/superpowers-marketplace` → `/plugin install superpowers@superpowers-marketplace`
- **14 skills**（4 類；Claude Code 下會 namespaced，估 `superpowers:<name>`）：
  - Testing：`test-driven-development`
  - Debugging：`systematic-debugging`、`verification-before-completion`
  - Collaboration：`brainstorming`、`writing-plans`、`executing-plans`、`dispatching-parallel-agents`、`requesting-code-review`、`receiving-code-review`、`using-git-worktrees`、`finishing-a-development-branch`、`subagent-driven-development`
  - Meta：`writing-skills`、`using-superpowers`
- **Hook**：裝一個 **session-start hook**（令 plugin 由第一 message 就 active，注入「用 superpowers」指令）。
- **MCP**：無 bundle、無要求。
- **無明確 registered slash commands**（文檔未列）。

## My Notes — 同現有 extensions 撞唔撞（2026-06-19 評估）

**核對對象**：`[[skills]]`（built-in 14 + obsidian 5 + user command 4）、`[[hooks]]`（vault PostToolUse；user UserPromptSubmit/SessionEnd/PreToolUse/PostToolUse/Stop + statusLine）。

| 維度 | 撞？ | 細節 |
|------|------|------|
| **Skill 檔名碰撞** | ❌ 無 | superpowers skill 行 `superpowers:` namespace，同 `obsidian:` 與 built-in 名唔重疊。 |
| **功能重疊** | ⚠️ 有 | `requesting/receiving-code-review` ↔ built-in `code-review`/`review`；`verification-before-completion` ↔ built-in `verify`；`test-driven-development` ↔ user command `write-tests`；`security` 無對應但 user 有 `security-audit`。→ 兩條並行路徑，易亂揀。 |
| **Hook event 碰撞** | ❌ 無（直接） | 你而家**無** SessionStart hook（有 UserPromptSubmit/SessionEnd/PreToolUse/PostToolUse/Stop）。superpowers 加 SessionStart，event 唔撞。 |
| **理念競爭** | ⚠️ 主要風險 | superpowers SessionStart **每 session 硬性注入**一套 opinionated 重流程（brainstorm→plan→TDD→branch/PR）。同你 `~/.claude/CLAUDE.md`「Simplicity First / Surgical Changes」+ vault 自家 session-start 協定（log session-start→讀 memory）**競爭 context／指令權威**。 |
| **scope／成本** | ⚠️ | 若 user-level enable（似你 obsidian-skills），14 skill + SessionStart 注入會喺**每個 project**載入——包括 vault 筆記工作（TDD/branch 對筆記無關），徒增 token／noise。 |
| **適用面** | ✅ code project | 對你嘅 **code repo**（vault `code_path:` 指嗰啲）有實值；對 Obsidian vault 本身基本無關。 |

**建議**：若試 → **per-project enable（淨係 code repo 嘅 `.claude/settings.json`）**，**唔好** user-level，避免污染 vault session。先試 read-only 心態，留意佢 SessionStart 指令同你 CLAUDE.md guidelines 邊個贏。**唔建議**而家裝落全局。

## Related
- [[skills]] —— extensions skills catalog（重疊對象）
- [[hooks]] —— extensions hooks catalog（SessionStart 落點）
- [[Bookmarks]]

<!-- ===== ARCHIVE BELOW — README 內容摘錄（WebFetch 2026-06-19），掃描/triage 時可跳過 ===== -->

## Full Content (archived)
> 來源：https://github.com/obra/superpowers　・　WebFetch 抽取 2026-06-19 HKT（結構化摘錄，非 byte-verbatim；GitHub repo 受版本控制，link-rot 風險低）。

**What this project is**：Superpowers is a complete software development methodology for your coding agents, built on top of a set of composable skills and some initial instructions that make sure your agent uses them.

**What it does** — 引導 coding agent 行一個結構化流程：
1. Brainstorming — Refines ideas through questions before writing code
2. Design validation — Presents specifications in digestible sections
3. Planning — Breaks work into 2-5 minute tasks with exact specifications
4. Implementation — Uses subagent-driven development with two-stage review
5. Testing — Enforces RED-GREEN-REFACTOR test-driven development
6. Code review — Reviews against plans with severity-based blocking
7. Branch finishing — Handles merge/PR decisions and cleanup

**Author & Org**：Jesse Vincent and Prime Radiant (https://primeradiant.com)

**Installation (Claude Code)**：
- `/plugin install superpowers@claude-plugins-official`
- `/plugin marketplace add obra/superpowers-marketplace` 然後 `/plugin install superpowers@superpowers-marketplace`
- 其他 agent（Antigravity / Codex / Cursor / Gemini CLI / Copilot CLI / Kimi / OpenCode / Pi / Factory Droid）用各自 plugin install 指令。

**Components — Skills Library（14 skills，4 類）**：
- Testing：test-driven-development
- Debugging：systematic-debugging, verification-before-completion
- Collaboration：brainstorming, writing-plans, executing-plans, dispatching-parallel-agents, requesting-code-review, receiving-code-review, using-git-worktrees, finishing-a-development-branch, subagent-driven-development
- Meta：writing-skills, using-superpowers

**Hook**：plugin 嘅 session-start hook 令 Superpowers 由第一 message 就 active（GitHub 頁以 Antigravity 為例說明）。

**MCP**：無 bundle／無要求。**Slash commands**：文檔未明確列出。

**Prerequisites**：一個受支援嘅 coding agent。**License**：MIT。

## Key Comments
（GitHub repo，非社交媒體、原頁無公開留言區 → 不適用。reference source（repo）link-rot 風險低。）
