---
type: resource
resource_type: reference
title: "Karpathy's LLM Wiki Pattern"
status: developing
created: 2026-06-08
updated: 2026-06-11
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

由 Andrej Karpathy 發表的一份 GitHub 規格（[原始 gist](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)），說明如何把個人知識庫（personal knowledge base）結構化，讓語言模型（LLM）能**使用它**、而不只是搜尋它。**本 vault（claude-obsidian 外掛）即是此模式的實作。**

## 核心比喻：LLM 當 compiler，不是 retriever
> 把 LLM 當**編譯器（compiler）**，不是**檢索器（retriever）**。

DAIR.ai 的解說（[文章連結](https://academy.dair.ai/blog/llm-knowledge-bases-karpathy)）把這套濃縮成一句：**不靠 RAG pipeline、不靠向量資料庫**。在個人知識庫規模（~100 篇文章、~40 萬字）下，**`index.md` + LLM context window 就足以檢索**。LLM 增量讀 `raw/`、把它「編譯」成一層已綜合、互相連結的 wiki。

## 核心理念（Core philosophy）
> 「維護知識庫最累的不是閱讀或思考，而是雜務記帳（bookkeeping）。」

人會放棄維護 wiki，是因為維護成本長得比價值快。LLM 不會累、一次可改 10–15 個檔，把維護成本壓到趨近於零——這正是 1945 年 Vannevar Bush 的 Memex 概念當年解不了的「**誰來維護（who does the maintenance）**」問題。

- **人的角色（human role）**：挑選來源（curation）、提出好問題、給方向、綜合意義（synthesis of meaning）。
- **LLM 的角色（LLM role）**：其餘全部機械工作——摘要（summarization）、連結（linking）、一致性維護、更新傳播。

## 三層結構（Three-layer architecture）
1. **`raw/`（原始來源 raw sources）**：文章、論文、截圖、PDF。**不可變（immutable）**，LLM 只讀不改，是事實來源（source of truth）。
2. **`wiki/`（維基層）**：LLM 生成的 Markdown——實體頁（entity）、概念頁（concept）、摘要、總覽、交叉引用（cross-references）。LLM 完全擁有。
3. **`CLAUDE.md`（schema／行為契約 behavioral contract）**：定義 wiki 結構、慣例與工作流程。

支援檔：
- **`index.md`**：內容目錄（catalog），告訴模型有哪些頁、各是什麼。
- **`log.md`**：append-only 時序紀錄，前綴可 grep（如 `## [2026-04-02] ingest`）。
- **hot cache（熱頁快取）**：常用頁的快取（本 vault 的 `hot.md`）。

## 四階段迴圈（Core workflow，DAIR.ai 版）
`Ingest → Compile → Query&Enhance → Lint&Maintain →（回到 Compile）`

1. **Ingest（攝入）**：來源（Web Clipper 文章、arXiv 論文、GitHub repo、資料集）落進 `raw/`。圖片下載到本機，別只存 URL。
2. **Compile（編譯）**：LLM 增量讀 `raw/`，建出 index＋概念頁＋衍生產物（Marp 投影片、matplotlib 圖、已歸檔的查詢答案）＋自動維護的連結圖。「一個來源可能動到 10–15 頁。」
3. **Query & Enhance（查詢與增益）**：對 wiki 提問、帶引用作答；**查詢輸出再歸檔回 wiki 成新頁**——「每次探索都會累積。」
4. **Lint & Maintain（健檢與維護）**：掃矛盾、過時聲明、孤兒頁、缺交叉引用；用 web search 補洞、找跨概念連結成新頁、建議下一步研究，然後回到 Compile。

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
Karpathy 自己的 vault 已成長到約 **100 篇文章、40 萬字（~400,000 words）**，幾乎全由 agent 撰寫與維護。

## 出處連結（Sources）
- Karpathy 原始 gist（llm-wiki）：https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
- claude-obsidian（本 vault 使用的外掛，實作此模式）：https://github.com/AgriciDaniel/claude-obsidian
- 報導整理（Techstrong.ai）：https://techstrong.ai/features/karpathys-instructions-for-building-an-ai-driven-second-brain/

相關：本 vault 的 [[Research - Severe Periodontitis and Tooth Loss]] 即依此模式建立。
