---
type: bookmark
para: resource
domain: ai-tools
title: "claude-auto-retry"
url: "https://github.com/cheapestinference/claude-auto-retry"
status: active
created: 2026-06-19
updated: 2026-06-19
related:
  - "[[Software]]"
tags:
  - bookmark
  - ai-tools
  - claude-code
  - cli
  - rate-limit
  - tmux
  - github
---

# claude-auto-retry

- URL: https://github.com/cheapestinference/claude-auto-retry
- Repo: 126 ★ ・ MIT ・ JavaScript（純 Node，零依賴）・ Node ≥18 ・ default branch `master`
- Saved date: 2026-06-19
- Topic: 撞到 Anthropic 訂閱 rate limit 時，自動等 reset + 送「continue」續做
- Status: active（**已裝 + 已驗證 work**，見 My Notes）

## Why I saved this

你**已經裝咗**呢個工具（[[Software]] catalog：`claude-auto-retry 0.2.2`，npm -g + zshrc wrapper）。今次順手 bookmark 個源 repo + 驗證佢 work。解決嘅痛點：跑長／過夜／AFK task 時撞「5-hour limit reached」會卡死，要人手返嚟打「continue」—— 呢個工具自動化呢一步。

## Summary

- **做咩**：偵測 Claude Code 嘅 rate-limit 訊息（如 `5-hour limit reached - resets 3pm`）→ parse reset 時間（timezone-aware、DST-safe）→ 等到 reset + 60s margin → 確認 Claude 仍係前景 process → 經 tmux `send-keys` 自動送「continue」。返到嚟發現 task 做完。
- **機制**：zshrc 注入 `claude()` shell function → 喺 **tmux** session 內跑 claude + 背景 monitor（每 5 秒 poll tmux pane，~0% CPU）。
- **點解 tmux**：斷線（SSH drop／關 terminal／laptop sleep）tmux 照running，monitor 照等；`tmux attach` 返去就見到 Claude 繼續做。**呢個係勝過 wrapper script 嘅關鍵**。
- **裝法**：`npm i -g claude-auto-retry && claude-auto-retry install`（自動裝 tmux + 注入 shell wrapper）。
- **特點**：零 workflow 改變（照打 `claude`）、零依賴、可配置（retry 次數/margin/pattern/訊息）、`--print` mode 支援、bad config fallback safe default。

## My Notes — 已裝 + 驗證（2026-06-19）

**Verdict：裝得啱、組件齊全、work。** 逐項驗：
- Binary `0.2.2`（= npm 最新）@ `~/.npm-global/bin/claude-auto-retry` ✅
- zshrc `claude()` wrapper（82–101 行，有 re-entrancy guard `CLAUDE_AUTO_RETRY_ACTIVE` + trap save/restore，寫得好）✅
- `launcher.js` 存在 ✅ ・ tmux `3.6b` 裝咗 ✅
- `claude-auto-retry status` → 「No activity today」= **健康**（被動工具，今日冇撞 limit）✅
- **被動性質**：平時靜，**淨係 hit rate limit 先動**；要真正見到 retry 要真係撞 limit。log 喺 `~/.claude-auto-retry/logs`。
- 子指令：`install` / `uninstall` / `status` / `logs`（tail 今日 log）/ `version`。

### ⚠️ 與 cmux 不相容（2026-06-19 實證）
- 喺 **cmux**（Ghostty-based workspace manager，有自己嘅 `claude-teams`/hooks）下，claude-auto-retry **唔 work**。實證：session 內 `$CLAUDE_AUTO_RETRY_ACTIVE` 未 set、`$TMUX` 空、process tree = `node → claude binary`（**冇經** zsh `claude()` wrapper）。
- **兩個原因**：① cmux 直接 spawn `claude` binary，繞過 `.zshrc` 個 `claude()` shell function（auto-retry 唯一 hook 點）② cmux 本身係 multiplexer，同 claude-auto-retry 自起嘅 tmux 互斥。
- **生效條件**：要喺**普通 terminal（ghostty/Terminal）直接打 `claude`**（interactive zsh）先 trigger wrapper → 起 tmux + monitor。用 cmux／Happy 跑就唔 trigger。
- **cmux 原生 rate-limit 能力（2026-06-19 查證 cmux live schema/docs，manaflow-ai/cmux）**：
  - cmux **只 detect + notify**：撞 limit 顯示 status「Rate limit / Waiting」+ 通知（en.lproj 有 `agent.codex.error.status.rateLimit`）。
  - **`autoResumeAgentSessions`**（default true）＝ **session 還原**：cmux **重開／revisit hibernated tab** 時自動跑 `claude --resume <id>`；連同 Agent Hibernation（`idleSeconds`）係慳 RAM/CPU + 還原。**唔係**偵測 reset 時間後自動送「continue」。
  - **定案：cmux 冇 claude-auto-retry 等價物**（等 reset → 自動 continue）。cmux 畀你嘅係 **session 持久（唔丟失、reopen 自動 resume）+ 通知**；但 rate limit 後仍要**你手動 continue**。
  - ⇒ **想完全無人值守自動續（如過夜）**：要喺普通 terminal 用 claude-auto-retry；**接受「回來見通知、手動 continue」**：cmux 單獨夠用。

## Related
- [[Software]] —— 本工具喺裝咗嘅軟件 catalog（claude-auto-retry 0.2.2）
- [[Bookmarks]]

<!-- ===== ARCHIVE BELOW — README 摘錄（GitHub API 2026-06-19），掃描/triage 時可跳過 ===== -->

## Full Content (archived)
> 來源：https://github.com/cheapestinference/claude-auto-retry（`master`/README，GitHub API 2026-06-19 HKT）。

**claude-auto-retry** — Automatically retry Claude Code sessions when you hit Anthropic subscription rate limits. When Claude Code shows *"5-hour limit reached - resets 3pm"*, this tool waits for the reset and sends "continue" automatically. No dependencies, no workflow change.

### The Problem
跑複雜 task 期間見到 `You've hit your limit · resets 3pm (Europe/Dublin)`，Claude 停低，要等幾粒鐘返嚟打「continue」。長 task／過夜／AFK 特別痛。

### The Solution
```bash
npm i -g claude-auto-retry
claude-auto-retry install
```
照打 `claude`。撞 limit 時工具：① 偵測 rate-limit 訊息 ② parse reset 時間（timezone-aware）③ 等到 reset + 60s margin ④ 確認 Claude 仍前景 ⑤ 自動送「continue」。

### How it Works
```
你打 "claude"
   ▼
Shell function（注入 .bashrc/.zshrc）
   ├─ 已喺 tmux？ → 起背景 monitor + launch claude（full TUI）
   └─ 唔喺 tmux？ → 透明咁建 tmux session，內裏 launch claude + monitor，再 attach（睇落一樣）

MONITOR（背景，~0% CPU）：
   ├─ 每 5 秒 poll tmux pane
   ├─ 偵測 rate limit 文字
   ├─ parse reset 時間
   ├─ 等到 reset + safety margin
   ├─ 確認 Claude 仍前景 process
   └─ 經 tmux send-keys 送 "continue"
```
**Why tmux**：斷線（SSH drop／關 terminal／sleep）tmux 照 running、monitor 照等，`tmux attach` 返去見 Claude 做緊嘢。勝過 wrapper script。

### Features
零 workflow 改變（同樣 `claude` 指令/TUI）・ 有冇 tmux 都 work（無就自動建）・ 缺 tmux 自動裝（apt/dnf/brew/pacman/apk）・ timezone-aware（IANA、含半小時 offset）・ DST-safe（iterative offset 修正）・ safe send-keys（先驗前景 process）・ `--print` mode（buffer output、scripted 用）・ configurable（retry count／wait margin／custom pattern／retry message）・ config validation（壞值 fallback safe default）・ **零依賴**（純 Node.js）。

### Rate Limit Patterns Detected
偵測真實 Claude Code 訊息，例：`5-hour limit reached - resets 3pm (UTC)`（N-hour limit reached 等）。

## Key Comments
（GitHub repo，原頁無公開留言區 → 不適用。reference source link-rot 風險低，已 archive README 摘錄。）
