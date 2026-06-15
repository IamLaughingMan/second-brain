---
type: view
title: "Active Bookmarks"
status: active
created: 2026-06-16
updated: 2026-06-16
tags:
  - view
  - bookmark
---

# Active Bookmarks

**Filter**：`type == "bookmark"` AND `status != "archived"`

睇 [[Bookmarks.base]] → **Active** 視圖。

或者用下面 inline base（同一個 data，揀 Active tab）：

![[Bookmarks.base]]

---

## 點 archive 一條

唔搬檔——改 frontmatter `status: archived`：

```yaml
status: archived
```

下次 reload／rerender，呢條會由 Active 視圖跳去 [[archive]]。

## 點 unarchive

frontmatter `status: active`（或 `useful`、`reading` 等任何非 archived 嘅值）即可。
