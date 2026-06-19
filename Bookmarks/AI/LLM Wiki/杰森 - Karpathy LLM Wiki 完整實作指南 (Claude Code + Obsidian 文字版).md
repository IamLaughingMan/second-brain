---
type: bookmark
para: resource
domain: ai-tools
title: "Claude Code + Obsidian 打造 Karpathy LLM Wiki 知識庫（完整實作指南）"
url: "https://jasonai.me/blog/claude-code-obsidian--karpathyllm-wiki/"
author: "Jason（杰森的效率工坊）"
status: active
created: 2026-06-19
updated: 2026-06-19
related:
  - "[[杰森的效率工坊 - Karpathy LLM Wiki (Claude Code + Obsidian 進階)]]"
  - "[[jason-effi-lab - karpathy-llm-wiki-vault (repo)]]"
  - "[[karpathy - LLM Wiki gist]]"
tags:
  - bookmark
  - ai-tools
  - claude-code
  - obsidian
  - karpathy
  - llm-wiki
  - agent-skill
  - tutorial
---

# Claude Code + Obsidian 打造 Karpathy LLM Wiki 知識庫（完整實作指南）

- URL: https://jasonai.me/blog/claude-code-obsidian--karpathyllm-wiki/
- Author: Jason（杰森的效率工坊）
- Saved date: 2026-06-19
- Topic: Karpathy LLM Wiki **完整文字實作**（核心理念 + 三層架構 + ingest/query/lint skill 全文 + 注意事項）
- Status: active

## Why I saved this

Jason 條 LLM Wiki **影片嘅完整文字版**，亦係 [[jason-effi-lab - karpathy-llm-wiki-vault (repo)|配套 repo]] 嘅**散文來源**：把 Karpathy「知識管理視為軟件工程」嘅理念逐步落地，內含佢親寫嘅 ingest/query/lint skill 全文 + 約束 + 避坑。三件一套（影片＋repo＋本文）。

## Summary

- **核心轉換**：RAG「即時檢索」（無狀態、失憶、每次大海撈針）→ LLM Wiki「**持續編譯**」（攝入時就 LLM 深度合成＋連結，成持久制品）。**知識管理 = 軟件工程**。
- **三層架構**：原始資料層（raw）→ Wiki 層（concepts/entities/sources/syntheses + index/log）→ schema 規範層（CLAUDE.md / OpenCode 用 AGENTS.md）。
- **三大操作（The Loop）**：`ingest`（編譯 raw→wiki、歸檔源檔）、`query`（先讀 index→深讀→雙鏈答→好答案固化成 synthesis，知識複利）、`lint`（索引一致性/死鏈/孤島/認知衝突 → 🩺 體檢報告）。
- **重點**：Karpathy 只畀「idea file」（模式說明），冇 prompt/skill/固定工具鏈；具體實現係**社區補全**。本文 = Jason 嘅一套實現。樣例 repo `jason-effi-lab/karpathy-llm-wiki-vault`。

## My Notes

- **同已存兩條高度重疊**：ingest/query/lint skill 全文 = [[jason-effi-lab - karpathy-llm-wiki-vault (repo)]] 嗰三個 SKILL.md 嘅散文版；流程 = [[杰森的效率工坊 - Karpathy LLM Wiki (Claude Code + Obsidian 進階)]] 影片。⇒ 本文係**最完整文字參考**，repo 係可下載碼，影片係 demo。
- **對本 vault 借鏡（同 repo 結論一致）**：skill 化 ingest/query/lint 嘅藍本，但要適配本 vault convention（`raw/09-archive` 搬檔 → 改 status-over-folder；加 HKT + dual-log CSV；繁體；type 詞彙）。本 vault project skill 現為 0。
- **理念佐證**：「Karpathy 只畀 idea file、社區補全」呼應本 vault 自己都係 Karpathy 模式嘅一種 mixed-mode 演化。

## Related
- [[杰森的效率工坊 - Karpathy LLM Wiki (Claude Code + Obsidian 進階)]] —— 同內容影片版
- [[jason-effi-lab - karpathy-llm-wiki-vault (repo)]] —— 配套可下載 repo（3 SKILL.md）
- [[karpathy - LLM Wiki gist]] —— 原始 idea file
- [[Bookmarks]]

<!-- ===== ARCHIVE BELOW — 全文 snapshot（defuddle 2026-06-19，已 opencc s2hk 轉正體），掃描/triage 時可跳過 ===== -->

## Full Content (archived)
> 來源：https://jasonai.me/blog/claude-code-obsidian--karpathyllm-wiki/　・　defuddle 抽取 2026-06-19 HKT，已 opencc `s2hk` 簡→繁香港。原文簡體。

Andrej Karpathy大神（OpenAI早期核心成員，前特斯拉AI Director）分享了自己如何使用LLM搭建知識庫的方法。

傳統 RAG的致命缺點是“無狀態”和“失憶”：每次你問問題，LLM 都要重新在文檔裏大海撈針，且不能累積知識。Karpathy 的方案拋棄了RAG這一套，讓 LLM 把原始資料“編譯（Compile）”成一個結構化的 Wiki。

**因為Karpathy並沒有給出具體的prompt或者skill，也沒有標準實現或固定工具鏈，而是隻提供了一個“idea file”（模式説明）** ，目前具體的實現方法大多都是社區中補全出來的。我來為大家講解具體的實現步驟，所用到的工具， **以及我根據Karpathy的理念編寫的skills和約束** ，以及注意事項。

樣例GitHub倉庫： `jason-effi-lab/karpathy-llm-wiki-vault` 。

### 核心理念

Andrej Karpathy 的 LLM Wiki 理念可以精簡為\*\*“將知識管理視為軟件工程”，其核心邏輯是從“即時檢索” (RAG) 轉向“持續編譯” (Compilation)。

以下是該理念的高效準確描述：

#### 1\. 核心轉換：從檢索到編譯

- **傳統 RAG：** 像臨時翻書。每次提問都從原始文檔中重新搜尋碎片，知識不積累，無狀態。
- **LLM Wiki：** 像編譯代碼。在數據 **攝入時** 就通過 LLM 進行深度合成與鏈接，將零散資料轉化成結構化的、有狀態的 **持久製品** 。

#### 2\. 三層架構 (The 3-Layer Architecture)

這一模式通過嚴格的目錄結構確保知識的準確性與可維護性：

- **`raw/` (不可變源層)：** 存放原始論文、筆記、網頁剪藏。它是 **事實之源** ，LLM 只讀不寫，確保可追溯性。
- **`wiki/` (已編譯製品層)：** 由 LLM 全權維護的 Markdown 頁面。包含概念、實體摘要及其間的 **雙向鏈接** 。這是知識庫的“執行文件”。
- **`Schema` (治理層)：** 即 `CLAUDE.md` 或 `AGENTS.md` 。它是 LLM 的 **作業規範** ，定義了文件命名、元數據格式及更新工作流，使 AI 成為紀律嚴明的圖書管理員。

#### 3\. 三大核心操作 (The Loop)

- **攝入 (Ingest)：** 新資料進入時，LLM 會更新 10-15 個相關 Wiki 頁面，修正舊觀點，標記新矛盾。
- **查詢 (Query)：** 優先通過 `index.md` 索引導航，實現精準查詢。高質量的回答會 **回填** （File back）到 Wiki 中，實現知識複利。
- **審計 (Lint)：** AI 定期執行“體檢”，尋找邏輯衝突、孤兒頁面或知識缺口，保持系統健康。

### 4\. 終極比喻

**“Obsidian 是 IDE，LLM 是程序員，Wiki 是代碼庫”** 。 人類負責 **決策與提供素材** ，LLM 負責枯燥的 **簿記與維護工作** （Bookkeeping）。最終形成一個 **隨着閲讀量增加而自動進化的私有化 Wikipedia** 。

| 維度 | 傳統 RAG | Karpathy LLM Wiki |
| --- | --- | --- |
| **核心理念** | **即時檢索** ：提問時才去海量碎片中打撈 | **知識編譯** ：攝入時即通過 LLM 轉化為結構化知識庫 |
| **處理時機** | **查詢時** ：每次提問都從零開始搜索塊 | **攝入時** ：提前處理併合成知識 |
| **知識狀態** | **無狀態** ：像臨時翻書，回答完知識即消散 | **有狀態** ：知識被“編譯”為持久的製品 |
| **知識複利** | **無累積** ：每次查詢成本和認知負擔相同 | **持續增長** ：新知識會更新舊頁面，探索結果也可存回 |
| **結構化程度** | **扁平碎片** ：數據以孤立的文本塊形式存儲 | **關聯圖譜** ：以實體/概念為中心，建立雙向鏈接 |
| **矛盾處理** | **被動/忽略** ：RAG 可能同時輸出多個來源的矛盾信息 | **主動發現** ：攝入時 LLM 會對比舊知識並標記矛盾 |
| **適用規模** | **海量數據** ：支持數百萬文檔，無上下文上限 | **中小規模** ：目前最適合 ~100-200 篇高質量文章 |
| **基礎設施** | **複雜** ：需向量數據庫、Embedding 模型及 pipeline | **極簡** ：只需本地 Markdown 文件，無數據庫依賴 |
| **用户界面** | **聊天流** ：瞬時性的對話記錄 | **IDE/Markdown** ：持久化的知識工作空間 |

#### 知識庫架構

最終生成的知識庫架構如下，這裏以Claude Code + claudian插件為例，你也可以使用OpenCode, Gemini CLI等智能體。

```markdown
基於 Karpathy 的 LLM Wiki 理念構建，結合 Claude Code 體系。

🏛️ 你的知識庫文件夾 (LLM-Wiki-Vault)
├── 🖼️ assets/                   ← 統一媒體資源層：存放圖片、PDF、附件（Obsidian設置附件路徑至此）
│
├── 📥 raw/                      ← 原始資料收件箱（只讀事實層，文件處理後移動至 archive）
│   ├── 📄 01-articles/          ← 網頁剪藏、技術文章 (.md)
│   ├── 🎓 02-papers/            ← 論文、深度研報、PDF文檔
│   ├── 🎙️ 03-transcripts/       ← 視頻/播客轉錄文本、會議記錄
│   ├── 💡 04-meeting_notes/     ← 頭腦風暴或會議紀要等
│   └── 🗃️ 09-archive/           ← 已歸檔區：\`/ingest\` 執行成功後，源文件自動移動至此
│
├── 🧠 wiki/                     ← 知識編譯輸出層（LLM 擁有完全寫權限，人類閲讀層）
│   ├── 📑 index.md              ← 全局內容字典：記錄所有 wiki 頁面及其一句話索引
│   ├── 📜 log.md                ← 行為流水線：以 Grep-friendly 格式記錄 ingest/query 歷史
│   ├── 🏗️ concepts/             ← 抽象層：方法論、架構模式、第一性原理 
│   ├── 👥 entities/             ← 實體層：人名、公司、工具軟件、項目 
│   ├── 🔍 sources/              ← 摘要層：針對 raw 文件的一對一核心觀點提煉 
│   └── 💎 syntheses/            ← 綜合層：針對複雜提問生成的深度研究報告 
│
├── 🤖 CLAUDE.md                 ← 全局心智規範：定義語言協議、讀寫權限與 Wiki Schema
│
└── ⚙️ .claude/                  ← Claude Code 官方配置目錄
    └── 🛠️ skills/               ← Agent Skill中心
        ├── ⚙️ ingest/           ← 自定義：編譯收件箱 raw 文件到 wiki，並執行 09-archive 歸檔
        ├── 🔎 query/            ← 自定義：檢索 wiki/index 並讀取相關頁面，生成帶雙鏈引用的回答
        ├── 🩺 lint/             ← 自定義：知識體檢，修復死鏈、補充 index、發現認知衝突
        ├── 🔌 obsidian-cli/     ← Obsidian官方：調用 Obsidian 原生 API 進行檢索、打開頁面
        └── 🪄 defuddle/         ← Obsidian官方：將網頁 URL 自動清理並轉化為 Markdown 存入 raw/
```

CLAUDE.md內容如下：

```markdown
# 語言設定與核心角色 (Global Rules)
- **語言指令**：無論輸入何種語言，你必須始終使用**簡體中文**進行思考、回覆和知識庫的編寫。
- **角色定義**：你正在維護一個 **LLM Wiki**（根據 [Karpathy 的規範](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f))，你的任務是將碎片化的信息編譯成結構化、高度相互鏈接的 Obsidian 知識庫。

# 核心目錄與權限邊界 (Immutability & Architecture)
你必須嚴格遵守以下文件操作權限，這是不可逾越的底線：

- \`/raw/\` (不可變層 - Immutable)：
  - **絕對只讀**。這裏存放我的原始素材、網頁剪藏和自媒體文案。
  - **禁止修改或刪除此目錄下的任何文件**。它是事實的唯一真相來源。
- \`/assets/\` (媒體資產層)：
  - 存放圖片、PDF和媒體。引用時使用 Obsidian 標準語法 \`![[文件名稱.png]]\`。
- \`/wiki/\` (編譯輸出層 - You Own This)：
  - 這是你的專屬工作區。你需要在此處創建、更新、提煉知識並解決矛盾。

# Wiki 核心文件契約 (The Wiki Schema)
當你在 \`/wiki/\` 中工作時（尤其是執行寫入操作後），必須維護以下基石：

1. **\`wiki/index.md\` (總目錄)**：
   每次向 wiki 新增知識頁後，必須同步更新此文件，將其按分類加入目錄中。
   格式要求： [[頁面名稱]] — 一句話描述。
    - Entities/Concepts: 使用 TitleCase 命名。
    - Sources/Syntheses: 使用 kebab-case 命名。
    範例：
    \`\`\`markdown
    # Wiki Index

    ## Sources
    - [[摘要-source-slug]] — 該資料的核心主旨摘要。

    ## Entities
    - [[EntityName]] — 該實體的身份定義或核心功能。

    ## Concepts
    - [[ConceptName]] — 該概念或框架的核心定義。

    ## Syntheses
    - [[synthesis-slug]] — 該頁面回答的複雜問題。
    \`\`\`
2. **\`wiki/log.md\` (操作日誌)**：
    只能追加寫入（Append-only）。每次操作後記錄：\`## [YYYY-MM-DD] <動作> | <操作簡述>\`。
    操作類型： ingest, query, lint, sync
    範例：
    \`\`\`markdown
    ## [2026-04-11] ingest | 引入項目 Claude Code 核心概念
    - **變更**: 新增 [[ClaudeCode]], [[摘要-claude-code-docs]]; 更新 [[index.md]]
    - **衝突**: 無 (或: 衝突 [[RAG架構]], 已標註)

    ## [2026-04-11] query | 解析 Karpathy LLM-Wiki 理念
    - **輸出**: 已保存至 [[分析-karpathy-wiki-philosophy]]

    ## [2026-04-11] lint | 周度健康檢查
    - **結果**: 修復 2 處死鏈，發現 1 個孤兒頁面 [[UnlinkedPage]]
    \`\`\`
3. **內容分類**：
   - \`/wiki/concepts/\`：存放概念、框架、方法論（如 \`Agent_Skill.md\`）。
   - \`/wiki/entities/\`：存放人物、公司、工具、產品（如 \`Claude_Code.md\`）。
   - \`/wiki/sources/\`：存放從 \`raw/\` 提煉出的原始素材摘要。
4. **強制雙向鏈接**：
   每一個 wiki 頁面必須包含 \`## 關聯連接\` 區域，使用 Obsidian 雙鏈 \`[[頁面名稱]]\` 鏈接到其他相關概念。絕不能產生孤島頁面。
5. **矛盾處理原則**：
   如果新攝入的知識與舊知識衝突，不要靜默覆蓋。在頁面中新建 \`## 知識衝突\` 區塊，將兩種説法都保留並做對比。

# 工作流指令説明 (Workflows / Skills)
當被要求執行以下操作時，請遵循核心邏輯（未來可能由專用 Agent Skills 接管）：

- \`/ingest <路徑>\`：讀取指定的 \`raw/\` 文件，將其核心價值提煉並整合到 \`wiki/\` 目錄的相關概念/實體中。必須更新 index 和 log。
- \`/query <問題>\`：通過讀取 \`wiki/index.md\` 尋找相關文件，進行深度閲讀後綜合回答，並在回答中必須使用 \`[[wikilink]]\` 標註引用來源。
- \`/lint\`：全局掃描 \`wiki/\` 目錄，找出孤島頁面（沒有雙鏈）、死鏈（鏈接不存在的頁面）以及存在邏輯衝突的地方，並向我報告。

# 頁面 Frontmatter (YAML) 規範
所有生成的 wiki 頁面必須包含以下 YAML 頭部：
---
title: "頁面標題"
type: concept | entity | source | synthesis
tags: [知識標籤]
sources:[關聯的raw文件相對路徑]
last_updated: YYYY-MM-DD
---
```

### 第一步：數據攝入 - 原始資料收集

這一步是唯一需要人類手動進行的步驟。Karpathy重度依賴 **Obsidian Web Clipper** 官方剪藏插件，一鍵將網頁提取為乾淨的 Markdown 格式。 **涉及工具** ： Obsidian, Obsidian Web Clipper，Defuddle/Defuddle skill。

- 安裝Obsidian並創建知識庫，在知識庫中創建 `/raw` 文件夾，作為數據攝入的入口。（我一般都起名叫 `/inbox` ，一個意思）
- 在瀏覽器中安裝Obsidian Web Clipper官方剪藏插件，在插件設置中，指定剪藏筆記保存的路徑為 `你的OB倉庫/raw` 。
- 你也可以使用 `defuddle` 工具和 `defuddle skill` 來進行知識的攝入，具體我之前的視頻中有講。他們都是Obsidian CEO @kepano寫的。官方Web Clipper插件底層也是Defuddle。
- **必須是.md 文件嗎？不能是 PDF 或電子書嗎？** ：可以，但 Karpathy 強烈推薦將網頁剪藏為.md 格式，因為 Markdown 是LLM的“母語”，解析效率最高，Token 消耗最少，且格式非常乾淨。

### 第二步：LLM 自動化編譯與構建（Ingest）

LLM 讀取原始數據，自動提取概念、生成總結，並在 wiki/ 文件夾下生成帶有 YAML frontmatter（元數據）和雙向鏈接的新 Markdown 文件。 **涉及工具** ：Claude Code（或其他智能體工具，比如OpenCode），obsidian-cli skill。

- 你可以直接發送提示詞給Claude Code， **但是，這樣的步驟顯然更應該使用skill** 。
- 以下是我編寫的 `ingest-skill` ，核心功能就是把 `/raw` 裏的資料整理成wiki。在智能體中直接執行 `/ingest` 即可觸發。

`ingest-skill` 內容如下：

```markdown
---
name: ingest
description: 將 raw/ 目錄下的原始資料編譯到 wiki/ 中。處理完成後，將源文件自動移動到 raw/09-archive/ 歸檔。支持 \`/ingest\` (掃描 raw/ 下所有未歸檔文件) 或 \`/ingest <path>\` (處理指定文件)。當用户提到"攝取"、"導入"、"收入"資料，或要求將文件加入知識庫時，也應該觸發此技能。絕對忽略 raw/09-archive/ 目錄。
user-invocable: true
---

# ingest 技能

## 核心工作流：Inbox & Archive

你正在維護一個 **LLM Wiki**（Obsidian 知識庫）。\`raw/\` 目錄是"待處理收件箱"，\`wiki/\` 是"編譯輸出層"。

**目錄結構約定：**
- \`raw/01-articles/\` — 網頁剪藏的 Markdown 文章
- \`raw/02-papers/\` — 論文和 PDF 文獻
- \`raw/03-transcripts/\` — 視頻轉錄文案
- \`raw/09-archive/\` — **已處理文件的歸檔目錄，禁止讀取**
- \`wiki/sources/\` — 資料摘要
- \`wiki/entities/\` — 實體（人物、公司、工具、產品）
- \`wiki/concepts/\` — 概念（框架、方法論、理論）

## 觸發邏輯

1. **用户執行 \`/ingest\`**：掃描 \`raw/\` 所有子目錄（排除 \`09-archive/\`），找出待處理文件。
2. **用户執行 \`/ingest <path>\`**：僅處理指定文件。
3. **隱式觸發**：用户説"把這個資料攝入知識庫"、"導入這篇文章"時，自動執行 ingest。

## 編譯流水線

對每個待處理源文件，嚴格按以下步驟執行：

### 步驟 1：讀取源文件

- **如果是 \`.md\` 文件**：使用讀取工具完整讀取內容。
- **如果是 \`.pdf\` 文件**：使用讀取工具嘗試提取文本。如果無法提取或內容為空，改為記錄文件元信息（文件名、頁數）在 sources 頁面中。

### 步驟 2：提煉核心並翻譯

從源文件中提取：
- **核心主旨**：這段資料講什麼（1-2句話）
- **實體**：人物、公司、工具、產品等具體名詞
- **概念**：框架、方法論、理論等抽象名詞

如果是非中文內容，則翻譯成中文。

### 步驟 3：創建來源摘要

在 \`wiki/sources/\` 創建 Markdown 文件：

\`\`\`markdown
---
title: "摘要-文件slug"
type: source
tags: [來源, 原始文件]
sources: [raw/01-articles/xxx.md]
last_updated: YYYY-MM-DD
---

## 核心摘要
[3-5句話的核心總結]

## 關聯連接
- [[EntityName]] — 關聯實體
- [[ConceptName]] — 關聯概念
\`\`\`

文件名使用 kebab-case：\`摘要-{文件slug}.md\`

### 步驟 4：知識網絡化（實體/概念頁面）

對於步驟 2 提取的每個實體和概念：

**目標目錄：**
- 實體 → \`wiki/entities/\`
- 概念 → \`wiki/concepts/\`

**處理邏輯：**
1. 頁面不存在 → 按照 CLAUDE.md 的 Frontmatter 規範創建新頁面
2. 頁面已存在 → 讀取現有內容，**增量合併**新信息
3. **發現衝突** → **立即暫停**，向用户報告衝突內容，詢問處理方式後再繼續

**頁面模板：**

\`\`\`markdown
---
title: "頁面名稱"
type: entity | concept
tags: [標籤]
sources: [關聯的源文件]
last_updated: YYYY-MM-DD
---

## 定義
[對該實體/概念的定義]

## 關鍵信息
[從源文件中提取的詳細信息]

## 關聯連接
- [[摘要-source-slug]] — 來源
- [[RelatedEntity]] — 相關實體
\`\`\`

### 步驟 5：更新全局註冊表

**更新 \`wiki/index.md\`：**
按照 CLAUDE.md 規定的格式，將新增頁面添加到對應分類下：
- Sources: \`[[摘要-source-slug]] — 該資料的核心主旨\`
- Entities: \`[[EntityName]] — 該實體的身份定義\`
- Concepts: \`[[ConceptName]] — 該概念的核心定義\`

**更新 \`wiki/log.md\`：**
追加操作日誌（Append-only）：
\`\`\`markdown
## [YYYY-MM-DD] ingest | 操作簡述
- **變更**: 新增 [[PageName]]; 更新 [[index.md]]
- **衝突**: 無 (或: 衝突 [[ConflictingPage]], 已暫停等待決策)
\`\`\`

### 步驟 6：歸檔源文件

在確認以下全部完成後，將源文件移動到 \`raw/09-archive/\`目錄：
- sources 頁面已創建
- 實體/概念頁面已創建或更新
- index.md 已更新
- log.md 已更新

**絕對禁止修改源文件內部的文字。**

## 衝突處理流程

當發現新舊知識衝突時：

1. **暫停**：停止當前 ingest 流程
2. **報告**：向用户説明衝突內容（哪個頁面、衝突點是什麼）
3. **詢問**：請用户選擇處理方式：
   - A) 保留新舊兩者，標註為"知識衝突"
   - B) 用新知識覆蓋舊知識
   - C) 放棄本次 ingest
4. **繼續**：根據用户選擇繼續或終止

## 注意事項

- 絕對不讀取 \`raw/09-archive/\` 下的任何文件
- 所有 wiki 頁面必須包含 \`## 關聯連接\` 區域，不能產生孤島頁面
- 使用簡體中文編寫所有內容
- 實體命名使用 TitleCase，概念和來源使用 kebab-case
```

### 第三步：深度查詢與知識複利

面對特定課題，讓 LLM 進行跨文檔的綜合研究，並將高質量的分析結果 **存回** 知識庫，實現知識的增量與結網。 **涉及工具** ： Claude Code（或其他智能體工具，比如OpenCode），marp（obsidian插件，或skill），json-canvas（也有skill，我之前講過）等等。

**這一步是RAG嗎？可以用NotebookLM嗎？** 絕對不能，恰恰相反， **Karpathy的理念恰恰是為了對抗RAG 和 NotebookLM** 。 **核心思想：Wiki > RAG** RAG（包括 NotebookLM）是“無狀態”的： **系統本身沒有記憶，知識沒有積累。** 你今天問，它搜一遍；明天問，它還要再搜一遍。它是一個“只讀（Read-only）”的閲覽室。 Karpathy 的 Agentic Wiki 是“有狀態”和“編譯”的：構建一個持續進化的知識庫（LLM Wiki），知識是“被編譯”的，而不是“臨時檢索”的。當你提問時，Agent 是在閲讀 **已經被提煉過的網絡結構** ，並將高質量的問答結果 **存回** 知識庫中。

案例一：矛盾點挖掘

```markdown
對比我知識庫裏 OpenClaw 和 Claude Code 這兩個工具的所有測試筆記。
列出它們在處理長文本項目時的底層機制差異。
如果發現這兩者的能力有重疊或互斥，請明確指出。將分析結果生成對比表格，存入 wiki/comparisons/。
```

案例二：盲區發現

```markdown
審視我過去三個月關於‘Agent開發’的所有知識節點。
作為一名 15 年經驗的全棧開發者，幫我指出我在架構選型、優化或部署思路上，還有哪些信息的嚴重缺失？
列出我下一步應該去攝入的 3 個方向。
```

提問後，你可以命令 Agent：“把剛才的對比分析轉化為 Marp 格式的幻燈片，並存入 wiki/comparisons/ ”。下次打開 Obsidian，你就能直接看到排版好的 PPT。同樣你也可以生成canvas, excalidraw等。

`query-skill` 內容如下：

```markdown
---
name: query
description: 在本地 Wiki 知識庫中回答用户提問。當用户使用 /query 命令、或用自然語言詢問關於"我的筆記/歷史決定/過往筆記/知識庫"中的內容時調用。必須先讀取 wiki/index.md 定位相關頁面，再深度閲讀，最後以雙鏈引用格式回答。禁止憑模型記憶回答。如果知識庫中沒有相關內容，必須聲明"本地知識庫中未找到，以下為通用知識回答"。
user-invocable: true
---

# query 技能

## 核心目標
將用户的提問轉化為對本地 Wiki 的深度檢索。提取相關頁面信息，綜合出帶有明確引用來源的雙鏈回答。當回答具有高價值時，主動將其固化為知識庫的一部分。

## 觸發場景
- 用户輸入 \`/query <問題>\`
- 用户用自然語言詢問：\`"我的筆記裏關於 X 是怎麼説的"\`、\`"過去我對 Y 的決策是什麼"\`、\`"查詢 Z 相關的知識"\`
- 用户提及 wiki、知識庫、筆記、記錄等關鍵詞

## 降級策略
如果問題屬於純通用知識（如"太陽系有幾顆行星"），且 wiki/index.md 中無相關內容：
>本地知識庫中未找到相關內容，以下為通用知識回答：[直接回答]

---

## 檢索與綜合流水線

### 步驟 1：查閲全局索引
**永遠的第一步**：讀取 \`wiki/index.md\`

在 index.md 中定位與問題相關的：
- Entities（實體）
- Concepts（概念）
- Sources（摘要）
- Syntheses（綜合）

### 步驟 2：深度閲讀目標文件
選取步驟 1 中找到的最相關頁面，使用讀取工具獲取完整內容。

### 步驟 3：綜合與回答
綜合信息，回答用户問題。

**雙鏈引用規範**：
- 每當引用某個 Wiki 頁面的信息，在文本中使用 \`[[頁面名稱]]\` 標註
- 整段引用同一頁面：段落首尾各引用一次
- 引用特定原文：使用 Markdown 塊引用 \`> 引用內容\`

### 步驟 4：高價值內容固化
如果滿足以下條件，主動詢問用户是否保存為 synthesis：
- 回答超過 2 個段落
- 內容具有分析對比性或總結性

詢問話術：
>這是一個有價值的總結，是否需要我將其保存到 wiki/syntheses/ 目錄？

用户同意後，按照 CLAUDE.md 規範創建文件：
\`\`\`markdown
---
title: "頁面標題"
type: synthesis
tags: []
sources: []
last_updated: YYYY-MM-DD
---

# 總結內容
\`\`\`

並在 \`wiki/index.md\` 的 Syntheses 分類下注冊。

### 步驟 5：記錄操作日誌
無論是否生成 synthesis 頁面，查詢結束後必須在 \`wiki/log.md\` 末尾追加：

\`\`\`markdown
## [YYYY-MM-DD] query | <操作簡述>
- **輸出**: <引用頁面列表或"即時回答未保存">
\`\`\`

格式必須完全遵循 CLAUDE.md 中的示例。

---

## 強制約束
- **禁止憑記憶回答**：必須先檢索知識庫
- **禁止過度引用**：同一頁面的信息在段落首尾引用一次即可
- **禁止靜默回答**：知識庫無相關內容時必須聲明

---

## 關聯連接
- [[wiki/index.md]] — 全局索引入口
- [[wiki/log.md]] — 操作日誌
- [[CLAUDE.md]] — Wiki 架構總規範
```

### 第四步：知識庫維護（Lint）

定期對知識庫進行體檢，排查知識庫中的邏輯斷層、自相矛盾或死鏈接。這也是為什麼我用了 `lint` 這個程序員專屬詞彙。 **涉及工具** ： Claude Code（或其他智能體工具，比如OpenCode），lint-skill（自己編寫）。

以下是我編寫的 `lint-skill` 。

```markdown
---
name: lint
description: 知識庫全局健康度檢查。掃描 wiki/ 目錄，檢測死鏈（頁面引用不存在的雙鏈）、孤兒頁面（無任何頁面引用它）、未同步索引（文件存在但未在 index.md 註冊）和知識衝突。當用户輸入 /lint、/scan、/health 或要求“檢查知識庫狀態”、“檢查健康”時調用。
user-invocable: true
---

# lint 技能：知識圖譜健康巡檢

## 核心目標
將軟件工程中的“靜態代碼分析”引入知識管理。定期運行此 skill，找出知識庫長期演進中產生的：死鏈、孤島、未同步索引、認知衝突。

## 觸發條件
- 用户輸入 \`/lint\`
- 用户詢問“我的知識庫健康狀況如何”
- 用户要求“檢查知識庫狀態”或“檢查健康”

## 知識庫路徑
- 使用 Glob 工具動態定位當前工作區下的 wiki/ 目錄

## 巡檢流水線

### 第 1 步：索引一致性檢查
1. 讀取 \`wiki/index.md\` 全部內容
2. 掃描 \`wiki/\` 下所有 \`.md\` 文件（排除 index.md 和 log.md）
3. 提取 index.md 中註冊的所有雙鏈鏈接 \`[[頁面名稱]]\`
4. 比對：找出已註冊但文件不存在的條目 OR 文件存在但未註冊的頁面

### 第 2 步：雙向鏈接健康檢查
1. 掃描所有 \`.md\` 文件，提取所有 \`[[雙鏈]]\` 格式的鏈接
2. 如果鏈接指向的頁面不存在 → 標記為**死鏈**
3. 統計被引用的頁面（排除 self-reference）
4. 找出從未被任何其他頁面引用的頁面 → **孤兒頁面**

### 第 3 步：認知衝突審查
1. 全局搜索所有 \`.md\` 文件中包含 \`## 知識衝突\` 的頁面
2. 提取每個衝突的簡要描述（衝突雙方是什麼）
3. 統計帶未解決衝突的頁面（認知技術債）

### 第 4 步：收件箱積壓檢查（可選跳過）
- 本 skill 僅掃描 wiki/，跳過 raw/ 收件箱檢查

## 報告輸出規範

掃描完成後，輸出結構化報告，嚴格遵循以下格式：

\`\`\`markdown
## 🩺 知識庫健康體檢報告 — YYYY-MM-DD

### ✅ 綠燈項
- [運行良好的項目]

### ⚠️ 黃燈項
- **發現 N 個孤兒頁面**：[列表] - 建議添加關聯或分類
- **發現 N 個未同步索引**：[列表] - 文件存在但未在 index.md 註冊

### ❌ 紅燈項
- **發現 N 個死鏈**：[來源頁面] → [[不存在的目標頁面]]
- **存在 N 個未解決的知識衝突**：[頁面名稱]

### 🛠️ 下一步行動
1. 是否需要自動修復未同步索引？
2. 是否需要針對知識衝突進行重新推演？
\`\`\`

## 硬約束
- **僅讀掃描**：生成報告前，禁止修改、刪除、重命名任何文件
- **手動確認**：報告後等待用户確認再執行修復
- **靜默日誌**：修復完成後，在 wiki/log.md 追加 \`## [YYYY-MM-DD] lint | 修復了 N 個問題\`
\`\`\`
```

### 注意事項與風險

**上下文窗口** ：Karpathy 表示目前的方案在 40萬字 級別運行良好。但如果你要把這個工作流擴大，每次重新編譯或深度 Query 時，都需要把巨大的知識樹推入大模型的上下文窗口，無論是使用 Claude 還是 Gemini API， **這會導致極高的 Token 開銷（API 成本不可控）** 。 **高昂的 Token 成本** ：智能體的操作非常消耗token。即便我在skill中加入了技能鏈，使用了 `obsidian-cli` skill，但每次更新如果都要把關聯的十幾個文件和系統 Prompt 推給大模型，你的 API 費用依舊會暴增。 **AI幻覺** ：這是這套系統最致命的缺陷。由於整個 Wiki 由 LLM 自動化編譯並相互鏈接，如果大模型在某次處理中產生了幻覺（偽造了某個數據或聯繫），這個錯誤會被寫成 Markdown 永久固化在知識庫中。未來的推理會以此為“事實基石”，導致錯誤指數級放大。

### 我的看法

Karpathy只給出了理論，並沒有給出具體實現，目前社區中也都是根據其理論來進行技術補全。 但總體説來，Karpathy的核心理念，描繪的是個人知識管理（PKM）必然的終極形態—— **人類只做高價值的信息篩選與戰略提問，AI 接管所有繁瑣的節點編織。** 反傳統RAG，讓知識庫系統擁有了持久化狀態，知識才開始產生複利。

最後，還是要強調一點：注意Token消耗，注意Token消耗，注意Token消耗！

### Karpathy原文翻譯

英文原文： [llm-wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)

```markdown
# LLM Wiki

一種利用 LLM 構建個人知識庫的模式。

這是一個理念文件，旨在供你複製並粘貼到你自己的 LLM 代理（例如 OpenAI Codex、Claude Code、OpenCode / Pi 等）中。它的目標是傳達高層級的核心理念，而具體的構建細節將由你的代理與你協作完成。

## 核心理念

大多數人對 LLM 和文檔的體驗類似於 RAG（檢索增強生成）：你上傳一堆文件，LLM 在查詢時檢索相關的片段，然後生成答案。這種方式可行，但 LLM 在回答每個問題時都是從零開始重新發現知識，沒有知識的積累。如果問一個需要綜合五份文檔的微妙問題，LLM 每次都必須重新尋找並拼湊相關碎片。沒有任何東西被沉澱下來。NotebookLM、ChatGPT 的文件上傳以及大多數 RAG 系統都是這樣運作的。

這裏的理念則不同。LLM 不僅僅是在查詢時從原始文檔中檢索，而是**增量地構建並維護一個持久化的 Wiki** —— 這是一個位於你和原始資料之間的、結構化的、互相關聯的 Markdown 文件集合。當你添加新資料時，LLM 不只是為了以後的檢索而對其進行索引，而是閲讀它，提取關鍵信息，並將其整合到現有的 Wiki 中 —— 更新實體頁面、修訂主題摘要、記錄新數據與舊主張的矛盾之處，從而強化或挑戰不斷演進的綜合認知。知識被“編譯”一次後便*保持更新*，而不是在每次查詢時重新推導。

這就是關鍵區別：**Wiki 是一個持久化的、具有複利效應的工件。** 交叉引用已經建立，矛盾點已被標記，綜合綜述已經反映了你所讀過的一切。隨着你添加的每一份資料和提出的每一個問題，Wiki 都會變得更加豐富。

你永遠（或極少）親自編寫 Wiki —— LLM 負責編寫和維護所有內容。你負責提供資料、探索和提出正確的問題。LLM 負責所有的苦活累活 —— 摘要、交叉引用、歸檔和簿記，正是這些工作讓知識庫隨着時間的推移變得真正有用。在實踐中，我一邊打開 LLM 代理，另一邊打開 Obsidian。LLM 根據我們的對話進行編輯，我實時瀏覽結果 —— 點擊鏈接、查看關係圖譜、閲讀更新後的頁面。Obsidian 是 IDE；LLM 是程序員；Wiki 則是代碼庫。

這可以應用於許多不同的場景。例如：

- **個人**：跟蹤你自己的目標、健康、心理、自我提升 —— 歸檔日記條目、文章、播客筆記，並隨着時間的推移建立起關於你自己的結構化畫像。
- **研究**：在數週或數月內深入研究某個主題 —— 閲讀論文、文章、報告，並增量地構建一個帶有演進論點的全面 Wiki。
- **閲讀書籍**：邊讀邊歸檔每一章，構建角色、主題、情節線索及其關聯的頁面。讀完後，你就擁有了一個豐富的配套 Wiki。想想看像 [Tolkien Gateway](https://tolkiengateway.net/wiki/Main_Page) 這樣的粉絲 Wiki —— 成千上萬個互相關聯的頁面，涵蓋了角色、地點、事件、語言，由志願者社區耗時多年建成。你可以在閲讀時個人化地構建類似的東西，而所有的交叉引用和維護工作都由 LLM 完成。
- **業務/團隊**：由 LLM 維護的內部 Wiki，數據源自 Slack 討論帖、會議記錄、項目文檔、客户電話。可能由人工參與審核更新。Wiki 能保持最新，是因為 LLM 完成了團隊中沒人想做的維護工作。
- **競爭分析、盡職調查、旅行規劃、課程筆記、愛好深挖** —— 任何涉及知識長期積累且需要組織有序（而非零散）的場景。

## 架構

分為三個層級：

**原始資料 (Raw sources)** —— 你策劃的源文檔集合。文章、論文、圖片、數據文件。這些是不可變的 —— LLM 只從中讀取，絕不修改。這是你的“事實來源”。

**Wiki** —— 一個由 LLM 生成的 Markdown 文件目錄。包含摘要、實體頁面、概念頁面、對比分析、概覽、綜合綜述。LLM 完全擁有這一層。它創建頁面，在新資料到達時更新頁面，維護交叉引用，並保持一切一致性。你負責閲讀，LLM 負責編寫。

**架構規範 (The schema)** —— 一個説明文檔（例如 Claude Code 的 \`CLAUDE.md\` 或 Codex 的 \`AGENTS.md\`），告訴 LLM Wiki 是如何結構的、有哪些慣例，以及在攝入資料、回答問題或維護 Wiki 時應遵循的工作流。這是關鍵的配置文件 —— 正是它讓 LLM 成為一名紀律嚴明的 Wiki 維護者，而不是一個通用的聊天機器人。隨着你逐漸摸索出適合自己領域的方案，你和 LLM 會共同演進這份文檔。

## 操作

**攝入 (Ingest)**。你將新資料放入原始集合中，並告訴 LLM 進行處理。一個典型的流程：LLM 閲讀資料，與你討論關鍵要點，在 Wiki 中編寫摘要頁，更新索引，更新整個 Wiki 中相關的實體和概念頁面，並在日誌中追加一條記錄。一份資料可能會觸及 10-15 個 Wiki 頁面。就個人而言，我更喜歡逐個攝入資料並保持參與 —— 我閲讀摘要、檢查更新，並引導 LLM 重點關注哪些內容。但你也可以在較少監督的情況下批量攝入多份資料。由你決定適合自己風格的工作流，並將其記錄在架構規範中供未來會話使用。

**查詢 (Query)**。你針對 Wiki 提出問題。LLM 搜索相關頁面，閲讀並綜合出帶有引用來源的答案。答案可以根據問題採取不同的形式 —— Markdown 頁面、對比表格、幻燈片 (Marp)、圖表 (matplotlib)、畫布 (canvas)。重要的洞察：**好的答案可以作為新頁面重新歸檔到 Wiki 中。** 你要求的對比、分析或發現的關聯都是有價值的，不應消失在聊天曆史中。這樣，你的探索過程就會像攝入的資料一樣，在知識庫中產生複利。

**巡檢 (Lint)**。定期要求 LLM 對 Wiki 進行“健康檢查”。檢查內容包括：頁面之間的矛盾、已被新資料取代的陳舊主張、沒有入向鏈接的孤立頁面、提到了但缺乏獨立頁面的重要概念、缺失的交叉引用、可以通過網絡搜索填補的數據空白。LLM 擅長建議新的調查問題和尋找新資料。這能確保 Wiki 在增長過程中保持健康。

## 索引與日誌

兩個特殊文件幫助 LLM（以及你）在 Wiki 增長時進行導航。它們用途各異：

**index.md** 是以內容為導向的。它是 Wiki 中所有內容的目錄 —— 列出每個頁面及其鏈接、一行簡短摘要，以及可選的元數據（如日期或來源數量）。按類別組織（實體、概念、來源等）。LLM 在每次攝入時都會更新它。在回答查詢時，LLM 首先閲讀索引以尋找相關頁面，然後深入挖掘。這在中等規模（約 100 份資料，數百個頁面）下表現出奇地好，且避免了對基於嵌入 (Embedding) 的 RAG 基礎設施的需求。

**log.md** 是按時間順序排列的。它是一個只增記錄，記錄了何時發生了什麼 —— 攝入、查詢、巡檢。一個有用的技巧：如果每個條目都以一致的前綴開始（例如 \`## [2026-04-02] ingest | 文章標題\`），日誌就可以用簡單的 Unix 工具解析 —— \`grep "^## \[" log.md | tail -5\` 可以讓你看到最後 5 條記錄。日誌為你提供了 Wiki 演進的時間線，並幫助 LLM 瞭解最近完成了哪些工作。

## 可選：CLI 工具

在某些時候，你可能想構建一些小工具來幫助 LLM 更高效地操作 Wiki。對 Wiki 頁面進行搜索引擎是最顯而易見的需求 —— 在小規模下，索引文件就足夠了，但隨着 Wiki 的增長，你需要真正的搜索。[qmd](https://github.com/tobi/qmd) 是一個不錯的選擇：它是一個用於 Markdown 文件的本地搜索引擎，具有 BM25/向量混合搜索和 LLM 重排序功能，全部在本地運行。它既有 CLI（以便 LLM 可以調用 shell 命令），也有 MCP 服務器（以便 LLM 可以將其作為原生工具使用）。你也可以自己構建更簡單的東西 —— 隨着需求產生，LLM 可以幫你“直覺驅動式編程 (vibe-code)”一個簡單的搜索腳本。

## 提示與技巧

- **Obsidian Web Clipper** 是一個瀏覽器擴展，可將網頁文章轉換為 Markdown。對於快速將資料存入原始集合非常有用。
- **本地下載圖片**。在 Obsidian 設置 → 文件與鏈接中，將“附件默認存放路徑”設置為固定目錄（例如 \`raw/assets/\`）。然後在設置 → 快捷鍵中，搜索“下載”找到“下載當前文件的附件”並綁定快捷鍵（例如 Ctrl+Shift+D）。剪藏文章後，按下快捷鍵，所有圖片都會下載到本地磁盤。這是可選的，但很有用 —— 它讓 LLM 可以直接查看和引用圖片，而不是依賴於可能失效的 URL。注意，LLM 無法在一次讀取中原生閲讀帶有內嵌圖片的 Markdown —— 解決方法是讓 LLM 先讀文本，然後根據需要單獨查看部分或全部引用的圖片以獲取額外上下文。雖然有點笨重，但效果不錯。
- **Obsidian 的關係圖譜 (Graph view)** 是查看 Wiki 形態的最佳方式 —— 哪些是相連的，哪些頁面是核心樞紐，哪些是孤立頁面。
- **Marp** 是一種基於 Markdown 的幻燈片格式。Obsidian 有相關插件。適合直接從 Wiki 內容生成演示文稿。
- **Dataview** 是一個 Obsidian 插件，可以在頁面前置數據 (frontmatter) 上運行查詢。如果你的 LLM 為 Wiki 頁面添加了 YAML 前置數據（標籤、日期、來源計數），Dataview 可以生成動態表格和列表。
- Wiki 本質上只是一個 Markdown 文件的 Git 倉庫。你可以免費獲得版本歷史、分支功能和協作支持。

## 為什麼這種模式有效

維護知識庫最枯燥的部分不是閲讀或思考，而是“簿記”工作：更新交叉引用、保持摘要最新、記錄新舊數據的衝突、維持幾十個頁面的一致性。人類往往會放棄維護 Wiki，因為維護負擔的增長速度超過了其價值。LLM 不會感到厭倦，不會忘記更新交叉引用，並且可以一次性修改 15 個文件。Wiki 能夠維持下去，是因為維護成本幾乎為零。

人類的工作是策劃資料、指導分析、提出好問題，並思考這一切意味着什麼。LLM 的工作是除此之外的一切。

這個理念在精神上與 Vannevar Bush 的 Memex (1945) 相關 —— 一個私人的、經過策劃的知識存儲器，文檔之間具有聯想路徑。Bush 的願景與此更為接近，而不是現在的互聯網：私密的、積極策劃的，且文檔之間的關聯與文檔本身同樣具有價值。他無法解決的部分是誰來負責維護，而 LLM 解決了這個問題。

## 注意事項

本文檔刻意保持抽象。它描述的是一種理念，而非特定的實現。具體的目錄結構、架構慣例、頁面格式、工具鏈 —— 所有這些都取決於你的領域、你的偏好以及你選擇的 LLM。上述提到的所有內容都是可選的和模塊化的 —— 挑選有用的，忽略沒用的。例如：你的資料可能全是文本，所以完全不需要處理圖片。你的 Wiki 可能足夠小，只需索引文件即可，不需要搜索引擎。你可能不在乎幻燈片，只想要 Markdown 頁面。你可能想要一套完全不同的輸出格式。使用本模式的正確方法是將其分享給你的 LLM 代理，共同協作實例化一個符合你需求的版本。本文檔唯一的任務是傳達這種模式，剩下的交給你的 LLM。
```

## Key Comments
（部落格文章，原頁無公開留言區 → 不適用。已 archive 全文。）
