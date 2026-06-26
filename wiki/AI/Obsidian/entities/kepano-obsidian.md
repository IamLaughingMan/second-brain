---
type: entity
para: resource
domain: obsidian-ai
title: "kepano-obsidian (Vault Template)"
status: active
created: 2026-06-26
updated: 2026-06-26
tags:
  - entity
  - obsidian
  - kepano
  - vault-template
---

# kepano-obsidian (Vault Template)

## What it is
**kepano (Steph Ango)** 大神嘅個人 Obsidian vault template，公開喺 `github.com/kepano/kepano-obsidian`。**Steph Ango = Obsidian 公司 CEO**，所以呢個 vault 反映 Obsidian 官方哲學 by extension。Self-described 「bottom-up approach to note-taking」。

## Philosophy（核心原則）
- **「Avoid splitting content into multiple vaults」** — 一個 vault 統管，唔好亂拆
- **「Avoid folders for organization」** — properties + Bases 行先，folder 只作必要 admin
- **「Having a consistent style collapses hundreds of future decisions into one」** — 一致性大於 perfection
- **Fractal journaling** — daily → weekly → monthly → yearly synthesis
- **Heavy internal linking** —「unresolved links as breadcrumbs」，紅 link 唔係 error 係 future-write 提示
- **Pluralized tags、`YYYY-MM-DD` date、7-point rating scale** —— 全部 standardized

## Vault 結構（minimal）
```
kepano-obsidian/
├── References/     ← books / movies / people / places（外部 subject）
├── Clippings/      ← 他人嘅 content
├── Attachments/    ← media
├── Daily/          ← YYYY-MM-DD.md
├── Templates/      ← reusable note format
└── （其餘 personal note 喺 root flat）
```

→ **最 minimal folder approach**，所有 personal note 喺 vault root；靠 quick switcher + backlinks + properties 導航。

## 大神例外行為
- kepano 自己**破自己原則**：published site 用獨立 vault（Hugo / Jekyll / GitHub / Netlify via Obsidian Git plugin）
- 即係：**scope 改變嗰陣 (publish vs personal)，拆 vault 係 OK** —— 但 personal 一個 vault 統管
- 對應到你 setup：**個別 code project 拆出 external repo（Pattern B）就 align kepano scope 拆分邏輯**

## Key facts
- **Repo**：`kepano/kepano-obsidian` on GitHub
- **Author**：Steph Ango，Obsidian 公司 CEO
- **Companion writeup**：[[stephango.com vault]] — 詳細文字解釋
- **Branded skill kit**：[[Obsidian Skills (kepano)]] 35.9k★（另一 entity）
- **License**：CC0（usually）— 高 reusability

## Why it matters
- **大神等於 Obsidian 官方哲學**（through CEO）—— 跟佢嘅 convention 同 Obsidian 設計 grain align
- Properties-over-folders 直接影響 PKM 社群方向、Obsidian 1.4+ Properties UI 即係呢個哲學 productized
- 點解 kepano 自己 published site 都另開 vault：**scope/audience 唔同就拆**

## Limitation
- Vault 結構 minimal 到對某啲 user 過粗（特別係要 deep typed-folder PKM 嘅人）
- Daily/weekly/monthly journal 流程 assumes daily writing habit — busy schedule 難維持
- Reference 同 Clippings folder 對中文／非英 source 嘅命名 convention 未必啱
- 唔附 AI agent integration（純人手 PKM template）—— 要 AI 要自加

## My take
- 你 vault 嘅 Karpathy 主軸 + 多 folder（Health/Consumer/AI typed-folder）係**反 kepano minimal folder 原則**，但你刻意揀 typed-folder（自覺 trade-off）
- **borrow 嘅嘢**：properties-over-folders 嘅 `.base` view 思路（你已用緊）、unresolved wikilink 當 breadcrumb（你 vault 都係咁）、scope-based vault split 邏輯支持你 Pattern B 嘅 NMN setup
- **唔 borrow 嘅嘢**：minimal folder（你 typed-folder 對 LLM 檢索更有用）、daily journal（你冇呢個習慣）

## Source bookmark
- [[kepano-obsidian — Vault Template]] — full repo archive
- [[stephango.com — How I Use Obsidian (kepano)]] — 大神 writeup

## Related
- Companion entity: [[Obsidian Skills (kepano)]]
- Source: [[stephango.com vault]]
- Pattern: 對齊 [[Linked Repo + Vault (Pattern B)]] / [[Unified via MCP (Pattern C)]]（分層原則）
- Hub: [[Obsidian]]
