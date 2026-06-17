---
type: meta
title: "Hooks"
para: resource
status: active
created: 2026-06-17
updated: 2026-06-17
tags:
  - meta
  - extensions
  - hooks
---

# Hooks

Catalog 頁。Hub：[[extensions]]。Claude Code hook 文檔：https://code.claude.com/docs/en/hooks

## 兩個 settings layer

| Layer | 物理位置 | scope |
|---|---|---|
| **Vault-level** | `<vault>/.claude/settings.json` | 只喺呢個 vault 生效 |
| **User-level** | `~/.claude/settings.json` | 所有 project／session 生效 |

## 而家裝咗

### Vault-level（`.claude/settings.json`）

| Event | 用途 | Command |
|---|---|---|
| **PostToolUse** | wiki/raw/.vault-meta auto-commit（HKT 時間戳） | 自含 shell：`git add -- wiki/ raw/ .vault-meta/`、檢查 `.vault-meta/auto-commit.disabled` toggle、有改動就 `git commit ... -m "wiki: auto-commit <HKT>"` |

**重要 caveat（記低 2026-06-17）**：實測 hook **可靠咁 stage 檔**，但 PostToolUse 入面執行嘅 `git commit` 步驟**有時唔生效**——只 stage、唔 commit。Workaround：收工時手動 `git commit -- wiki/ raw/ .vault-meta/ -m "wiki: auto-commit $(TZ='Asia/Hong_Kong' date '+%Y-%m-%d %H:%M %Z')"` finalise。詳見 memory `[[project-auto-commit-hook-bug]]`。

Hook **只 commit、不 push**（Claude bash 無 TTY；push 自己終端機行）。Scope 只覆蓋 `wiki/ raw/ .vault-meta/` —— `Meta/`／`Bookmarks/`／`Projects/`／`Inbox/`／`CLAUDE.md`／`.claude/`／`.obsidian/` 都係**手動 commit**。

### User-level（`~/.claude/settings.json`，跨 project）

| Event | 用途 | Command |
|---|---|---|
| **statusLine** | menu bar 嘅 `usage.app` 統計埋落 status bar | `python3 ~/.claude/usage-statusline.py` |
| **UserPromptSubmit** | 收工提醒 | `~/.claude/farewell-reminder.sh` |
| **Stop / session-end** | 寫 session-end CSV | `~/.claude/log-session-end.sh` |
| **PreToolUse (Bash matcher)** | RTK token 節省 | `rtk hook claude` |
| **PostToolUse (any matcher)** | tool-call audit log | `python3 ~/.claude/audit-log.py` → `~/AI/Claude/General/claude-audit-log.jsonl` |

注意：user-level 嘅 audit hook 已經自動記每個 tool call；vault 嘅 `wiki/log.md` ＋ 全局 CSV 嘅 dual-log 係另一個層次（**curated wiki 事件**，唔重複 audit log）。詳見 memory `[[feedback-dual-log-vault-and-global]]`。

## 規矩

- 改動 hook → update 呢頁 + append `wiki/log.md` + 鏡射 CSV（dual-log）+ 手動 commit（Meta/ + .claude/ 都 hook scope 外）。
- 唔好倒過嚟讓 hook 處理自己嘅 commit（循環風險）。
- 唔可以 skip hook（除非 user 明確要）：跟 parent CLAUDE.md。
