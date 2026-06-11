# Second Brain — LLM Wiki（Karpathy 模式）

Mode: D+C+E (Personal + Projects + Research)
Purpose: Mixed second brain for personal life, projects, and research
Owner: masterdr
Created: 2026-06-07 ・ Restructured to flat Karpathy pattern: 2026-06-11

> 完整建置藍圖與三方關係（Karpathy / claude-obsidian / kepano）見 [OBSIDIAN-SETUP.md](OBSIDIAN-SETUP.md)。

## 核心原則：LLM 當 compiler，不是 retriever

- 不用 RAG pipeline、**不用向量資料庫**。個人規模（~100 篇）下，`index.md` + context window 即足以檢索。
- `wiki/` **扁平**：所有頁面平放，靠 `index.md` 分組、靠 `[[wikilink]]` 連結，**不靠資料夾分類**。
- 人做 curation／提問／綜合意義；LLM 做其餘全部機械工作（摘要、連結、一致性、更新傳播）。

## Structure

```
second-brain-2026-06-06/
├── .raw/                    # 不可變來源（articles/transcripts/screenshots/data/assets）— 只讀不改
├── wiki/                    # 扁平維基層 — 所有頁面平放於此，無分類子資料夾
│   ├── index.md             # 唯一目錄＝查詢入口（用 frontmatter type 分組）
│   ├── log.md               # append-only 操作日誌（新項置頂）
│   ├── hot.md               # ~500 字近期脈絡快取
│   ├── overview.md          # 執行摘要
│   └── <所有內容頁>.md       # source / concept / entity / comparison / resource / question 全平放
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

- 所有筆記用 YAML frontmatter：`type, status, created, updated, tags`（最少）。`type` 取代資料夾做分類。
- Wikilinks 用 `[[Note Name]]` — 檔名唯一，**不帶路徑**（攤平不會弄斷連結）。
- `.raw/` 是來源，永不修改。
- `wiki/index.md` 是唯一目錄 — 每次 ingest 都更新。
- `wiki/log.md` append-only — 新項置頂，永不改動過去條目。
- **不建分類資料夾。** claude-obsidian 的 ingest/save skill 預設想建資料夾——以本契約為準，一律平放於 `wiki/` 根層。

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
