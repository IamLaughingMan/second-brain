# Obsidian Setup — LLM 第二大腦建置指南

> 本 vault 的建置藍圖。結合兩個來源：
> 1. **Andrej Karpathy** 的「LLM 當 compiler」知識庫模式（方法論／流程）
> 2. **kepano（Steph Ango，Obsidian 執行長）** 的 `obsidian-skills`（工具層／agent skills）
>
> Owner: masterdr ・ 建立：2026-06-11

---

## 一、Karpathy LLM Wiki Pattern（方法論）

**來源連結**
- 原始 gist（llm-wiki）：https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
- 解說文章（DAIR.ai Academy）：https://academy.dair.ai/blog/llm-knowledge-bases-karpathy

### 核心理念
> **把 LLM 當 compiler（編譯器），而不是 retriever（檢索器）。**

- 不靠 RAG pipeline、不靠向量資料庫（vector DB）。
- 在個人知識庫規模（~100 篇文章、~40 萬字）下，**`index.md` + LLM context window 就足以檢索**。
- 維護知識庫最累的是**雜務記帳（bookkeeping）**——摘要、連結、一致性、更新傳播。LLM 不會累，把這成本壓到趨近於零。這正是 1945 年 Vannevar Bush「Memex」當年解不了的「誰來維護」問題。

### 三層結構
1. **`raw/`（不可變來源）**：文章、論文、截圖、PDF。LLM 只讀不改，是事實來源（source of truth）。
2. **`wiki/`（維基層，混合結構）**：LLM 生成的 Markdown——實體頁、概念頁、摘要、總覽、交叉引用。**靠 `index.md` 當目錄、`[[wikilink]]` 當連結；meta／方法頁平放根層，領域內容入領域資料夾（鏡射 MOC hub，如 `Health/Oral/Periodontal Disease/`）。** LLM 完全擁有。
3. **`CLAUDE.md`（行為契約）**：定義結構、慣例、工作流程。

支援檔：`index.md`（目錄＝查詢入口）、`log.md`（append-only 時序紀錄，前綴可 grep）、`hot.md`（熱頁快取）。

### 四階段迴圈（Build flow）
```
        ┌──────────────────────────────────────────────┐
        ▼                                              │
  1. INGEST ──▶ 2. COMPILE ──▶ 3. QUERY & ENHANCE ──▶ 4. LINT & MAINTAIN
        │            │                  │                     │
     丟來源進     LLM 讀 raw/，      對 wiki 提問、         健檢：找矛盾、
     raw/         增量編譯成         帶引用作答；好         過時聲明、孤兒頁、
                  結構化 wiki        答案「存回 wiki」      缺連結；web 補洞、
                  （index＋概念頁     成新頁                 建議下一步研究
                  ＋backlinks）                            （回到 COMPILE）
```

1. **Ingest（攝入）**：來源（Obsidian Web Clipper 轉的文章、arXiv 論文、GitHub repo、資料集）落進 `raw/`。圖片**下載到本機**，別只存 URL（會失連）。
2. **Compile（編譯）**：LLM 增量讀 `raw/`，建出 index 檔＋概念頁＋衍生產物（Marp 投影片、matplotlib 圖、已歸檔的查詢答案）＋自動維護的連結圖。「一個來源可能動到 10–15 頁。」
3. **Query & Enhance（查詢與增益）**：用 Obsidian 當 IDE 瀏覽；Q&A agent 回答複雜問題；**查詢輸出再歸檔回 wiki**——「每次探索都會累積。」
4. **Lint & Maintain（健檢與維護）**：掃不一致、用 web search 補缺、找跨概念連結成新頁、建議接著研究什麼，然後回到 Compile。

### 為何複利（Why it compounds）
不必每次查詢都重檢索原始文件；LLM 維護一層**已綜合**的內容，隨每個來源與每次提問更豐富。交叉引用已在、矛盾已標記、綜合已反映你讀過的一切。

### 人 vs LLM 分工
- **人**：挑來源（curation）、提好問題、給方向、綜合意義。
- **LLM**：其餘全部機械工作——摘要、連結、一致性、更新傳播。

### 未來方向
用 wiki 生**合成訓練資料（synthetic training data）**去 fine-tune 一個 LLM，讓它把知識記進**權重**，而不只是靠 context window。

---

## 二、kepano / obsidian-skills（工具層）

**來源連結**
- Repo：https://github.com/kepano/obsidian-skills
- 作者：kepano（Steph Ango，Obsidian 執行長）・MIT 授權・~35k★

### 是什麼
一組符合 **Agent Skills 規範**的 Obsidian skill，讓任何相容 agent（**Claude Code、Codex、OpenCode**）能正確讀寫 Obsidian 的格式與操作 CLI。**本 vault 直接安裝此 obsidian-skills**（已於 2026-06-16 移除的 claude-obsidian 外掛當初亦 bundle 了幾個同名 skill，即源自此）。

### 五個 skill
| Skill | 用途 |
|---|---|
| **obsidian-markdown** | 寫正確的 Obsidian Flavored Markdown：wikilinks、embeds、callouts、properties |
| **obsidian-bases** | 建／改 Obsidian Bases（`.base`）：views、filters、formulas、summaries（動態資料庫） |
| **json-canvas** | 建／改 JSON Canvas（`.canvas`）：nodes、edges、connections（視覺圖） |
| **obsidian-cli** | 透過 Obsidian CLI 操作 vault，含 plugin／theme 開發 |
| **defuddle** | 用 Defuddle 把網頁抽成乾淨 markdown，省 token（ingest 前清雜訊） |

### 安裝流程（擇一）
**A. Plugin marketplace（Claude Code）**
```
/plugin marketplace add kepano/obsidian-skills
/plugin install obsidian@obsidian-skills
```

**B. npx**
```
npx skills add https://github.com/kepano/obsidian-skills
```

**C. 手動**
把 repo 內容放進 Obsidian vault 根目錄的 `.claude/` 資料夾。

### 在本 vault 怎麼用（流程）
1. **Ingest 前**：對網頁用 `defuddle` 清成乾淨 markdown → 落進 `.raw/`。
2. **Compile 時**：用 `obsidian-markdown` 確保產出的 wikilink／callout／properties 格式正確。
3. **視覺化**：用 `json-canvas` 把概念頁排成 graph／canvas；用 `obsidian-bases` 對 frontmatter 建動態表（如依 `type`、`status` 篩選）。
4. **批次操作**：用 `obsidian-cli` 做跨檔讀寫、搜尋、每日筆記。

---

## 三、兩者如何在本 vault 結合

| 層 | 來源 | 在本 vault 的角色 |
|---|---|---|
| **方法論／流程** | Karpathy | 決定「怎麼組織與維護」——index-driven 混合 wiki（meta 平放＋領域資料夾）、四階段迴圈、不用向量 DB |
| **工具／執行** | kepano obsidian-skills | 決定「用什麼動手」——markdown／bases／canvas／cli／defuddle 的正確語法與操作 |
| **契約** | 本 vault `CLAUDE.md` | 把上面兩者綁成 agent 每次必須遵守的規則 |

**一句話**：Karpathy 給流程，kepano 給工具，`CLAUDE.md` 把它們落實成這個 vault 的運作契約。

---

## 四、Layout sources 全面 audit

§ 一／§ 二只列了 vault 兩大支柱（方法論／工具）。實際 folder ontology 同操作慣例還借了其他幾個 PKM 大神嘅嘢，全部喺 vault `CLAUDE.md` ／ memory 散落寫過——呢度匯一張總表，方便日後追源。

| Layout 元素 | 來源 | 點解 / 角色 |
|---|---|---|
| `.raw/`（不可變來源） | **Karpathy** | 三層結構：事實 source of truth，LLM 只讀 |
| `wiki/`（含 `index.md` + `log.md` + `hot.md`） | **Karpathy** | LLM 編譯出嚟嘅綜合層，靠 `index.md` 檢索（取代 RAG／向量 DB） |
| 四階段迴圈（Ingest → Compile → Query → Lint） | **Karpathy** | 維護機制，LLM 做雜務 bookkeeping |
| `wiki/<Domain>/`（領域內容入領域夾、鏡射 MOC hub） | **Nick Milo / LYT**（Maps of Content） | MOC = 領域入口；hub-and-spoke |
| `Meta/`（system／operational 夾） | **Bryan Hogan plain mode** | docs／templates／attachments／bases／scripts 集中放系統檔 |
| `Inbox/`（catch-all + 7 日 triage SLA） | **GTD / David Allen**（capture-first） | 未定嘅嘢即時 capture，唔逼即時歸類；後續 triage |
| `Projects/` + `para: project` frontmatter | **PARA / Tiago Forte**（透過 **stefanimhoff** plain 詮釋） | 有完成日嘅嘢 = project；`code_path:` = Model B 對應 repo |
| `para:` 全套（project/area/resource/archive/inbox） | **PARA**（Tiago Forte）概念 + **kepano** 做法（properties-over-folders） | 攞 PARA 分類 ontology，但唔起 PARA folder tree，做成 metadata 鏡頭 |
| `Bookmarks/`（深層細分 tree + `status:` + `.base`、獨立於 wiki、多 folder 用 pointer stub） | **kepano**（file-over-app + properties-over-folders）+ **LYT**（fluid folders、不搬檔）+ **Andy Matuschak**（evergreen notes） | URL 指標長期保留；archive 不搬檔靠 metadata；多 folder 用 `type: pointer` + `![[正本]]` |
| Status field over Archive folder（`status: active/archived`，唔起 `Archive/`） | **LYT** + **Matuschak** + **kepano** | 唔搬檔，metadata view 篩 |
| `[[wikilink]]` 不帶路徑、檔名全 vault 唯一 | **Obsidian native** + **Matuschak**（atomic note + 穩定 ID） | 搬夾零斷連，呢個係上面所有「不搬檔」決定嘅技術基礎 |
| `obsidian-skills` 工具層（markdown / bases / canvas / cli / defuddle） | **kepano / Steph Ango** | 動手嘅 5 把刀 |
| Native PostToolUse auto-commit hook（`wiki/ .raw/ .vault-meta/`） | vault 內生（取代已移除嘅 AgriciDaniel `claude-obsidian` plugin） | git 自動 stage；hook 只 commit／唔 push |
| HKT 時間戳 + dual-log（vault `log.md` + 全局 CSV） | vault 內生規矩（見 `~/AI/Claude/CLAUDE.md` + memory） | 跨時區一致；跨 project 一條 timeline |
| `found-by-claude` provenance tag | vault 內生規矩（2026-06-17） | 分清 Claude research 搵到 vs 你親手掉嘅 link |

**一句綜述：**
- 方法論／workflow → **Karpathy**
- 工具／動手 → **kepano**（obsidian-skills + properties-over-folders 哲學）
- folder ontology → mix：**Bryan Hogan plain**（`Meta/`）、**GTD**（`Inbox/`）、**PARA／Tiago Forte**（`Projects/` + `para:`）、**LYT／Nick Milo**（領域夾鏡射 MOC + 不搬檔）、**Matuschak**（evergreen + 穩定檔名）
- archive 哲學 → **「不搬檔、靠 metadata」共識**（kepano + LYT + Matuschak）
- 其餘（auto-commit hook、HKT、dual-log、provenance tag） → vault 內生規矩

> Mapping 源：`CLAUDE.md`（vault root）、`~/AI/Claude/CLAUDE.md`（parent，記 HKT／CSV／bookmark 規矩）、memory（`feedback-obsidian-setup-research-community`、`project-flat-bookmarks-decision`、`feedback-mark-claude-found-links` 等）。

---

## 出處
- Karpathy llm-wiki gist：https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
- DAIR.ai 解說：https://academy.dair.ai/blog/llm-knowledge-bases-karpathy
- kepano/obsidian-skills：https://github.com/kepano/obsidian-skills
- 相關 wiki 頁：[[Karpathy LLM Wiki Pattern]]
