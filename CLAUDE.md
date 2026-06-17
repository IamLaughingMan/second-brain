# Second Brain — LLM Wiki（Karpathy 模式）

Mode: D+C+E (Personal + Projects + Research)
Purpose: Mixed second brain for personal life, projects, and research
Owner: masterdr
Created: 2026-06-07 ・ Restructured to flat Karpathy pattern: 2026-06-11 ・ 改混合結構（meta 平放＋領域資料夾）: 2026-06-12 ・ 整合 system 檔入 `Meta/`（跟 Bryan Hogan plain 模式）: 2026-06-16

> 完整建置藍圖（Karpathy 方法論 ＋ kepano obsidian-skills 工具層）見 [OBSIDIAN-SETUP](Meta/docs/OBSIDIAN-SETUP.md) ／ wikilink `[[OBSIDIAN-SETUP]]`。

## 核心原則：LLM 當 compiler，不是 retriever

- 不用 RAG pipeline、**不用向量資料庫**。個人規模（~100 篇）下，`index.md` + context window 即足以檢索。
- **混合結構**：`wiki/` 根層平放 meta（`index/log/hot`，**`overview` 已合併入 `index.md`**）與跨領域方法頁；**領域內容歸入領域資料夾**（如 `wiki/Health/Oral/Periodontal Disease/`），鏡射 MOC hub 階層。檢索仍靠 `index.md` + `[[wikilink]]`，資料夾只是人類瀏覽的次要動線。
- Wikilink 不帶路徑、Obsidian 靠檔名解析 → 內容入夾**零斷連**；`.base` 靠 frontmatter `domain` filter、非路徑 → 入夾不受影響。
- 人做 curation／提問／綜合意義；LLM 做其餘全部機械工作（摘要、連結、一致性、更新傳播）。

## Structure

```
second-brain-2026-06-06/
├── raw/                    # 不可變來源（articles/transcripts/screenshots/data/assets）— 只讀不改
├── wiki/                    # 混合維基層 — meta＋方法頁平放，領域內容入領域資料夾
│   ├── index.md             # 唯一目錄＝查詢入口（用 frontmatter type 分組）
│   ├── log.md               # append-only 操作日誌（新項置頂）
│   ├── hot.md               # ~500 字近期脈絡快取
│   ├── <跨領域方法頁>.md      # 如 Karpathy LLM Wiki Pattern — 不屬單一領域者平放根層
│   └── Health/              # 領域資料夾，鏡射 MOC hub 階層
│       ├── Health.md        # 領域 hub（type: moc）
│       └── Oral/
│           ├── Oral Health.md
│           └── Periodontal Disease/   # 牙周病：hub＋.base＋20 內容頁
│               ├── Periodontal Disease.md
│               ├── Periodontal Disease.base
│               └── <內容頁>.md          # source / concept / entity / comparison / resource
├── Inbox/                   # 未整理嘅 catch-all（URL/idea/scratch/todo），GTD capture-first
│   ├── Inbox.md              # hub（7 日 triage SLA 規矩）
│   ├── <random captures>.md
│   └── clippings/             # Web Clipper 預留 subfolder
├── Bookmarks/               # 長期 URL 指標（深層細分 tree、獨立於 wiki，2026-06-17；archive 仍靠 status 欄、不搬檔）
│   ├── Bookmarks.md          # hub（規矩 + frontmatter 例）
│   ├── Bookmarks.base         # 視圖：Active / Archive / All / By domain
│   ├── AI/                    # 深層 tree 示例（命名按 bookmark 自己順手，唔跟 wiki）
│   │   ├── Claude Code/Tools/   # `type: bookmark` + `domain:`（domain 同 folder 可唔同）
│   │   ├── Coding Agents/       # 含 pointer stub：`type: pointer` + `![[正本]]`，檔名加 `(↪ <home>)`
│   │   └── Obsidian/Tools/Web Clipper/
│   └── <title>.md             # 未分類 bookmark 留 root（domain 留空）
├── Projects/                # PARA-style active projects（root，跟 Tiago Forte / stefanimhoff 模式）
│   ├── Projects.md           # hub
│   └── <project>.md           # `para: project`、`code_path:` 指 repo = Model B 對應
├── Meta/                    # System／operational 夾（跟 Bryan Hogan plain 模式）
│   ├── docs/
│   │   ├── OBSIDIAN-SETUP.md    # 建置藍圖（Karpathy + kepano）
│   │   └── WIKI.md               # 完整 LLM 操作手冊
│   ├── templates/                 # 筆記模板（原 _templates/）
│   ├── attachments/               # 圖片與 PDF（原 _attachments/）
│   ├── bases/                     # Obsidian Bases 動態檢視
│   │   └── PARA.base
│   ├── scripts/                   # 將來放可執行嘢
│   └── extensions/                # Skills / plugins / hooks 嘅 catalog（真身唔住 vault）
│       ├── extensions.md            # hub
│       ├── skills.md                # plugin-bundled / project / user 三層
│       ├── plugins.md               # Obsidian + Claude Code plugins
│       └── hooks.md                 # vault + user settings hooks
├── .claude/                  # Claude Code project config
│   ├── settings.json          # PostToolUse auto-commit hook（HKT，wiki/raw/.vault-meta）
│   └── skills/                # 自製 skills（Claude Code spec 寫死路徑；現空）
└── CLAUDE.md                  # 本檔：行為契約（root 強制，Anthropic spec）
```

## Status field over archive folder（檔不搬，靠 metadata view）

**核心規則：唔起 `Archive/` folder、唔搬檔。** 用 frontmatter `status` 欄分類，配 `.base` view 篩。理由：

- Wikilink 不帶路徑，搬檔有零文件斷連風險但有 wikitree 搜尋／scrolling 嘅迷失成本
- 你 vault 已係 metadata-first（PARA 鏡頭、domain field）—— archive 同 active 都應該係 metadata view，唔係 file tree
- 跟 LYT (Nick Milo) 「fluid folders」哲學、Andy Matuschak evergreen notes、kepano "file over app"

`status` 詞彙：

| 值 | 用途 |
|----|------|
| `active` | 當前使用中（default for new） |
| `archived` | 不再使用但保留歷史 |
| `seed / developing / draft` | 內容頁進度標記（vs active/archive 軸正交） |

**Active view（`.base`）：** filter `status != "archived"`（即包括 active／draft／developing／無 status）
**Archive view（`.base`）：** filter `status == "archived"`

示例：`Bookmarks/Bookmarks.base` 嘅 Active／Archive 兩個 view（hub `Bookmarks/Bookmarks.md` 入面有教學）。同樣模式可推到 Projects、Resources、任何 collection。

**反例：** Tiago Forte PARA 用 `Archive/` folder 搬檔——本 vault **唔跟呢個**（保留 Inbox / Projects / Resources 概念，但 archive 改用 status field）。

## Capture / Inbox triage

新嘢三條路：

| Intent | 落腳 | 由 |
|--------|------|----|
| 「未定，可能想睇／儲住先」 | `Inbox/<title>.md`（短註＋URL，frontmatter `para: inbox`） | 你或 LLM |
| 「Web Clipper 自動 clip」 | `Inbox/clippings/<title>.md` | Web Clipper（將來） |
| 「確定係源、要 compile」 | 直接 defuddle → `raw/articles/<slug>.md` → `ingest` | 跳過 Inbox |
| 「即時答 question」 | `query:` 或 `autoresearch`，答案歸 `wiki/` | 跳過 Inbox／`raw/` |

**Inbox 7 日 triage SLA**：每週清一次，每件嘢 decide 結局（compile / project / wiki / 刪），詳見 [[Inbox]] hub。

## 四階段迴圈（workflow）

`Ingest → Compile → Query&Enhance → Lint&Maintain →（回到 Compile）`

- **Ingest**：丟來源進 `raw/`，說「ingest [filename]」。圖片下載到本機，別只存 URL。
- **Compile**：LLM 讀 `raw/`，增量建/改頁面、交叉引用、更新 `index.md`、append `log.md`。一個來源可能動 10–15 頁。
- **Query & Enhance**：提問 → 讀 `hot.md` → `index.md` → 個別頁，帶引用作答；**好答案歸檔回 wiki** 成新頁。
- **Lint & Maintain**：說「lint the wiki」健檢——孤兒頁、死連結、過時聲明、缺交叉引用，並建議下一步研究。

## Conventions

- 所有筆記用 YAML frontmatter：`type, status, created, updated, tags`（最少）。`type` 與 `domain` 才是分類主軸，資料夾只是次要瀏覽動線。
- Wikilinks 用 `[[Note Name]]` — 檔名唯一，**不帶路徑**（入夾、搬夾都不會弄斷連結）。**檔名須全 vault 唯一**，否則 Obsidian 無法靠檔名解析。
- `raw/` 是來源，永不修改。
- `wiki/index.md` 是唯一目錄 — 每次 ingest 都更新（即使內容入了資料夾，index 仍是檢索入口）。
- `wiki/log.md` append-only — 新項置頂，永不改動過去條目。
- **領域內容入領域資料夾**，鏡射 MOC hub 階層（目前：`Health/Oral/Periodontal Disease/`）。Meta 與跨領域方法頁留 `wiki/` 根層。ingest／save 流程（由 Claude 手動執行）會按需自建資料夾——建在對應領域夾，但每頁仍須有 `domain` 與正確 `type`。

## Log conventions（vault 專屬；通用 HKT／CSV 機制見 [`../CLAUDE.md`](../CLAUDE.md)）

`wiki/log.md` 條目 ＋ 手動 git commit 都要帶 **HKT** 時間戳（取時間 **必須** `TZ='Asia/Hong_Kong'`、不可裸 `date` —— 完整機制見 parent CLAUDE.md）。之後生效，舊條目不倒翻。

**`wiki/log.md` 條目標題格式：**
```
## [YYYY-MM-DD HH:MM HKT] <action> | <description>
```
例：`## [2026-06-15 14:30 HKT] ingest | 牙周病文獻新增 5 篇`

**手動 git commit：** 訊息帶 HKT，例：
```
git commit -m "<subject>" -m "$(TZ='Asia/Hong_Kong' date '+%Y-%m-%d %H:%M %Z')"
```

**Dual-log（雙寫）規則：** 每寫一筆有意義嘅 `wiki/log.md` 條目，**同時** append 一行到全局活動 log `~/AI/Claude/General/claude-activity-log.csv`（欄位／ISO 格式見 parent CLAUDE.md）。範例：
```
2026-06-15T14:30:00+08:00,ingest,second-brain vault,,project,,/Users/masterdr/AI/Claude/second-brain-2026-06-06,,success,"ingest | 牙周病文獻新增 5 篇"
```
**不重複 audit log**：`claude-audit-log.jsonl` 由 hook 自動記每個 tool call，CSV 只鏡射 curated 嘅 wiki/log.md 事件。

## PARA 視圖（metadata 鏡頭，非資料夾）

本 vault 用 **frontmatter `para` 欄**達到 PARA 的分類目的，**不改 Karpathy 資料夾結構**（資料夾仍是 domain-based，由 ingest 流程自建）。PARA 是一個可查詢的「鏡頭」，靠 [[PARA]] Base（`Meta/bases/PARA.base`）呈現，而非 file tree。

`para` 詞彙（每頁可有 0 或 1 個）：

| 值 | 用途 | 例 |
|----|------|----|
| `project` | 有明確完成目標＋會結束 | 某 code project、某次採購、牙周治療決策 |
| `area` | 長期維護、無完成日 | Health、Finance、AI Tools |
| `resource` | 參考研究資料 | 文獻、cost guide、方法頁（如 Karpathy pattern） |
| `archive` | 已完成／過期／暫不用 | 結案 project、舊版本 |
| `inbox` | 未分類（或 `raw/` 內未 compile 的來源） | 剛丟入未整理 |

規則：
- `para` 與既有 `type`/`domain` **正交**——`type` 講「這是什麼」(moc/source/concept…)，`para` 講「這在我生活裡的角色」。
- 不確定時**留空**並標 `To confirm`，不要亂猜（見 workflow spec rule 7–8）。
- Coding／business project 在 vault 的 project 頁設 `para: project`，frontmatter 加 `code_path:` 指向 repo；repo 的 `CLAUDE.md` 反指此頁 = Model B 對應。
- 完整 PARA／第二大腦操作哲學見 `~/AI/Claude/General/obsidian-claude-workflow.md`（north star）。

## Git auto-commit

vault `.claude/settings.json` 的**原生 PostToolUse hook**（取代已移除的 claude-obsidian 外掛）自動 commit wiki 編輯：`git add -- wiki/ raw/ .vault-meta/`，有改動就 `git commit ... -m "wiki: auto-commit <HKT>"`（HKT 時間戳直接寫入，無需 amend）。尊重 `.vault-meta/auto-commit.disabled` toggle（建個空檔即暫停）。
它需要**三個 pathspec 都能解析**，故本 vault 保留已追蹤的 `raw/.gitkeep` 與
`.vault-meta/.gitkeep`。**別刪它們** —— 否則 `.vault-meta/` 不存在（git add 中止）、
`raw/` 無追蹤檔（pathspec 報錯），而 hook 吞掉錯誤（`2>/dev/null || true`），
於是 wiki 編輯**靜默地停止 commit**。驗證：wiki 編輯後 `git status` 應乾淨，log 應出現
`wiki: auto-commit <date> HKT` 提交。
注意：**hook 只 commit `wiki/ raw/ .vault-meta/`** —— `Meta/`、`.claude/`、`CLAUDE.md`、`Inbox/`、`Projects/`、`Bookmarks/`、根層其他檔都**不在**範圍，需手動 commit。並且 hook **只 commit、不 push**（Claude bash 無 TTY；push 由你喺自己終端機做）。

## 收工 workflow（session wrap-up → Model B）

當使用者講「**收工**」/ session 結束時，Claude Code 做：

1. **回顧本次 session** 做咗咩（讀對話脈絡，唔係倒 raw log）。
2. **抽精華**：decisions、值得保存的 outputs、next actions、open questions。掉 chat noise。
3. **定位 project 頁**：對應的 code repo ↔ vault 內 `para: project` 且 `code_path` 指向該 repo 的頁。
   - 若未有 → 用 `Meta/templates/project-overview.md` 在 `Projects/<name>.md` 建立，填 `code_path:`，並從 [[Projects]] hub 連出。
4. **寫入精華**（增量，不覆寫）：
   - `## Log` append 一行 `YYYY-MM-DD：<一句總結>`
   - 有決策 → 更新 `## Key Decisions`（或在 `Projects/` 另開 decision-log 頁）
   - 有未完 → 更新 `## Next Actions` / `## Open Questions`
   - 不確定的 → 標 `To confirm`，**不 invent**
5. **更新 `wiki/hot.md`**（近期脈絡）+ append `wiki/log.md`（操作日誌）。
6. **告訴使用者**：邊啲已寫入 vault、邊啲只留喺 repo（raw log 唔入）。

**Model B 對應**：vault project 頁 frontmatter 帶 `code_path: <repo 路徑>`；repo 的 `CLAUDE.md` 加一行反指此 vault 頁。兩邊互指。
精華準則見 `~/AI/Claude/General/obsidian-claude-workflow.md`（§10 輸出格式、§20 規則）。

## Wiki Knowledge Base (for other projects)

當其他專案的 CLAUDE.md 指向本 vault：
1. 先讀 `wiki/hot.md`（近期脈絡，~500 字）
2. 不夠就讀 `wiki/index.md`（完整目錄）
3. 再讀目錄指到的個別 `wiki/<頁名>.md`
