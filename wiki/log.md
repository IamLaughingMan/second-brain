---
type: meta
title: "Wiki Log"
updated: 2026-06-19
cssclasses:
  - log
---

# Wiki Log

## [2026-06-19 20:28 HKT] bookmark | Paula 寶拉「Karpathy 筆記術」YouTube（`FdSO1Yhr76I`）→ `Bookmarks/AI/LLM Wiki/`（user-supplied）。**首次實戰 yt-dlp**：YouTube 出 bot-wall，換 player_client 無效，靠 `--cookies-from-browser chrome` 攞到 info-json + en 自動字幕（safari cookies 受 sandbox 擋）；srt 轉換因冇 ffmpeg 失敗 → parse 原 `.vtt` 去碼去重得 ~10k 字逐字稿，連中文章節描述全 archive。內容正係本 vault 基礎方法（Karpathy LLM-wiki：raw+wiki+index+log+claude.md、無 RAG）。YouTube cookies SOP 補入 `[[yt-dlp]]` gotcha。Bookmarks/ 手動 commit。

## [2026-06-19 20:18 HKT] config | 修正 `AGENTS.md`：原本只 pointer 指住 `CLAUDE.md`，但其他 AI 唔會自動有 CLAUDE.md 內容（佢哋只 auto-read AGENTS.md），且 CLAUDE.md 多嘢 Claude 專屬。改為 **AGENTS.md 自含「Vault conventions」section**（agent-agnostic 子集:frontmatter／wikilink uniqueness／raw 唯讀／index／log append-only＋format／dual-log／HKT／status-over-folder／commit scope／no-push／ask-before-destructive），令其他 AI 淨讀 AGENTS.md 都有齊核心規矩。確立 **AGENTS.md ⊂ CLAUDE.md** 兩層拆分:通用規矩兩檔同步、Claude 專屬只入 CLAUDE.md、衝突 CLAUDE.md 為準。CLAUDE.md 跨-AI section 補同步責任。

## [2026-06-19 20:12 HKT] feature | 新增**跨-AI 溝通**機制（雙向）：(1) root **`AGENTS.md`**（vendor-neutral，俾 Codex/Gemini/Cursor 等其他 AI 自動讀）—— 介紹 vault 由 Claude 維護、指引其他 AI ① 讀 `CLAUDE.md` ② 去溝通頻道讀/留言 ③ 回應時報名（AI 名+model）。(2) **`Meta/ai-comms/ai-comms.md`** —— protocol + append-only 訊息板二合一，報名格式 `[<AI>/<model> · HKT]`，seed 訊息由 Claude(Opus 4.8) 開張。CLAUDE.md 加「跨-AI 溝通」section（教 Claude 自己點用 + 手動 commit）+ root 樹補 AGENTS.md/ai-comms + auto-commit scope 註加 AGENTS.md。夾名選 `ai-comms`。全部 hook scope 外、手動 commit。

## [2026-06-19 20:08 HKT] config | `Meta/Software/Software.md` 補 runtime row：新增 **node（帶 npm/npx，v24.16.0 / npm·npx 11.13.0，`.pkg/manual` @ `/usr/local/bin`，非 brew）**；`uv` row 標明帶 `uvx`。核實：`uvx`⊂uv（brew Cellar 同帶 bin/uv+bin/uvx）、`npx`⊂node（npm 一齊嚟）→ 兩個係 runner 非獨立 install，併入母工具 row 並加註解行。`npm -g` 工具（defuddle/claude-auto-retry/happy）全靠呢個 node。Meta/ 手動 commit。

## [2026-06-19 20:02 HKT] config | 兩件：(1) **補 MCP catalog 頁** `Meta/extensions/mcp.md`（對 `~/.claude.json` 核實）：`obsidian-vault`（user scope，npx @bitbonsai/mcpvault）、`filesystem`+`fetch`（**project-scoped 落 `~/AI/Claude/General`**，故本 vault session 見唔到）、`happy`（Happy harness 注入）。記低 user/project/harness 三 scope + scope 陷阱。extensions hub 由「三類」改「四類」加 [[mcp]]。(2) **`Meta/tools/` 改名 `Meta/Software/`**（使用者選 Software，涵蓋 CLI+macOS app+套件勝過「tools」）：`git mv` folder + `tools.md`→`Software.md`；更新 title/heading/tags(tools→software)、自引用、`[[tools]]`→`[[Software]]`（yt-dlp.md、extensions.md）；MCP gap 註改為已建。CLAUDE.md Meta 樹補 `Software/` + `mcp.md`。殘留 `[[tools]]` 只剩 append-only log + Claude history transcript（不改）。Meta/ + CLAUDE.md 手動 commit。

## [2026-06-19 19:52 HKT] backfill | `Meta/tools/tools.md` 回溯 activity CSV 補入既往工具，逐個 `which`/`/Applications` 核實仍在：**CLI 7**（yt-dlp / uv / rtk / defuddle / claude-auto-retry / claude-conversation-extractor / happy）+ **macOS app 3**（Obsidian brew-cask / cmux / Amphetamine Enhancer）。新增**裝法詞彙**答 macOS app 命名問題：`brew`/`brew-cask`/`npm -g`/`pip`/`App Store`/`.dmg/manual`；類型 `CLI`/`app`。**唔歸 tools/** 嘅 CSV install 標明去向：MCP Filesystem/Fetch→extensions（gap：無 MCP 頁）、claude-obsidian→plugins 歷史、Karpathy/Raymond Hou→config/reference。規矩放寬：table row mandatory、工具頁 optional。backfill 舊 row CSV 未記裝者 → 留「—」。Meta/ 手動 commit。

## [2026-06-19 19:44 HKT] feature | 新增 `Meta/tools/` catalog —— 記錄「我裝／Claude 幫手裝」嘅系統工具（CLI/app/套件），同 `extensions/`（Claude/Obsidian skills/plugins/hooks）+ activity CSV（事件流）分工清楚：tools = 當前狀態人類索引。組件：`tools.md` hub（清單表 + 狀態詞彙 使用中/候選/已移除 + 規矩 + 同 extensions/CSV 邊界）、`yt-dlp.md` 首頁（係咩/點裝/點用/gotcha/接 vault pipeline，frontmatter `type: tool` + `version/install_path/installed_by` 等）。`extensions.md` hub 加指返 [[tools]] 嘅邊界 callout。Meta/ 手動 commit。

## [2026-06-19 19:38 HKT] install | `yt-dlp 2026.06.09`（brew，`/opt/homebrew/bin/yt-dlp`，12 deps 含 python@3.14）—— 開啟 YouTube 記錄能力。Bash 實測有網絡（YouTube 200）⇒ Claude 可自行跑。用途：抓 metadata（`--write-info-json --write-description`）+ **字幕/transcript**（`--write-auto-sub --write-sub --sub-lang en,zh-Hant,zh-Hans --convert-subs srt`）→ 落 `raw/transcripts/<slug>.md`（不可變 source）→ ingest 入 wiki，或塞 YouTube bookmark 嘅 `## Full Content`。`ffmpeg` 未裝（字幕唔需要；冇字幕嘅片要抽音轉錄先補 ffmpeg + Whisper）。install start/success 兩 row 已入 CSV。

## [2026-06-19 19:30 HKT] config | Superpowers 記入 extensions catalog，marker = **候選**（揀「候選/candidate」勝過「備用/未用」——評估過＋特定情境會採用之意）。`Meta/extensions/plugins.md`：頂部立 catalog 狀態詞彙（使用中／候選／已移除）+ 新「## 候選（評估過・未採用）」段（superpowers 全評估＋採用條件 per-project enable＋跨 project 提醒指標）。`skills.md`：加「## 候選 skill-bundle」一行 pointer（14 dev skill、重疊 built-in code-review/verify/write-tests）。兩檔 updated 已係 06-19。Meta/ 手動 commit。

## [2026-06-19 19:24 HKT] config | Superpowers 決定 = 擺住 reference 先（唔裝）。喺 `~/AI/Claude/CLAUDE.md`（跨 project shared，loose config 非 repo、即改即生效）加「## 候選工具提醒（parked）」段：將來喺**實質 code project** 要結構化 TDD/plan/review 嗰陣，輕提使用者試 Superpowers（per-project enable、唔好 user-level、講埋 SessionStart 同 CLAUDE.md 競爭 trade-off），唔硬推、純筆記工作唔提。Bookmark Status 改 parked reference。跨 project memory 唔靠 vault memory（只 load 本 vault），靠 shared CLAUDE.md 機制。

## [2026-06-19 19:18 HKT] bookmark | Superpowers (obra) → `Bookmarks/AI/Claude Code/Tools/Superpowers (obra).md`（user-supplied，無 found-by-claude）。Claude Code plugin：14 skill + session-start hook，強制 brainstorm→design→plan→TDD→review→finish-branch 方法論（Jesse Vincent / Prime Radiant，MIT）。全文 archive（README 結構化摘錄）。**Overlap 評估**：無硬碰撞（skill namespaced、SessionStart event 你未用）；功能重疊 built-in code-review/verify/write-tests + user security-audit；主風險＝SessionStart 每 session 注入 opinionated 重流程，競爭 ~/.claude CLAUDE.md「Simplicity/Surgical」+ vault session-start 協定；對 vault 筆記無關、值喺 code project。建議若試 = per-project enable、唔好 user-level。Bookmarks/ 手動 commit。

## [2026-06-19 19:08 HKT] feature | 新增 root folder `Personal/` 念頭簿：一念一檔（`Personal/Ideas/<name>.md`，`type: idea`），進度靠 frontmatter **`stage`** 欄（未做/做緊/完成/可能開project，與 `status` active/archived 正交，不開狀態 folder/不搬檔）。組件：`Personal/Ideas.md` hub（stage 詞彙 + 「可能開project」→ promote 去 Projects/ 流程）、`Personal/Ideas.base`（6 view：00 全部/01 未做/02 做緊/03 完成/04 可能開project/Board cards group-by-stage，YAML 已驗、groupBy 用結構式）、`Meta/templates/idea.md` 模板、1 個示例 idea（可刪）。CLAUDE.md 結構樹 + auto-commit scope 註補 `Personal/`。Personal/ 喺 auto-commit hook scope 外、手動 commit。

## [2026-06-19 19:01 HKT] config | Extensions catalog 對 fs reconcile：核對 `Meta/extensions/` 4 個 catalog 同實際 fs。**修正 drift（plugins.md）**：(i) Claude Code plugin `obsidian@obsidian-skills` 實際 enable 喺 **user-level**（`~/.claude/settings.json`）唔係 vault-level——故 5 個 obsidian skill 任何 project 都 load；(ii) Obsidian core plugins 由列 11 個補齊到實際 enable 21 個，補上關鍵 `bases`（驅動全 vault .base view）＋ `templates`/`daily-notes`/`sync` 等，並列出 10 個 disabled。**核對無 drift**：user commands(4)、user/vault skills(0)、obsidian-skills v1.0.1→5 skills、built-in skills(14)、所有 hook（vault PostToolUse；user UserPromptSubmit/SessionEnd/PreToolUse/PostToolUse/Stop + statusLine）。Bump `updated` → 2026-06-19：plugins/skills/extensions（hooks.md 已係 06-19 且準）。Meta/ 喺 auto-commit scope 外、手動 commit。

## [2026-06-19 03:35 HKT] backfill | Claude history 一次性 backfill：`~/.claude/hooks/backfill-claude-history.py`（重用 hook 嘅 parsing／filter／format 邏輯、state-file dedup、idempotent）掃 `~/.claude/projects/` 全部 jsonl→29 個 session .md 創建（2026-05-31 → 2026-06-19），1 跳過（current session by hook）、1 跳過 empty、0 error。Backfilled 檔有 `status: archived` + `tags: [claude-history, backfilled]` + `ended:` 欄、頂部「> Backfilled from...」註。**意外發現：Stop hook 喺改 settings.json 之後 mid-session 即時 picked up**——current session 從第 1 turn 起已完整 mirror 入 vault；唔需重開先 work，記憶已 update。Hub MOC（`Claude history/Claude history.md`）加 backfill 章。

## [2026-06-19 03:15 HKT] feature | 新增 Claude history 自動記錄系統：(i) `~/.claude/hooks/log-claude-session.py`（Python，per-turn Stop hook，parse transcript jsonl、剝 `<system-reminder>`/`<local-command-*>` CLI 雜訊、frontmatter `type: claude-session`、HKT 時間戳）；(ii) `~/.claude/settings.json` 加 Stop hook 註冊；(iii) vault root 新增 `Claude history/`（hub MOC + .base 4 view）；(iv) `.gitignore` exclude session 內容（保留 hub）；(v) `Meta/extensions/hooks.md` catalog 新增。Smoke test 通過。**Settings load only at session start → 要新開 session 先生效**

## [2026-06-19 03:00 HKT] fix | Framing 修正：之前研究頁/hot 寫「本 vault 屬蒸餾派」係錯——vault 係 **mixed-mode**，Karpathy ②派只 gate `wiki/` + 部份 `raw/`；其他 root folder（Bookmarks/Inbox/Projects/Meta/提議中 Claude history/）各有自己邏輯。改：[[Recording Claude Conversations in Obsidian]] 6 處標籤 + hot.md 對應行 + 新 memory feedback-vault-mixed-mode

## [2026-06-19 02:45 HKT] config | Typed-folder 建夾規則細化：trigger 一旦 fire（≥3 types each ≥2 pages），**只建已出現嘅 type folder**（≥1 頁先建、0 頁跳過），避免空夾 noise。日後新 type 第一頁先補建對應 folder。改 vault CLAUDE.md（typed-folder catalogue 標題 + 「Folder 建唔建」段 + Claude 行為段）+ memory project-domain-typed-folder-pattern

## [2026-06-19 02:30 HKT] config | Domain typed-folder trigger rule 改寫：由「累積到 ~15+ 頁」單一閾值 → **「≥3 個 type 各 ≥2 頁」**（distribution > raw count）。理由：5 typed folder 嘅意義喺於 type 之間分得開；20 頁全 piled 落 sources/ 反而 noise > signal。改 vault CLAUDE.md「Domain-level typed-folder pattern」section（兩處）+ memory project-domain-typed-folder-pattern + MEMORY.md index

## [2026-06-18 21:40 HKT] research | 歸檔研究頁 [[Recording Claude Conversations in Obsidian]]（type: synthesis, domain: pkm）：大家點用 Obsidian 記錄 Claude 對話——兩派哲學（存原始 vs 蒸餾）、A–E 五類做法、GitHub 高星 landscape（REST API by stars）。更新 index.md（filed answers）+ hot.md（session 摘要）。Sources 含 cctrace/claudian/NicholasSpisak-second-brain 等

## [2026-06-18 21:12 HKT] config | bookmark pipeline 寫入「存全文前 cleanup」標準步驟（parent CLAUDE.md step 1 + memory）：剝 badge/圖片、剝空連結殼、trim sidebar nav、存前驗 0 殘跡（附確切 perl regex）。另記 defuddle CLI 用法 + zsh/RTK 批次處理改用 Python

## [2026-06-18 20:58 HKT] backfill | 現有 9 個 bookmark 套用新全文預設：defuddle 抽全文（剝 badge/圖片雜訊、natto trim sidebar nav）寫入各檔尾 `## Full Content (archived)` + `## Key Comments`（全屬 reference source/非社媒 → 留言不適用）；frontmatter 補 `summary:`、bump `updated: 2026-06-18`。YAML 全驗過。Bookmarks/ 手動 commit。另全局裝 defuddle 0.19.0

## [2026-06-18 20:22 HKT] config | bookmark 降掃描成本（全文仍 inline）：全文 + 留言移到檔尾 + 分隔線 `<!-- ARCHIVE BELOW -->`、frontmatter 加 `summary:`（triage 零 body 成本）、search-first triage 守則（get_frontmatter / Read limit / search_notes，唔 bulk full-read）。`.base` 本來只讀 frontmatter，inline 全文對佢零影響。改：Meta/templates/bookmark.md、parent CLAUDE.md pipeline、memory

## [2026-06-18 20:06 HKT] config | bookmark 改預設：自動連全文 + 重要留言一齊存入 bookmark 檔本身（## Full Content / ## Key Comments，防 link-rot 尤其社媒）；留言抓唔到明寫「未能抓取」、唔扮抓；raw/ 不受影響（raw_source 仍為 Layer 2 bridge pointer）。改：parent CLAUDE.md pipeline、Meta/templates/bookmark.md、Bookmarks/Bookmarks.md、vault CLAUDE.md + memory

## [2026-06-18 02:15 HKT] style | 縮細 wiki/log.md 嘅 H2 字體：log.md frontmatter 加 cssclasses: [log]，.obsidian/snippets/vault-colors.css 加 `.log h2` rule（font-size 1.05rem、無 border-bottom、opacity 0.85）；只影響 cssclasses 有 log 嘅檔，唔波及其他 H2

## [2026-06-18 02:00 HKT] doc | 加 Bookmark↔raw↔wiki bridge 3-layer architecture：(i) CLAUDE.md 新章節（Karpathy 性質保留＋frontmatter triangle raw_source/wiki_page/bookmark）；(ii) Bookmarks.md hub 加 promote workflow；(iii) Meta/templates/bookmark.md 加 commented bridge fields；(iv) memory 新增 project-bookmark-raw-wiki-bridge

## [2026-06-18 01:15 HKT] rename | Oral Health.md → Oral.md（align folder-note 命名統一：folder name = note name，同 Health/Bookmarks/Inbox/Projects 一致）；title/H1 同步收短「Oral（口腔健康）」；5 處 [[Oral Health]] wikilink update

## [2026-06-18 01:00 HKT] fix | Bookmarks.base 無法解析：groupBy: domain（bare string 短形）改用 structured form `{property: domain, direction: ASC}`，align Periodontal Disease.base 工作版本；Obsidian Bases plugin 升級後似乎唔再 accept 短形

## [2026-06-18 00:45 HKT] move | Karpathy LLM Wiki Pattern.md：wiki/ → Meta/docs/（同 OBSIDIAN-SETUP / WIKI 一齊做 vault setup 三件套，性質係靜態 spec、唔屬 compounding knowledge）；wikilink path-indep 自動 work；wiki/index.md Resources 移走加 [!info] 註；CLAUDE.md tree 同步

## [2026-06-18 00:30 HKT] restructure | rename Periodontal Disease overview.md → overview.md；rm root wiki/overview.md（採 multi-wiki per-domain overview，root 不設 vault-wide overview）；CLAUDE.md 寫入「Domain-level typed-folder pattern」明文規矩（5 typed folder + 3 root meta + filename 例外 + ingest 門檻 ~15 頁）

## [2026-06-18 00:00 HKT] restructure | 加第 5 個 typed folder synthesis/，git mv Research - Severe Periodontitis... 入位；root 淨低 3 件 meta（hub + overview + .base）；hub 內 [!note] 同步更新

## [2026-06-17 23:45 HKT] add | Periodontal Disease overview.md（type: overview，domain-level catalog-narrative，分頁類列＋現況 takeaway＋gap；同 Research synthesis 並列分工）；順手 root overview.md frontmatter type meta→overview，兩 overview 統一

## [2026-06-17 23:30 HKT] restructure | revert Oral mini-wiki（刪 Oral overview/index/log + 4 empty folder）；轉落 Periodontal Disease/ 起 4 typed folder（sources 8、concepts 5、entities 2、analyses 4），19 篇 git mv 入位；root 留 hub + .base + 1 synthesis；wikilink 全部 path-independent 自動 work

## [2026-06-17 23:00 HKT] restructure | wiki/ split overview ↔ index（align Karpathy 一手）+ 喺 wiki/Health/Oral/ 起 mini-wiki：Oral overview / Oral index / Oral log + 4 typed folder（analyses/concepts/entities/sources）；Oral Health hub 補連結；檔名加 "Oral " prefix 避撞 root 同名

## [2026-06-17 22:45 HKT] fix | unhide raw 後 Obsidian sidebar 仲灰：刪 .obsidian/snippets/vault-colors.css 入面 dim raw 嘅 CSS rule；同步 Meta/docs/WIKI.md 移走 raw=Gray 嘅文檔

## [2026-06-17 22:30 HKT] config | Obsidian attachmentFolderPath: Meta/attachments → raw/assets（align Karpathy）；raw/ 5 個 subfolder 加 .gitkeep（articles/assets/data/screenshots/transcripts，git 追蹤 + 新 clone 唔失）；CLAUDE.md tree 標 Meta/attachments 棄用

## [2026-06-17 22:15 HKT] refactor | rename .raw/ → raw/（不再隱藏，align Karpathy 一手 gist）；全 vault 12 處 references 同步（CLAUDE.md / WIKI.md / OBSIDIAN-SETUP.md / Inbox / Bookmarks / hooks / source template / hot / settings.json hook / css snippet）

## [2026-06-17 22:00 HKT] doc | Karpathy attribution 重整：wiki/Karpathy LLM Wiki Pattern.md ＋ Meta/docs/OBSIDIAN-SETUP.md § 一 加 K/D/V 出處標記（Karpathy 一手 / DAIR.ai 解說 / 本 vault 自加），明確分清 3 ops vs 4 階段、hot.md 屬 V

## [2026-06-17 21:50 HKT] bookmark | user-supplied Karpathy LLM Wiki 一手 gist → Bookmarks/AI/LLM Wiki/（domain pkm；vault 嘅 foundational source）

## [2026-06-17 21:30 HKT] cleanup | 刪走 Bookmarks/active.md + archive.md（同 Bookmarks.base 嘅 Active/Archive view 完全重複）；教學文字搬入 Bookmarks.md hub；update wiki/index.md ＋ vault CLAUDE.md 嘅 broken refs

## [2026-06-17 21:00 HKT] bookmark | user-supplied 思思醫師「納豆激酶與血管斑塊」一篇入 Bookmarks/Health/Cardiovascular/Nattokinase/（新領域夾；冇 found-by-claude）

## [2026-06-17 20:45 HKT] doc | Meta/extensions/skills.md 重整：分「一般 Claude skills」（14 built-in + 4 user-level commands）vs「Obsidian Claude skills」（5 kepano，`obsidian:` namespace）兩條軸；補充 commands vs skills 嘅 fs 區分 footnote

## [2026-06-17 20:25 HKT] reorg | 新增 Meta/extensions/ 統稱（skills + plugins + hooks）：刪舊 stale Meta/skills.md（仲 reference 已移除嘅 claude-obsidian），整 hub + 3 個 catalog（reflect 真實安裝：kepano obsidian-skills v1.0.1 + 5 skills、obsidian core plugins、vault PostToolUse + user-level 5 個 hook）；vault CLAUDE.md Structure tree 同步

## [2026-06-17 20:05 HKT] doc | OBSIDIAN-SETUP.md 加 §四「Layout sources 全面 audit」：一張表列晒每個 layout 元素來自邊個 source（Karpathy/kepano/Bryan Hogan/PARA/GTD/LYT/Matuschak/vault 內生）

## [2026-06-17 19:50 HKT] doc | sync bookmark 規矩到實況：Bookmarks/Bookmarks.md hub ＋ vault CLAUDE.md Structure tree 改用「深層細分 tree、獨立於 wiki、pointer stub 多 folder」（取代舊 by-domain 淺層 / 鏡射 wiki 嘅講法）

## [2026-06-17 19:35 HKT] doc | 將 `found-by-claude` provenance 約定 checked-in：寫入 Bookmarks/Bookmarks.md 規矩＋frontmatter 例子，同 Meta/templates/bookmark.md（commented-out 預設不帶）

## [2026-06-17 19:20 HKT] reorg | ccusage 加 pointer stub 入 AI/Coding Agents/（type: pointer + ![[ccusage]] 嵌入；支援多 coding-agent）

## [2026-06-17 19:10 HKT] reorg | 多 folder 方案改用 B（pointer stub）：還原 Bookmarks.base 嘅 By tag view；喺 AI/Coding Agents/ 整 Claude Code History Viewer 指針（type: pointer + ![[正本]] 嵌入，唔複製內容）

## [2026-06-17 18:55 HKT] base | Bookmarks.base 加「By tag」view（groupBy: tags）＋ file.folder 欄：一個 bookmark 靠多個 tag 出現喺多個分類，唔郁檔案位置（多 folder 輕量方案 A）

## [2026-06-17 18:35 HKT] tag | 6 個 Claude 網上搵到嘅 bookmark 加 provenance tag `found-by-claude`（新規矩：Claude 自己搵到嘅 link 標記返）

## [2026-06-17 18:20 HKT] reorg | bookmark 深層細分 tree（續）：usage/ccusage/History Viewer → AI/Claude Code/Tools/；Ponytail → AI/Coding Agents/

## [2026-06-17 18:05 HKT] reorg | bookmark 改用深層細分 tree：Web Clipper 3 篇由 Bookmarks/PKM/ 搬入 Bookmarks/AI/Obsidian/Tools/Web Clipper/（domain 留 pkm；推翻舊 shallow 決定）

## [2026-06-17 17:45 HKT] bookmark | 加 3 個 Claude Code 用量/歷史工具入 Bookmarks/AI（usage、Claude Code History Viewer、ccusage）

Append-only. New entries go at the TOP. Never edit past entries.

---

## [2026-06-17 03:51 HKT] bookmark | auto-bookmark 本 session 搵到嘅 3 個 PKM source
- 更正：auto-bookmark trigger 主語係 **Claude 搵到**（唔係使用者掉 URL）。已改全局 `~/AI/Claude/CLAUDE.md` Bookmark capture section：兩種 trigger，「Claude research 搵到有用 → 主動自動 bookmark」為主。
- 實踐：將本 session research 搵到嘅 3 個 reference-grade source 存入 `Bookmarks/PKM/`（domain: pkm）：
  - [[Obsidian Web Clipper]]（官方 templates 文件）
  - [[kepano - Obsidian Web Clipper]]（大神 bucket）
  - [[Obsidian Community Web Clipper Templates]]（community bucket GitHub）
- 新 domain 夾 `Bookmarks/PKM/`。皆 auto-commit hook 範圍外，需手動 commit。

---

## [2026-06-17 03:45 HKT] config | 全局 CLAUDE.md 加「自動 bookmark」workflow
- 喺 `~/AI/Claude/CLAUDE.md`（全局 AI-projects 層）加 `## Bookmark capture` section：任何 project 掉 URL＋「bookmark」→ Claude 一鍵跑 pipeline（defuddle 讀內容 → 落 `Bookmarks/<Domain>/` → frontmatter＋domain → dual-log → commit；push 由人）。
- 另記瀏覽器一鍵法：官方 **Obsidian Web Clipper**（local-first、kepano 推薦），set 一個 Bookmark template（properties＋triggers 按站分流）；全文 clip 入 `Inbox/clippings/`。
- Research 兩 bucket：Web Clipper（官方／kepano）＋ community template 集／forum。出處連結已寫入該 section。
- 註：`~/AI/Claude/` 非 git repo，該檔 unversioned，無 commit；本事件只 dual-log。

---

## [2026-06-17 03:31 HKT] structure | Bookmarks 改 by-domain 淺層資料夾方案（取代已停用 flat）
- Research（大神＋community 兩 bucket）：kepano 少 folder＋Categories property/Bases，但仍留粗 top-level 夾；LYT 用 MOC；community 2025–26 偏 metadata/MOC、避免深 folder。結論＝**淺層 domain 夾**最符合且對齊本 vault hybrid wiki。
- 落實：`Bookmarks/AI/` 夾，`git mv Ponytail.md` → `Bookmarks/AI/Ponytail.md`，加 `domain: ai-tools`。
- `Bookmarks.base`：加 `domain`（領域）欄＋新「By domain」視圖（`groupBy: domain`）；Active/All 加 domain 欄。
- Doc：`Bookmarks.md` hub 換成 by-domain note＋規矩；`Meta/templates/bookmark.md` 加 `domain:`；vault `CLAUDE.md` Structure tree 更新。
- 原則：淺層、按需深、未分類留 root、`domain` 為真分類軸、`.base` filter 非 path（搬夾零斷連）、檔名全 vault 唯一。**皆在 auto-commit hook 範圍外，需手動 commit。**

---

## [2026-06-17 03:17 HKT] decision | flat-bookmarks 規則改做不執行（更正 03:12 條目）
- **更正**：03:12 條目記成「保留 flat、唔改」係 Claude 讀錯使用者意思。實際決定＝**flat / 唔起-subfolder 規則改做不執行（deprecated）**。Bookmarks 將來可起 by-category 資料夾（方案待設計），**現有檔暫不搬**。
- 範圍：只停用 flat/no-subfolder；「status 欄分 active/archive、不搬檔」規則**不受影響**，照舊。
- Live rule 已改（**皆在 auto-commit hook 範圍外，需手動 commit**）：`Bookmarks/Bookmarks.md` hub 加停用 banner＋刪線 flat 行；vault `CLAUDE.md` Structure-tree Bookmarks/ 註解改成「flat 規則 2026-06-17 起不執行」。memory `project-flat-bookmarks-decision` 已 flip。

---

## [2026-06-17 03:12 HKT] maintain | 校正 Karpathy 頁 plugin 字眼＋記錄 flat-bookmarks 決定
- `wiki/Karpathy LLM Wiki Pattern.md`：移除「本 vault（claude-obsidian 外掛）即是此模式的實作」等 stale 字眼，改為「Claude Code 手動執行＋原生 auto-commit hook」；工具分工段、Sources 段、`updated` 一併校正。之前 no-plugin 清理漏咗呢頁。
- **flat-bookmarks 決定**：保留現狀（Bookmarks flat、靠 `status`/`tags`+`.base` 分類）。出處＝kepano metadata-first／LYT fluid folders，**唔關 Karpathy 事**。已知張力：`wiki/` 領域內容已入資料夾（hybrid），但 Bookmarks 仍 flat ——列為日後可重訪嘅 open question，**今次唔改**。

---

## [2026-06-17 03:01 HKT] bookmark | 加 Ponytail（AI coding-agent minimalist ruleset）
- 新增 `Bookmarks/Ponytail.md`：`type: bookmark`、`status: active`、`para: resource`。
- URL: https://github.com/DietrichGebert/ponytail（MIT、~23.5k★、JS）。核心理念「最好嘅 code 係冇寫過嘅 code」（YAGNI 決策階層）。
- Tag 分類 `ai-tools / coding-agents / yagni / prompt-engineering`；related 連 [[Karpathy LLM Wiki Pattern]]。
- 跟 Bookmarks flat convention，**唔起 subfolder**（分類靠 tag/status + `.base` view）。

---

## [2026-06-11] base | 建牙周病動態資料表
- 新增 `Periodontal Disease.base`（Obsidian Bases）：filter `domain == periodontal-disease` 且 `type != moc`。
- 三檢視：全部研究頁（按 type 分組）、來源 Sources（作者/年份/可信度/連結）、卡片總覽。
- 可信度欄用 formula 轉 🟢/🟡/🔴。嵌入 [[Periodontal Disease]] hub 頁。
- 用 kepano `obsidian:obsidian-bases` skill 語法；YAML 已驗證。

---

## [2026-06-11] organize | 牙周病研究歸入 Health > Oral Health > Periodontal Disease
- 建三層 MOC hub 頁：[[Health]] → [[Oral Health]] → [[Periodontal Disease]]（扁平 hub，非資料夾）。
- [[Periodontal Disease]] 按主題（診斷/治療/再生/幹細胞長牙/缺牙重建/價格診所/綜述）連結全部 20 篇研究頁。
- 20 篇研究頁 frontmatter 加 `domain: periodontal-disease`（可供 Bases/Dataview 查詢）。
- 「Gum disease」採臨床標準名 **Periodontal Disease（牙周病）**。
- index.md 新增 Maps of Content 區。

---

## [2026-06-11] restructure | 攤平為扁平 Karpathy 結構
- 21 篇內容頁 `git mv` 從 comparisons/concepts/entities/questions/resources/sources 搬到 `wiki/` 根層。
- `git rm` 9 個空 `_index.md`；移除全部 13 個分類資料夾。
- 重寫 `index.md`（單一目錄、frontmatter `type` 分組）。
- 重寫 `CLAUDE.md`：LLM-as-compiler 模型、四階段迴圈、禁建分類資料夾、保留 git auto-commit 段。
- 新增 `OBSIDIAN-SETUP.md`（根層）：Karpathy + kepano/obsidian-skills 建置藍圖與三方關係。
- 更新 [[Karpathy LLM Wiki Pattern]]：補 DAIR.ai compiler 框架、no-vector-DB、四階段、合成訓練資料、kepano 連結。
- `WIKI.md` 加扁平結構覆蓋聲明。
- wikilink 不帶路徑 → 零連結損壞。

---

## [2026-06-08] save | Karpathy LLM Wiki 模式參考頁

- 研究 Karpathy 如何用 Obsidian（原始 gist ＋ claude-obsidian 外掛）
- Resources: [[Karpathy LLM Wiki Pattern]]（中文＋括號英文）
- 涵蓋：三層結構（raw/wiki/CLAUDE.md＋index/log/hot）、ingest/query/lint 操作、複利理念、Obsidian 搭配 tips（Web Clipper、圖片落地、graph view、git）
- Key insight: 維護的瓶頸是 bookkeeping；LLM 把維護成本壓到趨近零，解了 Memex 的「誰來維護」

---

## [2026-06-08] convert | 全部價格改為 HKD 為主＋（原幣）

- 換算所有價格為港幣（HKD）主顯示，括號保留原始貨幣
- 採用匯率（約2025）：US$1≈7.8｜£1≈9.9｜€1≈8.5｜NT$1≈0.25｜JPY¥1≈0.05｜S$1≈5.8｜₩1≈0.0057｜CNY¥1≈1.08（均加註於各頁）
- 更新頁面：Global Dental Implant Price Comparison、Global/Asia Cost Guide、Full-Arch Dental Implants、Periodontal Daily Products and Supplements、綜合頁亞洲價格表
- 註：各 source 頁 frontmatter 的 key_claims（英文原幣）保留為原始來源紀錄

---

## [2026-06-08] autoresearch | 牙周病日常產品、益生菌、補充品（證據＋價格）

- Rounds: 1 | Searches: 5
- Resources: [[Periodontal Daily Products and Supplements]]
- 涵蓋：牙間刷／沖牙機／電動牙刷、含氟錫牙膏、氯己定漱口水、L. reuteri 益生菌（BioGaia Prodentis）、Omega-3／CoQ10／維生素 D/C
- 依證據強度（高／中／低）分級，附 2025 約略零售價與 RCT／系統性回顧出處
- Key finding: 機械清潔（牙間刷＞牙線、沖牙機）證據最硬；益生菌 L. reuteri 與 Omega-3 為中度證據之輔助；CHX 僅短期；補充品（CoQ10/Vit D/C）證據較弱。全部皆為輔助，不能取代 SRP 與專科治療。

---

## [2026-06-08] enrich | 加入出處連結與影片

- 8 個 source 頁加上「出處連結（Sources）」可點 URL（皆為搜尋取得的真實連結）
- 影片（真實 YouTube／France24）加到：Full-Arch Dental Implants、Zygomatic Implants vs Bone Graft Implants、Tooth Regeneration Anti-USAG-1，以及兩個費用 source 頁
- 顴骨植牙手術：youtube QaPz0NWcSDM / QINVmvRR7PE；All-on-4：youtube IW4VFtb7OHU / ggDZY-mPwoA；長牙藥：France24 報導
- 綜合頁 Sources 區段加註指引

---

## [2026-06-08] translate | 牙周病研究叢集翻成繁體中文

- 將 18 頁內文翻成繁體中文，專有名詞／機構／人名／術語後加註（英文／當地用語）
- 翻譯範圍：8 sources、5 concepts、2 entities、1 resource、2 comparisons
- 未改動：檔名、frontmatter（YAML 中繼資料）、[[wikilinks]]、connections — 連結圖完整
- 綜合頁 [[Research - Severe Periodontitis and Tooth Loss]] 原已為中文，維持不動

---

## [2026-06-08] autoresearch | Italy prices & periodontal leaders (addendum)

- Rounds: 1 | Searches: 2
- Updated: [[Global Dental Implant Price Comparison]] (Italy rows), [[Global Dental Implant Cost Guide 2025-2026]] (Italy + leaders), [[Research - Severe Periodontitis and Tooth Loss]] (institutions)
- Pages created: 0 (updates only)
- Key finding: Italy mid-priced in Europe (All-on-4 avg ~€10,800; single €850-1,500) but a top global clinical leader in periodontal regeneration — Cortellini & Zucchelli; Univ. of Siena & Bologna.

---

## [2026-06-08] synthesis | Global price comparison table

- No new searches; consolidated existing price data into one master table
- Comparisons: [[Global Dental Implant Price Comparison]]
- Updated: index, [[Research - Severe Periodontitis and Tooth Loss]]
- Pages created: 1
- Key finding: Cheapest single implant = China public (集采 ~$640) & Turkey ($400-800); cheapest full-arch = Turkey ($3-5.5k); US most expensive overall; Singapore highest in Asia.

---

## [2026-06-08] autoresearch | Zygomatic vs grafted implant survival

- Rounds: 1 | Searches: 2
- Sources: [[Zygomatic vs Grafted Implant Survival Reviews]]
- Comparisons: [[Zygomatic Implants vs Bone Graft Implants]]
- Updated: [[Research - Severe Periodontitis and Tooth Loss]] (added finding; closed zygomatic-vs-graft open question)
- Pages created: 2
- Key finding: Both >90% long-term. Zygomatic ~96% @5yr / 95.21% @12yr, main risk sinusitis (9.53%→4.39% with anatomy-guided technique) + same-day fixed teeth; grafted-sinus 90-98% but adds months of healing and depends on graft success. Zygomatic pulls ahead as atrophy severity rises; few head-to-head RCTs.

---

## [2026-06-08] autoresearch | Mainland China prices & institutions (addendum)

- Rounds: 1 | Searches: 2
- Updated: [[Asia Dental Implant Cost Guide 2025-2026]] (China row + 集采 note), [[Top Asian Periodontal and Implant Centers]] (PKU/Shanghai 9th/West China), [[Research - Severe Periodontitis and Tooth Loss]] (table + institutions)
- Key finding: China's volume-based procurement (集采, 2023) cut implant prices ~55%; public-hospital single implant capped ~CNY 4,500 (~US$640), now cheapest single-implant market in Asia. Top centers: PKU School of Stomatology, Shanghai Ninth People's Hospital, Sichuan Univ West China.

---

## [2026-06-08] autoresearch | Asia local prices & top perio/implant specialists

- Rounds: 1 | Searches: 5
- Sources: [[Asia Dental Implant Cost Guide 2025-2026]]
- Resources: [[Top Asian Periodontal and Implant Centers]]
- Updated: [[Research - Severe Periodontitis and Tooth Loss]] (added Asia price table + institutions section; closed Asia open question)
- Pages created: 2
- Key finding: Korea is the regional value leader for full-arch implants (~30% of US price); Singapore the most expensive. TMDU renamed to Institute of Science Tokyo (Oct 2024 merger). For severe cases, seek board-certified periodontist, not general dentist.

---

## [2026-06-08] autoresearch | Severe periodontitis & tooth loss

- Rounds: 2 | Searches: 6 | WebFetch: 1
- Sources found: [[2018 Periodontitis Classification]], [[Regenerative Therapies in Periodontology 2025]], [[TRG-035 Anti-USAG-1 Antibody]], [[Allogeneic Dental Pulp Stem Cell RCT 2025]], [[Global Dental Implant Cost Guide 2025-2026]], [[EFP Adjunctive Therapy Stage III-IV Periodontitis]]
- Concepts: [[Stage IV Grade C Periodontitis]], [[Periodontal Regenerative Therapy]], [[Full-Arch Dental Implants]], [[Stem Cell Periodontal Therapy]], [[Tooth Regeneration Anti-USAG-1]]
- Entities: [[Toregem BioPharma]], [[Katsu Takahashi]]
- Synthesis: [[Research - Severe Periodontitis and Tooth Loss]]
- Pages created: 14
- Key finding: Lost teeth are still only replaceable by implants today (All-on-4 / zygomatic); "regrow a real tooth" drug TRG-035 is in Phase I but targets congenital tooth absence, not perio loss, ~2030.

---

## [2026-06-07] scaffold | Initial vault setup

- Mode: D+C+E (Personal + Projects + Research)
- Structure created: wiki/, .raw/, _templates/, _attachments/
- Pages created: overview, index, log, hot, all _index.md files
- Key folders: goals/, areas/, learning/, people/, resources/, projects/, concepts/, entities/, domains/, questions/, comparisons/, sources/, meta/
