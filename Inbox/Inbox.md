---
type: moc
title: "Inbox"
para: inbox
status: active
created: 2026-06-16
updated: 2026-06-16
tags:
  - moc
  - inbox
---

# Inbox

未整理嘅嘢全部丟呢度——URL、idea、scratch、screenshot、todo、半成形嘅諗法。**Capture first, sort later**（GTD 原則）。

> 同 `raw/` 嘅分工：
> - **`raw/`** = formal sources，要 compile 入 wiki（articles、papers、transcripts、PDFs）
> - **`Inbox/`** = informal capture，未確定要做乜（idea、scratch、bookmark）

## 結構

```
Inbox/
├── Inbox.md            ← 本檔（hub）
├── <random captures>.md  ← 隨手寫
└── clippings/            ← Web Clipper 輸出（subfolder）
    └── <web articles>.md
```

## 規矩（triage SLA）

**7 日 reset**：每週清一次 Inbox——每件嘢 decide：

| 結局 | 動作 |
|------|------|
| ✅ 確定係源、要 compile | defuddle / cleanup → `raw/articles/` → `ingest` |
| ✅ 變成 active project | 搬 `Projects/<name>.md`、frontmatter `para: project` |
| ✅ 變成 knowledge | 搬 `wiki/<topic>.md`、跟 type/domain 規矩 |
| ✅ Long-term reference 但唔做 | 搬 `wiki/`（`para: resource`） |
| ❌ 唔再用 / 過時 | 刪（唔留 archive、節省 noise） |

Inbox 入面超過 7 日仍未 triage 嘅嘢 = 信號，要嘛你冇興趣（刪）、要嘛你迴避思考（force decide）。

## URL 三條路（呼應 [[Karpathy LLM Wiki Pattern]]）

| Intent | 落腳 |
|--------|------|
| 「未定，可能想睇」 | `Inbox/<title>.md`（URL + 一句註） |
| 「Web Clipper 自動 clip」 | `Inbox/clippings/<title>.md` |
| 「確定係源、要 compile」 | 直接 defuddle → `raw/articles/<slug>.md` →`ingest`（**跳過 Inbox**）|
| 「即時答 question」 | `query:` 或 `autoresearch`、URL 餵入 query、答案歸 `wiki/` |

## Frontmatter 慣例

每篇 Inbox 嘢用：
```yaml
---
type: <bookmark / scratch / idea / todo / clipping>
para: inbox
created: YYYY-MM-DD
source_url: <如有>
status: unsorted
---
```

Triage 完，frontmatter `para` 同 `type` 改成終態。

## 領 Web Clipper 入呢度（將來）

裝 [Obsidian Web Clipper](https://obsidian.md/clipper) 後，設定 default save path = `Inbox/clippings/`，clip 嘅 web 文章自動入夾。
