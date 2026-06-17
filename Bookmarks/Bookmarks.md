---
type: moc
title: "Bookmarks"
para: resource
status: active
created: 2026-06-16
updated: 2026-06-17
tags:
  - moc
  - bookmark
---

# Bookmarks

> [!note] 結構：by-domain 淺層資料夾（2026-06-17 起；取代已停用嘅 flat 規則）
> Bookmark **按 `domain` 入頂層資料夾**（鏡射 `wiki/` 嘅領域命名，如 `Bookmarks/AI/`、`Bookmarks/Health/`），同全 vault 一致。原則：
> - **淺層**：只起頂層 domain 夾，某 domain 多到先深落去（如 `AI/Agents/`）——同 wiki「按需自建」一致。
> - **未分類**留 `Bookmarks/` root（唔逼即時歸類）。
> - `domain` frontmatter 欄係**真分類軸**（同時驅動「放邊個夾」同 `[[Bookmarks.base]]` 嘅 group/filter）；資料夾只係人類瀏覽動線。`.base` filter 靠 `type`/`status`/`domain`、**非 path** → 搬夾零斷連。
> - **檔名仍須全 vault 唯一**（資料夾唔放寬呢條）。
> - 不受影響：active/archive 仍「不搬檔、靠 `status` 欄」（見下）。

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

- 新加 bookmark：用 `Meta/templates/bookmark.md` template，default `status: active`、`type: bookmark`、`para: resource`，**填 `domain:`** 並放入對應 `Bookmarks/<Domain>/` 夾（未定就留 root、`domain` 留空）
- 不再用：改 frontmatter `status: archived`，**唔搬檔**（檔留喺原本 domain 夾）
- 想 promote 做 wiki 內容：搬去 `wiki/<topic>.md`、改 `type` + `para: resource`
- **Provenance（`found-by-claude` tag）**：凡 **Claude 自己**喺網上 research／答問時搵到嘅有用 link，Claude 會主動 bookmark 並加 tag **`found-by-claude`**，同你親手掉嘅 link 區分（方便 prune／判斷信任度）。你親手加嘅 bookmark **唔使**加呢個 tag。
- 結構：**by-domain 淺層資料夾**（見頂部 note）。~~舊 flat / 唔起-subfolder 規則已於 2026-06-17 停用~~

## Bookmark frontmatter（最少）

```yaml
---
type: bookmark
para: resource
domain: ai-tools      # 分類主軸＋決定放邊個 Bookmarks/<Domain>/ 夾（未定可留空）
title: "..."
url: "https://..."
status: active        # active / archived
created: YYYY-MM-DD
tags:
  - bookmark
  # - found-by-claude   # 只喺 Claude 自己網上搵到時加（provenance）
---
```
