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

> [!note] 結構：深層細分 tree、獨立於 wiki（2026-06-17 起；取代之前嘅 flat → 淺層 by-domain）
> Bookmark folder tree **獨立於 `wiki/`** —— 唔使跟 wiki 領域命名，按 bookmark 自己順手嚟分。原則：
> - **深層／細分（preferred）**：建議用 `AI/<app>/<Tools|Setup>/<thing>/` 呢類 pattern，例 `Bookmarks/AI/Obsidian/Tools/Web Clipper/`、`Bookmarks/AI/Claude Code/Tools/`、`Bookmarks/AI/Coding Agents/`。
> - **未分類**留 `Bookmarks/` root（唔逼即時歸類）。
> - `domain` frontmatter 仍係 `[[Bookmarks.base]]` 嘅**分類軸**（驅動 By domain group/filter），**但同 folder 路徑可以唔同**——folder = 人類瀏覽動線，domain = metadata 軸。`.base` filter 靠 `type`/`status`/`domain`，**非 path** → 搬夾零斷連。
> - **多 folder 出現（lightweight）**：一個 bookmark suit 多個 folder 時，**唔好複製成個 note**。次序：①最輕 = `tags` 跨領域 + `.base` view；② MOC/索引 note 連去正本；③ **pointer stub**（喺第二個 folder 整個 `type: pointer` 嘅薄檔，body `![[正本]]` 嵌入）。stub 檔名**必須**同正本唔同（用 `(↪ <home>)` suffix），否則 wikilink 解析撞、autocomplete 亂。例：`Coding Agents/ccusage (↪ Claude Code Tools).md`。
> - **檔名仍須全 vault 唯一**（深層唔放寬呢條）。
> - 不受影響：active/archive 仍「不搬檔、靠 `status` 欄」（見下）。

長期保留嘅 URL 指標 ＋ **自存全文 snapshot**——你想隨手返到嘅網站／工具／文章。

> [!important] 全文自存（2026-06-18 起改預設）
> 新 bookmark **自動連全文一齊存**入 bookmark 檔本身（`## Full Content (archived)`），有重要留言亦一同記低（`## Key Comments`）——防 link-rot，**社交媒體尤其常改／死 link**。留言抓唔到（JS／login wall）就明寫「留言未能抓取」、唔扮抓到。`raw/` 不受影響：只有正式 ingest 入 wiki 先行 Layer 2（defuddle→`raw/articles/`、填 `raw_source`）。

> 同其他 URL 容器嘅分工：
> - **Bookmarks/** = 指標（URL + 摘要）＋ **自存全文 snapshot ＋ 重要留言**，**長期**快存
> - **`Inbox/clippings/`** = Web Clipper 全文 clip（全文 markdown，會 triage）
> - **`raw/articles/`** = formal sources to compile（會 ingest 入 wiki；bookmark 只在 Layer 2 promote 時先寫入呢度）
> - **`wiki/<topic>/`** = compiled knowledge（已 refined）

## 視圖（**不搬檔**，靠 frontmatter `status`）

睇 [[Bookmarks.base]]，4 個 tab：
- **Active** — `status != "archived"`（包括 active／reading／useful／inbox／無 status）
- **Archive** — `status == "archived"`
- **All bookmarks** — 全部
- **By domain** — 按 `domain` group

### 點 archive 一條

唔搬檔——改 frontmatter `status: archived`：

```yaml
status: archived
```

下次 reload／rerender，呢條會由 Active view 跳去 Archive view。

### 點 unarchive

`status` 改返非 `archived` 嘅值（`active`、`reading`、`useful` 等）。

### 為何唔 delete 而 archive？

- **保留歷史**：日後想搵返「嗰個 deep dental clinic 嘅鏈接」可以查回
- **不污染 active 視圖**：archived 唔再出現喺主畫面
- **低成本**：純改 frontmatter，唔搬檔／唔斷 wikilink

## 規矩

- 新加 bookmark：用 `Meta/templates/bookmark.md` template，default `status: active`、`type: bookmark`、`para: resource`，**填 `domain:`** 並放入對應 `Bookmarks/<Domain>/` 夾（未定就留 root、`domain` 留空）
- 不再用：改 frontmatter `status: archived`，**唔搬檔**（檔留喺原本 domain 夾）
- 想 promote 做 wiki source／resource：跟下面「Promote workflow」3 layer，**唔好直接複製檔過去**
- **Provenance（`found-by-claude` tag）**：凡 **Claude 自己**喺網上 research／答問時搵到嘅有用 link，Claude 會主動 bookmark 並加 tag **`found-by-claude`**，同你親手掉嘅 link 區分（方便 prune／判斷信任度）。你親手加嘅 bookmark **唔使**加呢個 tag。
- 結構：**深層細分 tree、獨立於 wiki**（見頂部 note）。~~舊 flat（停用）→ by-domain 淺層（亦已 supersede）~~
- 跨 folder：用 pointer stub（`type: pointer` + `![[正本]]`，檔名加 `(↪ <home>)` suffix）；**唔好** copy 整個 note。

## Bookmark frontmatter（最少）

```yaml
---
type: bookmark
para: resource
domain: ai-tools      # .base 分類軸（同 folder 路徑可以唔同；未定可留空）
title: "..."
url: "https://..."
status: active        # active / archived
created: YYYY-MM-DD
tags:
  - bookmark
  # - found-by-claude   # 只喺 Claude 自己網上搵到時加（provenance）
# Promote workflow bridge fields（Layer 2 才填，見下）
# raw_source: "[[<slug>]]"        # 已 defuddle 入 raw/articles/
# wiki_page:  "[[<wiki page>]]"    # 已 ingest 成 wiki source
---
```

## Promote workflow（bookmark ↔ raw ↔ wiki bridge）

vault `CLAUDE.md` 嘅「Bookmark ↔ raw ↔ wiki bridge」章節係 source of truth；呢度係 bookmark 角度嘅快查。

### Layer 1：lightweight cite（最輕）

喺 wiki 頁直接寫 `[[bookmark-name]]` 或 `![[bookmark#section]]`。**Bookmark 唔升級、唔搬。** 適合「順手 cite」。

### Layer 2：promote URL 入 raw → ingest 入 wiki（推薦做 deep ingest）

```
Bookmark  --defuddle URL→  raw/articles/<slug>.md  --ingest→  wiki/.../sources/<page>.md
```

操作：
1. `obsidian:defuddle` skill 對 URL 抽乾淨 markdown → 寫 `raw/articles/<slug>.md`
2. Bookmark frontmatter 加 `raw_source: "[[<slug>]]"`
3. ingest → wiki source 頁出（`type: source`）
4. Bookmark frontmatter 加 `wiki_page: "[[<wiki page>]]"`
5. Wiki source 頁加返 `bookmark: "[[<bookmark>]]"` + `source_url:` + `raw_path:`

**狀態判讀：** bookmark 冇 `raw_source` = Layer 1；有 `raw_source` 冇 `wiki_page` = Layer 2 in progress；兩個都有 = 完成 + 可追源。

### Layer 3：full promote（重，少做）

當 bookmark 嘅 `My Notes` 已經寫到滿、實質升級成 wiki resource：`git mv` 入 `wiki/<domain>/<typed-folder>/`，改 `type: bookmark` → `type: resource` 或 `type: concept`。Wikilink path-independent，自動 OK。**做完 bookmark 池失去呢個記錄**，所以重少做。
