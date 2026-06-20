---
type: resource
resource_type: reference
para: resource
title: "Karpathy's LLM Wiki Pattern"
status: developing
created: 2026-06-08
updated: 2026-06-21
tags:
  - resource
  - reference
  - pkm
  - llm-wiki
  - meta
related:
  - "[[Periodontal Daily Products and Supplements]]"
---

# Karpathy 的 LLM Wiki 模式（Karpathy's LLM Wiki Pattern）

由 Andrej Karpathy 發表的一份 GitHub 規格（[原始 gist](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)，2026-04-04），說明如何把個人知識庫（personal knowledge base）結構化，讓語言模型（LLM）能**使用它**、而不只是搜尋它。**本 vault 即是此模式的實作**——由 Claude Code 手動執行 ingest／compile／lint，配一個原生 PostToolUse auto-commit hook（不再依賴任何外掛）。

> [!warning] Attribution — 本頁 ≠ Karpathy 全部原話
> 本頁將 **Karpathy 一手** + **DAIR.ai 解說** + **本 vault 自加** 三層內容融合成一份實作指南。如果想分清邊樣係邊個出，留意以下標記：
>
> | 出處 | 例 |
> |---|---|
> | **K** = Karpathy 原 gist 一手 | 3 層架構、`index.md`/`log.md`、3 個操作（Ingest/Query/Lint）、`raw/assets/` 圖片下載、Obsidian-as-IDE 比喻 |
> | **D** = DAIR.ai 解說延伸 | 將 3 ops 拆成 **4 階段**（加入「Compile」），「LLM 當 compiler」標語式比喻嘅濃縮 |
> | **V** = 本 vault 自加（Karpathy 故意冇 prescribe） | `hot.md` 熱頁快取、HKT 時間戳、dual-log（CSV）、`Inbox/`／`Projects/`／`Bookmarks/`／`Meta/`、native auto-commit hook、`found-by-claude` provenance tag |
>
> Karpathy 喺 gist 結尾明確話：「This document is intentionally abstract … exact directory structure ... will depend on your domain」—— 即係 vault 嘅 folder tree 係 vault 自己嘅 instantiation choice，**唔屬於** Karpathy 一手規矩。

## 核心比喻：LLM 當 compiler，不是 retriever（**D**）
> 把 LLM 當**編譯器（compiler）**，不是**檢索器（retriever）**。

⚠️ 呢條「compiler vs retriever」嘅一句式 phrasing 出自 **DAIR.ai 解說**（[文章連結](https://academy.dair.ai/blog/llm-knowledge-bases-karpathy)），唔係 Karpathy 原話。Karpathy 原文用詞較 narrative：「the LLM **incrementally builds and maintains a persistent wiki** … knowledge is **compiled once and then kept current, not re-derived on every query**」（**K**）。意思一致，只係「compiler 比喻」係 DAIR.ai 嘅 distillation。

**K** 同 **D** 共識：**不靠 RAG pipeline、不靠向量資料庫**。在個人知識庫規模（Karpathy 講 ~100 sources / ~hundreds of pages）下，**`index.md` + LLM context window 就足以檢索**。LLM 增量讀 `raw/`、把它「編譯」成一層已綜合、互相連結的 wiki。

## 核心理念（Core philosophy）
> 「維護知識庫最累的不是閱讀或思考，而是雜務記帳（bookkeeping）。」

人會放棄維護 wiki，是因為維護成本長得比價值快。LLM 不會累、一次可改 10–15 個檔，把維護成本壓到趨近於零——這正是 1945 年 Vannevar Bush 的 Memex 概念當年解不了的「**誰來維護（who does the maintenance）**」問題。

- **人的角色（human role）**：挑選來源（curation）、提出好問題、給方向、綜合意義（synthesis of meaning）。
- **LLM 的角色（LLM role）**：其餘全部機械工作——摘要（summarization）、連結（linking）、一致性維護、更新傳播。

## 三層結構（Three-layer architecture，**K**）
1. **`raw/`（原始來源 raw sources）**：文章、論文、截圖、PDF。**不可變（immutable）**，LLM 只讀不改，是事實來源（source of truth）。
2. **`wiki/`（維基層）**：LLM 生成的 Markdown——實體頁（entity）、概念頁（concept）、摘要、總覽、交叉引用（cross-references）。LLM 完全擁有。
3. **`CLAUDE.md`（schema／行為契約 behavioral contract）**：定義 wiki 結構、慣例與工作流程（Karpathy 講 `CLAUDE.md` 或 `AGENTS.md`）。

Karpathy 明確嘅 2 個 support files（**K**）：
- **`index.md`**：content-oriented catalog，告訴模型有哪些頁、各是什麼。
- **`log.md`**：append-only 時序紀錄，前綴可 grep（Karpathy 建議 `## [YYYY-MM-DD] ingest | Title`，本 vault 升級成 `## [YYYY-MM-DD HH:MM HKT] action | description`）。

本 vault 自加（**V**）：
- **`hot.md`（熱頁快取）**：~500 字近期脈絡，**Karpathy 原 gist 冇提**。
- **`raw/assets/`**：Karpathy 有提（**K**，optional），用嚟 Web Clipper 自動下載圖片到本機；本 vault 已採用呢個 subfolder（已存在於 `raw/`）。

## 操作迴圈

### Karpathy 一手 —— 3 個操作（**K**）

`Ingest → Query → Lint`

- **Ingest**：drop 新 source、LLM 寫 summary、update index、touch 10–15 頁、append log。
- **Query**：對 wiki 提問；**好答案歸檔回 wiki**（compound）。
- **Lint**：健檢矛盾／孤兒／缺 cross-ref。

### DAIR.ai 解說 —— 4 階段（**D**，本 vault 採用）

`Ingest → Compile → Query&Enhance → Lint&Maintain →（回到 Compile）`

⚠️ DAIR.ai 將 Karpathy 嘅 "Ingest" 拆成「drop source」+「compile pages」兩步，明確凸顯「LLM 當 compiler」嘅 framing。本 vault 採用呢個 4 階段版本嚟描述 workflow，但要明白 Karpathy 原話只有 3 個。

1. **Ingest（攝入）**：來源（Web Clipper 文章、arXiv 論文、GitHub repo、資料集）落進 `raw/`。圖片下載到本機（`raw/assets/`），別只存 URL。
2. **Compile（編譯）**：LLM 增量讀 `raw/`，建出 index＋概念頁＋衍生產物（Marp 投影片、matplotlib 圖、已歸檔的查詢答案）＋自動維護的連結圖。「一個來源可能動到 10–15 頁。」
3. **Query & Enhance（查詢與增益）**：對 wiki 提問、帶引用作答；**查詢輸出再歸檔回 wiki 成新頁**——「每次探索都會累積。」
4. **Lint & Maintain（健檢與維護）**：掃矛盾、過時聲明、孤兒頁、缺交叉引用；用 web search 補洞、找跨概念連結成新頁、建議下一步研究，然後回到 Compile。

## 實操補充（cnyes 中譯＋實操註釋，2026-06-21 補入）

來源：鉅亨號轉載「Web3天空之城」嘅 Karpathy gist 中譯＋💡實操註釋版（bookmark：[[鉅亨網 - Karpathy LLM Wiki 建構指南（中譯＋手把手實操註釋）]]）。以下只摘錄現有 spec **未涵蓋、且有實操增值**嘅點（純新手建夾教學從略，因 vault 結構已遠超）：

- **上手 bootstrap**：唔使從零寫 code —— 直接把方法論文檔餵畀有「讀取本地檔案」能力嘅 AI agent，一句「閱讀呢篇、理解 LLM Wiki 理念，以後你就係我嘅 Wiki 維護員」即可起步。
- **具體 Ingest prompt 範例**（spec 原本只抽象描述 Ingest，呢個係 copy-paste 模板）：
  > 「請閱讀 `raw/` 中剛放入嘅《X.pdf》。讀完後：① 喺 wiki 建立該來源嘅摘要頁；② 若提到 Y 主題，去更新已有嘅 `Y.md`；③ 更新 `index.md`。」
- **點解 `index.md`／`log.md` 極重要**：因為 context window 有限，AI 無法一次睇清幾百個檔。`index.md` = 全域地圖，每次接到任務先睇地圖、再決定改邊個具體檔 —— 同本 vault `CLAUDE.md`「漸進式披露／兩層導航」係同一原理。

## 為何會複利（Why it compounds）
> 「The wiki is a persistent, compounding artifact.」（wiki 是一個持續、會複利的成品。）

不必每次查詢都重新檢索原始文件；LLM 維護一層**已綜合（synthesized）**的內容，隨每個來源與每次提問而更豐富——交叉引用已經在、矛盾已被標記、綜合已反映你讀過的一切。

## 搭 Obsidian 實際用法與 tips
- **Obsidian 當「視覺 IDE（visual IDE）」，LLM 當「程式設計師」**：一邊開 LLM、一邊開 Obsidian；agent 改檔，人即時跟 wikilink、看 graph view、審頁。
- 用 **Obsidian Web Clipper** 瀏覽器外掛快速把文章轉 Markdown 進 `raw/`。
- **圖片下載到本機（download images to disk）**，別只存 URL（會失連），讓 LLM 能直接看圖。
- **Graph view 是看清 wiki 形狀（shape）最好的方式**。
- 把 wiki 當 **git repo** 管版本與協作。
- 進階整合：**Marp**（Markdown 投影片）、**Dataview**（查詢外掛 query plugin）。

## 規模參考（Scale）
Karpathy 原 gist 講「moderate scale（~100 sources、~hundreds of pages）」（**K**）。坊間經常引用嘅「100 篇文章、40 萬字」屬於 **DAIR.ai 解說**嘅 paraphrase（**D**），並非 Karpathy gist 直述。本 vault 操作目標跟 Karpathy 講嘅 ~100 sources 量級。

## 未來方向（Future）
用 wiki 生**合成訓練資料（synthetic training data）**去 fine-tune 一個 LLM，讓它把知識記進**權重（weights）**，而不只是靠 context window。

## 工具分工（本 vault）
- **Karpathy** = 方法論（設計圖）；**Claude Code** = 執行此模式的 agent（手動跑 ingest／compile／lint，配原生 auto-commit hook 自動 commit `wiki/`）；**kepano/obsidian-skills** = 底層格式工具（defuddle / obsidian-cli / bases / markdown / json-canvas）。詳見 [[OBSIDIAN-SETUP]]。
- 註：曾試用 **claude-obsidian (AgriciDaniel)** 外掛自動化此模式，已於 2026-06-16 移除；其 auto-commit 功能改由 vault 原生 hook 取代。

## 出處連結（Sources）
- Karpathy 原始 gist（llm-wiki）：https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
- DAIR.ai 解說（compiler 框架、四階段、no vector DB）：https://academy.dair.ai/blog/llm-knowledge-bases-karpathy
- claude-obsidian（曾試用以自動化此模式，2026-06-16 已移除；automation 改用原生 hook）：https://github.com/AgriciDaniel/claude-obsidian
- kepano/obsidian-skills（建議搭檔，底層格式 substrate）：https://github.com/kepano/obsidian-skills
- 報導整理（Techstrong.ai）：https://techstrong.ai/features/karpathys-instructions-for-building-an-ai-driven-second-brain/
- cnyes 中譯＋💡實操註釋（鉅亨號 Anue，轉自 Web3天空之城；2026-06-21 補入實操點）：https://hao.cnyes.com/post/240756

相關：本 vault 的 [[Research - Severe Periodontitis and Tooth Loss]] 即依此模式建立。
