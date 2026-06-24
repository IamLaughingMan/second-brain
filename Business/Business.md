---
type: moc
domain: business
para: area
title: "Business"
status: active
created: 2026-06-24
updated: 2026-06-24
tags:
  - moc
  - business
related:
  - "[[Projects]]"
---

# Business

公司/商業知識層嘅總 hub。**自成一套 compounding 機制**(似 `wiki/` 但 business scope):每個 business 領域有自己嘅 hub / overview / typed-folder,知識喺度累積。

> 知識喺度累積;actionable 嘅 project 控制頁喺 [[Projects]]。兩邊 Model B 互指。

## 領域 Domains

- [[NMN]] — NMN 補充品電商/零售(供應商 / 產品 / 市場 / 法規)

## 運作規矩

- **分類軸 = frontmatter `domain`**(驅動 `Business.base` group/filter),非 path → 搬夾零斷連。
- **Typed-folder pattern**(跟 vault rule):某 type ≥1 頁先開對應夾(`suppliers/` `products/` `market/` `regulatory/` …),未夠就 flat,由 `.base` 篩 type。觸發整套 typed-folder = ≥3 types 各 ≥2 頁。
- **Status field 取代 Archive folder**:`status: archived` 靠 `.base` view 篩,唔搬檔。
- **Auto-commit**:`Business/` 已加入 vault auto-commit hook scope(同 `wiki/` 一樣自動 commit)。

## 對應

- 控制頁:[[Projects]] hub → 各 `Projects/<name>.md`(PARA project,帶 `code_path:`)
