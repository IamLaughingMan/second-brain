---
type: meta
title: "Wiki Log"
updated: 2026-06-07
---

# Wiki Log

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
