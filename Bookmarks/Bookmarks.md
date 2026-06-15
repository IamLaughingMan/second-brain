---
type: moc
title: "Bookmarks"
para: resource
status: active
created: 2026-06-16
updated: 2026-06-16
tags:
  - moc
  - bookmark
---

# Bookmarks

長期保留嘅 URL 指標——你想隨手返到嘅網站／工具／文章。

> 同其他 URL 容器嘅分工：
> - **Bookmarks/** = 指標（URL + 一句註），**長期**快存
> - **`Inbox/clippings/`** = Web Clipper 全文 clip（全文 markdown，會 triage）
> - **`.raw/articles/`** = formal sources to compile（會 ingest 入 wiki）
> - **`wiki/<topic>/`** = compiled knowledge（已 refined）

## 兩條視圖（**不搬檔**，靠 frontmatter `status`）

- [[active]] — `status != "archived"`（包括 active／reading／useful／inbox／無 status）
- [[archive]] — `status == "archived"`

或者直接睇 [[Bookmarks.base]]（兩個 tab）。

## 規矩

- 新加 bookmark：用 `Meta/templates/bookmark.md` template，default `status: active`、`type: bookmark`、`para: resource`
- 不再用：改 frontmatter `status: archived`，**唔搬檔**（檔仍喺 `Bookmarks/`）
- 想 promote 做 wiki 內容：搬去 `wiki/<topic>.md`、改 `type` + `para: resource`
- Flat structure：所有 bookmark `Bookmarks/<title>.md`，唔起 subfolder

## Bookmark frontmatter（最少）

```yaml
---
type: bookmark
para: resource
title: "..."
url: "https://..."
status: active        # active / archived
created: YYYY-MM-DD
tags:
  - bookmark
---
```
