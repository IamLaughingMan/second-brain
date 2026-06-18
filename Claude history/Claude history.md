---
type: moc
title: "Claude history"
para: archive
status: active
created: 2026-06-19
updated: 2026-06-19
tags:
  - moc
  - claude-history
---

# Claude history

> 全 project（second-brain、General、axiom、ai-arcade…）嘅 **原始 Claude Code 對話 archive**。由 user-level `Stop` hook 每 turn 完即時 append。**唔行 Karpathy `wiki/` compounding**——係獨立嘅 ①派 raw audit／回顧層。

## 規矩

| 項 | 規矩 |
|---|---|
| 私隱 | 已 `.gitignore`——**唔 push** 上 GitHub（含所有 prompt／response、有時夾 secret／PII） |
| 性質 | **唔當 wiki 內容**。好答案應該收工蒸餾入 `wiki/<page>.md` 嘅相應 typed-folder；呢度係源、唔係 compounding |
| Triage | 每幾個月手動 archive 舊嘅（改 `status: archived` 或 git mv 落 `archive/` subfolder） |
| 預期查找頻率 | **罕**——memory + hot.md + `wiki/index.md` 已 cover 9 成情境 |
| 用途 | (i) 你 audit／回顧（ii)「我幾時決定 X？」grep（iii) disaster recovery（iv) cctrace 替代品 |

## 結構

```
Claude history/
├── Claude history.md            ← 此 hub
├── Claude history.base           ← 動態 view（all / by project / 7d）
├── YYYY-MM-DD/                    ← 每日一 folder（HKT 日期）
│   └── HH-MM <project> (<first-prompt>).md   ← 每 session 一檔
```

## 檔內格式

- Frontmatter：`type: claude-session`、`session_id`、`project`、`project_path`、`git_branch`、`model`、`started`／`updated`（HKT）、`turns`、`status`、`tags: [claude-history]`
- Body：`## 🧑 User · [HH:MM:SS HKT]` 同 `## 🤖 Claude · [HH:MM:SS HKT]` 交替；`<system-reminder>`／`<local-command-*>` 等 CLI 雜訊已 filter 走；assistant 嘅 thinking／tool_use blocks 不入檔（只記真係 text 回應）

## 動態 view

[[Claude history.base]]

## 技術細節

- Hook script：`~/.claude/hooks/log-claude-session.py`（Python 3、~200 行）
- Backfill script：`~/.claude/hooks/backfill-claude-history.py`（一次性掃 `~/.claude/projects/` 全部 jsonl，冪等；backfilled 檔有 `status: archived` + `backfilled` tag + `> Backfilled from...` 註）
- State：`~/.claude/state/claude-history-sessions.json`（`session_id → {file_path, last_uuid, turn_count}`，hook ＋ backfill 共用，做 dedup）
- Errors：`~/.claude/state/claude-history-errors.log`（hook 永不 block Claude Code）
- 數據源：Claude Code 自己嘅 transcript jsonl `~/.claude/projects/<hash>/<session>.jsonl`（source-of-truth，呢度只係 mirror／human-readable view）
- **Mid-session activation**：實測 Claude Code 喺改 `~/.claude/settings.json` 之後 mid-session 都會 pick up Stop hook（唔需重開 session）；2026-06-19 setup 嗰陣本身 session 嘅對話從第 1 turn 起就完整 mirror 落 vault

## 初始 backfill（2026-06-19）

- 31 個 jsonl 掃完：29 個 .md 創建（2026-05-31 → 2026-06-19）、1 個跳過（current session by hook）、1 個跳過（empty／純 queue meta jsonl）、0 error
- 每個 backfilled 檔 frontmatter：`status: archived`、`tags: [claude-history, backfilled]`、加 `ended:` 欄
- 重跑 `backfill-claude-history.py` 安全（state file dedup）

## Related

- [[Recording Claude Conversations in Obsidian]] —— 研究：點解揀 self-made hook 而唔用 cctrace
- [[hooks]] —— 全 Claude Code hook catalog
