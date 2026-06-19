---
type: moc
title: "Ideas"
para: area
status: active
created: 2026-06-19
updated: 2026-06-19
tags:
  - moc
  - idea
  - personal
---

# Ideas

我嘅念頭簿。一念一檔，放喺 `Personal/Ideas/`。進度靠 frontmatter `stage` 欄 + [[Ideas.base|Ideas.base]] view 篩，**唔開狀態 folder、唔搬檔**（跟 vault status-over-folder 原則）。

> [!tip] 用 `.base` 睇板
> 開 **`Ideas.base`** 有分頁：`00 全部` / `01 未做` / `02 做緊` / `03 完成` / `04 可能開project` + `Board`（卡片按 stage 分組）。

## `stage` 詞彙（念頭進度，與 `status` 正交）

| stage | 意思 |
|-------|------|
| `未做` | 諗咗、未開始（新 idea default） |
| `做緊` | 進行中 |
| `完成` | 做完 |
| `可能開project` | 值得認真做 → 準備 promote 去 `Projects/` |

> `stage`（念頭進度）同 `status`（`active`/`archived` 生命週期）係兩條軸。做完嘅 idea 通常 `stage: 完成`；想喺板上隱藏就再加 `status: archived`。

## 點加一個 idea

1. 喺 `Personal/Ideas/<念頭名>.md` 開新檔（模板：`Meta/templates/idea.md`）。
2. Frontmatter 最少要 `type: idea` + `stage:`。
3. 一句講清個念頭，慢慢長大。

## 「可能開project」→ promote 流程

當一個 idea `stage` 行到 `可能開project`、而你決定認真做：

1. 用 `Meta/templates/project.md` 喺 `Projects/<name>.md` 開正式 project 頁，frontmatter `para: project`（有 code repo 就填 `code_path:`）。
2. 由 [[Projects]] hub 連出；project 頁 backlink 返呢個 idea（`[[<idea>]]`）。
3. 原 idea 標 `stage: 完成`（或 `status: archived`）——佢嘅歷史保留，唔刪。

## 相關

- [[Projects]] —— idea 升級後嘅落腳
- [[Inbox]] —— 未定向嘅 catch-all（idea 係已成形嘅念頭，Inbox 係未 triage 嘅雜項）
- [[PARA]] —— PARA 鏡頭（idea 預設 `para: inbox`）
