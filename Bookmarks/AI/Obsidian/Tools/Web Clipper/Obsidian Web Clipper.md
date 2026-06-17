---
type: bookmark
para: resource
domain: pkm
title: "Obsidian Web Clipper"
url: "https://obsidian.md/help/web-clipper/templates"
status: active
created: 2026-06-17
updated: 2026-06-17
related:
  - "[[Bookmarks]]"
tags:
  - bookmark
  - pkm
  - obsidian
  - web-clipper
  - automation
---

# Obsidian Web Clipper

- URL: https://obsidian.md/help/web-clipper/templates
- Saved date: 2026-06-17
- Topic: 官方瀏覽器擴充,一鍵 clip 網頁 → vault markdown(自動 bookmark 嘅正路)
- Status: active

## Why I saved this

研究「自動 bookmark」時 Claude 搵到嘅主力工具。官方、local-first、kepano 推薦,而且 template trigger 機制啱晒本 vault 嘅 by-domain 方案(按站自動分流去 domain 夾)。

## Summary

- **Template triggers**:按 URL prefix / regex / schema.org 自動揀 template。
- **Destination**:每 template 可設目標夾(create new / append / daily note)。
- **Frontmatter**:靠 `{{title}}`／`{{url}}`／`{{date}}`／`{{author}}` 等變數 + selector 自動填 properties。
- **Capture**:全文或選段,自動抽 title/author/date/url。

## My Notes

下一步可整一個「Bookmark」template:寫死 `type: bookmark`／`status: active`／`para: resource`,trigger 按站分流(如 github.com → AI 夾)。

## Related
- [[kepano - Obsidian Web Clipper]]
- [[Obsidian Community Web Clipper Templates]]
- [[Bookmarks]]
