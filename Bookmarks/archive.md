---
type: view
title: "Archived Bookmarks"
status: active
created: 2026-06-16
updated: 2026-06-16
tags:
  - view
  - bookmark
  - archive
---

# Archived Bookmarks

**Filter**：`type == "bookmark"` AND `status == "archived"`

睇 [[Bookmarks.base]] → **Archive** 視圖。

或者用下面 inline base（同一個 data，揀 Archive tab）：

![[Bookmarks.base]]

---

## 為何唔 delete 而 archive？

- 保留歷史：之後想搵返「嗰個 deep dental clinic 嘅鏈接」可以查回
- 不污染 active 視圖：archived 唔再出現喺主畫面
- 低成本：純改 frontmatter，唔搬檔

## 點 unarchive

frontmatter `status` 改返非 `archived` 嘅值（`active`、`reading`、`useful` 等）。
