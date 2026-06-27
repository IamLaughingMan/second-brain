---
type: tool
title: "cmux-autoretry"
para: resource
status: active
tool_status: 使用中
version: "1.0"
install_method: "自建 script（bash）"
install_path: "~/.config/cmux-autoretry/"
installed: 2026-06-27
installed_by: "Claude 幫手"
created: 2026-06-27
updated: 2026-06-27
related:
  - "[[Software]]"
  - "[[claude-auto-retry (cheapestinference)]]"
tags:
  - tool
  - cli
  - claude-code
  - cmux
  - rate-limit
---

# cmux-autoretry

- 類型：自建 bash script（喺 cmux 內跑嘅 watcher；非 brew/npm 工具、亦非 Claude/Obsidian [[extensions\|擴充]]）
- 版本：`1.0` ・ 路徑：`~/.config/cmux-autoretry/`（`autoretry.sh` daemon ＋ `arctl` 控制 ＋ `config.sh`）
- 裝者／日期：Claude 幫手 ・ 2026-06-27 HKT
- 狀態：**使用中**（行緊喺 cmux workspace tab `⟳ autoretry`）

## 係咩

[[claude-auto-retry (cheapestinference)|claude-auto-retry]] 嘅 **cmux 原生等價物**。嗰個 tmux-based 工具喺 cmux 下唔 work（cmux 直接 spawn `claude` binary、繞過 zsh `claude()` wrapper），原 bookmark 結論係「**cmux 冇 claude-auto-retry 等價物**」—— 本工具就係補返呢個窿。

做嘅嘢同 claude-auto-retry 一樣：Claude session 撞 **usage-limit**（等到 reset → 送「continue」）或 **API error**（overloaded/529/connection，等 45s grace → 送「continue」），只喺 **idle prompt** 動手、**絕不**喺 generate 中途、**絕不** approve tool-call。

## 點 work（關鍵 insight）

- 用 cmux 自己嘅 CLI：`cmux read-screen`（睇畫面 = tmux `capture-pane`）＋ `cmux send` / `cmux send-key enter`（打字 = tmux `send-keys`）。
- **必須行喺 cmux process 樹入面**：cmux control socket 係 `socketControlMode: cmuxOnly`，靠 **process ancestry** 授權（唔係 env／password）。launchd agent（parent = launchd）ping 唔到 cmux → 所以 watcher 起成一個 **cmux workspace**（`cmux new-workspace --command`），**唔用 launchd**。
- 每 20s scan 一次；`MODE=active`、`WATCH_MODE=all`。

## 控制（喺 cmux pane 內）

```bash
arctl status | log | pause [substr] | resume [substr] | start | stop
```
- 講「autoretry manual」= `arctl pause`（只 log + `cmux notify`、唔送）；`arctl resume` 復原。
- 每次 action 寫 `~/.config/cmux-autoretry/autoretry.log` ＋ `cmux notify`。

## Gotcha

- **trigger regex best-effort**（`config.sh` 嘅 `LIMIT_RE`/`APIERR_RE`/`BUSY_RE`/`CLAUDE_RE`）—— 未對真實 limit/error 畫面驗過；靠 log + notify 真實命中再 tune。detection（dry-run 零 false-positive）＋ send path（scratch-pane proof）已驗。
- **`WATCH_MODE=all` 風險**：純粹**顯示**「API Error / usage limit」字眼嘅 session（例如討論本工具嗰個 pane）可能誤觸 → build session（UUID `5AE9F383`）已入 `EXCLUDE`。
- **restart 持久化 best-effort**：靠 `cmux surface resume set` binding；cmux relaunch 後若 `⟳ autoretry` tab 無行 → `arctl start` 補返。
- **唔好 close `⟳ autoretry` tab**（close = 停 watcher）。

## 相關
- [[claude-auto-retry (cheapestinference)]] —— tmux 版（cmux 下失效），本工具係其 cmux 等價
- [[Software]] —— 軟件 catalog hub
- General：`~/.config/cmux-autoretry/README.md` ＋ `claude-activity-log.csv`（2026-06-27 config rows）
