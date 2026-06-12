# Second Brain — LLM Wiki（Karpathy 模式）

Mode: D+C+E (Personal + Projects + Research)
Purpose: Mixed second brain for personal life, projects, and research
Owner: masterdr
Created: 2026-06-07 ・ Restructured to flat Karpathy pattern: 2026-06-11 ・ 改混合結構（meta 平放＋領域資料夾）: 2026-06-12

> 完整建置藍圖與三方關係（Karpathy / claude-obsidian / kepano）見 [OBSIDIAN-SETUP.md](OBSIDIAN-SETUP.md)。

## 核心原則：LLM 當 compiler，不是 retriever

- 不用 RAG pipeline、**不用向量資料庫**。個人規模（~100 篇）下，`index.md` + context window 即足以檢索。
- **混合結構**：`wiki/` 根層平放 meta（`index/log/hot/overview`）與跨領域方法頁；**領域內容歸入領域資料夾**（如 `wiki/Health/Oral/Periodontal Disease/`），鏡射 MOC hub 階層。檢索仍靠 `index.md` + `[[wikilink]]`，資料夾只是人類瀏覽的次要動線。
- Wikilink 不帶路徑、Obsidian 靠檔名解析 → 內容入夾**零斷連**；`.base` 靠 frontmatter `domain` filter、非路徑 → 入夾不受影響。
- 人做 curation／提問／綜合意義；LLM 做其餘全部機械工作（摘要、連結、一致性、更新傳播）。

## Structure

```
second-brain-2026-06-06/
├── .raw/                    # 不可變來源（articles/transcripts/screenshots/data/assets）— 只讀不改
├── wiki/                    # 混合維基層 — meta＋方法頁平放，領域內容入領域資料夾
│   ├── index.md             # 唯一目錄＝查詢入口（用 frontmatter type 分組）
│   ├── log.md               # append-only 操作日誌（新項置頂）
│   ├── hot.md               # ~500 字近期脈絡快取
│   ├── overview.md          # 執行摘要
│   ├── <跨領域方法頁>.md      # 如 Karpathy LLM Wiki Pattern — 不屬單一領域者平放根層
│   └── Health/              # 領域資料夾，鏡射 MOC hub 階層
│       ├── Health.md        # 領域 hub（type: moc）
│       └── Oral/
│           ├── Oral Health.md
│           └── Periodontal Disease/   # 牙周病：hub＋.base＋20 內容頁
│               ├── Periodontal Disease.md
│               ├── Periodontal Disease.base
│               └── <內容頁>.md          # source / concept / entity / comparison / resource
├── _templates/              # 筆記模板
├── _attachments/            # 圖片與 PDF
├── CLAUDE.md                # 本檔：行為契約
├── OBSIDIAN-SETUP.md        # 建置藍圖（Karpathy + kepano）
└── WIKI.md                  # 完整 LLM 操作手冊
```

## 四階段迴圈（workflow）

`Ingest → Compile → Query&Enhance → Lint&Maintain →（回到 Compile）`

- **Ingest**：丟來源進 `.raw/`，說「ingest [filename]」。圖片下載到本機，別只存 URL。
- **Compile**：LLM 讀 `.raw/`，增量建/改頁面、交叉引用、更新 `index.md`、append `log.md`。一個來源可能動 10–15 頁。
- **Query & Enhance**：提問 → 讀 `hot.md` → `index.md` → 個別頁，帶引用作答；**好答案歸檔回 wiki** 成新頁。
- **Lint & Maintain**：說「lint the wiki」健檢——孤兒頁、死連結、過時聲明、缺交叉引用，並建議下一步研究。

## Conventions

- 所有筆記用 YAML frontmatter：`type, status, created, updated, tags`（最少）。`type` 與 `domain` 才是分類主軸，資料夾只是次要瀏覽動線。
- Wikilinks 用 `[[Note Name]]` — 檔名唯一，**不帶路徑**（入夾、搬夾都不會弄斷連結）。**檔名須全 vault 唯一**，否則 Obsidian 無法靠檔名解析。
- `.raw/` 是來源，永不修改。
- `wiki/index.md` 是唯一目錄 — 每次 ingest 都更新（即使內容入了資料夾，index 仍是檢索入口）。
- `wiki/log.md` append-only — 新項置頂，永不改動過去條目。
- **領域內容入領域資料夾**，鏡射 MOC hub 階層（目前：`Health/Oral/Periodontal Disease/`）。Meta 與跨領域方法頁留 `wiki/` 根層。claude-obsidian 的 ingest/save skill 會自建資料夾——順其建在對應領域夾，但每頁仍須有 `domain` 與正確 `type`。

## Git auto-commit

claude-obsidian 外掛經 PostToolUse hook 自動 commit wiki 編輯，執行
`git add -- wiki/ .raw/ .vault-meta/ && git commit -- wiki/ .raw/ .vault-meta/`。
它需要**三個 pathspec 都能解析**，故本 vault 保留已追蹤的 `.raw/.gitkeep` 與
`.vault-meta/.gitkeep`。**別刪它們** —— 否則 `.vault-meta/` 不存在（git add 中止）、
`.raw/` 無追蹤檔（git commit pathspec 報錯），而 hook 會吞掉這兩個錯（`2>/dev/null || true`），
於是 wiki 編輯**靜默地停止 commit**。驗證：wiki 編輯後 `git status` 應乾淨，log 應出現
`wiki: auto-commit <date>` 提交。
注意：根層檔（如 `CLAUDE.md`、`OBSIDIAN-SETUP.md`、`WIKI.md`）**不在** hook 範圍，需手動 commit。

## Wiki Knowledge Base (for other projects)

當其他專案的 CLAUDE.md 指向本 vault：
1. 先讀 `wiki/hot.md`（近期脈絡，~500 字）
2. 不夠就讀 `wiki/index.md`（完整目錄）
3. 再讀目錄指到的個別 `wiki/<頁名>.md`
