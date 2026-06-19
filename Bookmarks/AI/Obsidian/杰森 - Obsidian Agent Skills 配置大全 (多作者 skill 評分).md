---
type: bookmark
para: resource
domain: ai-tools
title: "Obsidian AI Agent Skills 配置指南（多作者 skill 評分）"
url: "https://jasonai.me/blog/obsidian-ai-agent-skills-configuration-guide/"
author: "Jason（杰森的效率工坊）"
status: active
created: 2026-06-19
updated: 2026-06-19
related:
  - "[[杰森 - Obsidian 接入 Claude Skill 教程 (Claudian + obsidian-skills)]]"
  - "[[杰森的效率工坊 - Karpathy LLM Wiki (Claude Code + Obsidian 進階)]]"
  - "[[skills]]"
  - "[[yt-dlp]]"
tags:
  - bookmark
  - ai-tools
  - obsidian
  - claude-code
  - obsidian-skills
  - agent-skill
  - kepano
  - tutorial
---

# Obsidian AI Agent Skills 配置大全（多作者 skill 評分）

- URL: https://jasonai.me/blog/obsidian-ai-agent-skills-configuration-guide/
- Author: Jason（杰森的效率工坊）
- Saved date: 2026-06-19
- Topic: Obsidian Agent Skills 大全 —— 跨 5 個作者 11 個 skill，逐個功能/依賴/用法 + 推薦度 ✅⚠️❌
- Status: active

## Why I saved this

你叫我「see that 9 skills」—— 呢篇正係 Obsidian Agent Skills 嘅**策展評分表**。對本 vault 直接有用：① 確認你已裝嘅 kepano 5 個 skill 嘅評分 ② 列出**你未裝、值得考慮**嘅 Axton 視覺系 3 個 + tutor/scholar ③ 揭咗一個關鍵更新：**defuddle 而家支援 YouTube（用官方 API、唔使 yt-dlp）**—— 正好解我哋之前撞 yt-dlp bot-wall 嘅痛。

## 你裝咗邊啲？（11 skill across 5 作者）

| 作者 | Skill | 評分 | 你狀態 |
|------|-------|:----:|--------|
| **kepano** `kepano/obsidian-skills` | defuddle | ✅ | ✅ 已裝 |
| | obsidian-cli | ✅ | ✅ 已裝 |
| | obsidian-bases | ✅ | ✅ 已裝 |
| | obsidian-markdown | ⚠️ | ✅ 已裝 |
| | json-canvas | ❌ | ✅ 已裝 |
| **Axton** `axtonliu/axton-obsidian-visual-skills` | obsidian-canvas-creator | ✅ | ⬜ 未裝（json-canvas 加強版，解節點重疊）|
| | mermaid-visualizer | ✅ | ⬜ 未裝（文字→Mermaid 圖，含語法糾錯）|
| | excalidraw-diagram | ✅ | ⬜ 未裝（需 Excalidraw 插件）|
| **OpenClaw** `openclaw/openclaw` | obsidian-skill | ❌ | ⬜（過時，官方 obsidian-cli 已取代）|
| **Choi Wontak** `RoundTable02/tutor-skills` | tutor-skills | ✅ | ⬜（文檔/碼庫→測驗學習庫）|
| **EESJGong** `EESJGong/scholar-skill` | scholar-skill | ✅ | ⬜（論文深讀，重型 OpenClaw 依賴）|

> 「9 skills」≈ 扣走 2 個 ❌（json-canvas、OpenClaw obsidian-skill）後嘅 9 個推薦 skill。你 kepano 5 個全裝齊（多過文章其他人用嘅）。

## My Notes

- **defuddle YouTube：實測唔掂（2026-06-19 已驗）**：文章話 defuddle 支援 YouTube 官方 API 抓字幕，但**實測 npm `defuddle` CLI `0.19.0`（= 最新版）抓 YouTube 直接報錯 `Invalid URL`**，攞唔到 metadata/字幕。⇒ 文章嘅 YouTube 支援**唔喺 npm CLI**（或係指 obsidian-skills skill 層／未 ship）。**結論：抓 YouTube 仍用 [[yt-dlp]] + `--cookies-from-browser chrome`**，defuddle 唔係替代品。
- **Axton 視覺系 3 skill = 最值得考慮嘅 candidate**：obsidian-canvas-creator（json-canvas 加強，自動排版唔重疊）、mermaid-visualizer、excalidraw-diagram —— 本 vault 重 wikilink/graph，視覺化輸出或有用。
- **kepano 評分對照**：你全裝 5 個；文章畀 `json-canvas` ❌（建議用 Axton canvas-creator 替）、`obsidian-markdown` ⚠️（但可塞自己格式偏好入 skill）。
- **插件部分（claudian / obsidian-agent-client）**：本 vault **CLI-first 唔用**（見 [[杰森 - Obsidian 接入 Claude Skill 教程 (Claudian + obsidian-skills)]]）。`obsidian-agent-client` 係新嘢（適配 Claude Code/Codex/Gemini/OpenCode/Qwen，BRAT 裝），純參考。
- **scholar-skill 警告**：2.5 小時 L3 挂機深讀 + RAG = token 黑洞；底層 `obsidian-direct` 用民間 Python 暴力 I/O（非官方 CLI），多端同步易壞檔 —— 文章自己都警告，本 vault 唔啱（你重 status-over-folder + 官方 CLI）。

## Related
- [[杰森 - Obsidian 接入 Claude Skill 教程 (Claudian + obsidian-skills)]] —— 同作者上一篇（Claudian + 裝法）
- [[杰森的效率工坊 - Karpathy LLM Wiki (Claude Code + Obsidian 進階)]] —— 同作者 LLM Wiki 影片
- [[skills]] —— 本 vault skills（kepano 5 個已裝）
- [[yt-dlp]] —— defuddle YouTube 或可替代
- [[Bookmarks]]

<!-- ===== ARCHIVE BELOW — 全文 snapshot（defuddle 2026-06-19，已 opencc s2hk 轉正體），掃描/triage 時可跳過 ===== -->

## Full Content (archived)
> 來源：https://jasonai.me/blog/obsidian-ai-agent-skills-configuration-guide/　・　defuddle 抽取 2026-06-19 HKT，已 opencc `s2hk` 簡→繁香港。原文簡體。

## Obsidian 必裝 Skills

| 作者 | Skill名稱 | 功能描述 | 推薦度 |
| --- | --- | --- | --- |
| **Obsidian CEO @kepano**   GitHub: `kepano/obsidian-skills` | defuddle | 網頁內容清洗工具，專門用來把雜亂的網頁轉換成純淨的 Markdown 格式，通過剔除廣告和導航欄來幫你節省 AI 調用時的 Token 消耗。 | ✅ |
|  | obsidian-cli | 讓 AI Agent 能夠直接調用 Obsidian 官方的命令行工具，從而實現對筆記、任務、屬性的增刪改查，以及對插件開發環境的調試與管理。 | ✅ |
|  | obsidian-bases | 讓 AI 能夠創建和維護.base 格式的配置文件，從而在 Obsidian 裏生成類似 Notion 數據庫的動態視圖，實現對筆記的過濾、計算和結構化展示。 | ✅ |
|  | obsidian-markdown | 讓 AI 能夠編寫和編輯符合 Obsidian 官方規範的增強版 Markdown 文檔，實現雙向鏈接、內容嵌入、提示框以及結構化屬性的深度集成。 | ⚠️ |
|  | json-canvas | 讓 AI 能夠創建和編輯 Obsidian 的.canvas 白板文件，通過 JSON 結構實現節點（文本、文件、鏈接、組）的佈局以及它們之間的連線邏輯。 | ❌ |
|  |  |  |  |
| **Axton，著名博主@回到Axton**   GitHub: `axtonliu/axton-obsidian-visual-skills` | obsidian-canvas-creator | 加強版的 json canvas skill，解決了節點重疊和空間分佈不均的問題。 | ✅ |
|  | mermaid-visualizer | 將文本邏輯轉化為專業的 Mermaid 架構圖或流程圖，並內置了針對 Obsidian 渲染引擎的語法糾錯機制。 | ✅ |
|  | excalidraw-diagram | 將文本邏輯轉化為手繪風格的 Excalidraw 圖表 | ✅ |
|  |  |  |  |
| **OpenClaw官方GitHub**   GitHub: `openclaw/openclaw/skills/obsidian` | obsidian-skill | 直接操作文件系統，也就是文件I/O，非常消耗Token，在官方已經發布Obsidian-cli的情況下，沒有理由繼續使用這個過時的方式。 | ❌ |
|  |  |  |  |
| **Choi Wontak**   GitHub: `RoundTable02/tutor-skills` | tutor-skills | 兩個 Skill (tutor-setup 和 tutor) ，構成了一個“輸入-內化-檢測”的完整閉環：將文檔或代碼庫一鍵轉化為結構化的 Obsidian 知識庫，之後通過無提示的交互式測驗不斷暴露出你的知識盲區並記錄學習軌跡。 | ✅ |
|  |  |  |  |
| **EESJGong**   GitHub: `EESJGong/scholar-skill` | scholar-skill | 基於 OpenClaw 框架的學術研究skill，通過L1-L3的分級閲讀策略在後台長時間靜默解析論文，並自動將結構化筆記、核心記憶與知識衝突報告寫入你的本地 Obsidian 知識庫中。 | ✅ |

## Obsidian CEO 發佈的 Skills

### defuddle

#### Skill功能

Defuddle 主要用來抓取網頁裏的核心正文。它會自動刪掉導航條、側邊欄和廣告等干擾元素，只留下乾淨的 Markdown 內容。這個功能讓 AI 在處理長文章、在線文檔或博客時，不僅能讀得更準，還能大幅減少不必要的字符開銷。最近一次更新中已經支持YouTube視頻鏈接，它獲取YouTube視頻字幕的方式是調用YouTube官方API，而不是我們之前熟知的 `yt-dlp` 組件。

#### 所需依賴

1. Node.js 運行環境。
2. 全局安裝的 defuddle 包，安裝命令是 `npm install -g defuddle` 。

#### 觸發條件和使用方法

當你給 Agent 發送一個網頁鏈接（URL），並要求它閲讀、分析或總結裏面的內容時，就會觸發這個 Skill。

提示詞樣例：

```text
提取這個網頁的正文，轉成乾淨的 Markdown 格式：[URL]。
```

#### 注意事項

這個工具對標準 HTML 網頁（如新聞、博客、官方文檔）效果最好，但如果網頁需要登錄或者是純動態渲染的單頁應用，抓取效果可能受限。

### obsidian-cli

**功能開啓與基礎配置**

1. 確認系統環境，保證 Obsidian 客户端版本在 1.12 以上。
2. 進入 Obsidian 界面，打開“設置 -> 常規 (General)”。
3. 找到“命令行界面 (Command line interface)”開關並打開。
4. 在彈出的窗口中確認註冊到系統 Path。
5. 保證 Obsidian 客户端處於運行狀態（如果在未運行狀態下執行命令，系統會自動啓動客户端）。

驗證配置成功的方法是打開操作系統的終端工具（Mac 使用 Terminal，Windows 使用 PowerShell），輸入下面這個基礎命令：

```bash
obsidian daily
```

如果配置正確，Obsidian 會直接自動應用日記模版並在界面中生成今天的日記文件。

### obsidian-bases

#### Skill 功能

這個 Skill 允許 AI 通過編寫 YAML 格式的 `.base` 文件來創建Obsidian bases數據庫。它支持非常強大的公式系統，可以讀取筆記的 Frontmatter 屬性或文件元數據（如創建時間、字數等），並進行條件判斷、日期運算和字符串處理。

#### 所需依賴

- **Maps 插件** ：如果需要使用這個 Skill 裏的 map（地圖）視圖，必須額外安裝名為 Maps 的社區插件。

#### 觸發條件和使用方法

樣例提示詞：

```text
寫一個 .base 文件來管理我的項目筆記，要求篩選出所有帶 #project 標籤的文件，用表格顯示項目名稱、截止日期和剩餘天數。
```

**視圖限制** ：目前只支持 table（表格）、cards（卡片）、list（列表）和 map（地圖）這四種類型。

### obsidian-markdown

#### 使用方法

樣例提示詞：

```text
根據這段會議記錄生成一份 Obsidian 筆記。要求在頂部包含日期和參會人的屬性，使用雙向鏈接關聯到“項目 A”筆記，並把關鍵決策點用important類型的提示框標註。
```

**擴展** ：因為skill是對格式的語法和約束，所以可以將個人obsidian格式偏好加入到skill中，以保證Agent寫出的知識筆記符合你的要求。

### json-canvas

#### 使用方法

樣例提示詞：

```text
創建一個名為“AI 學習路徑”的 json canvas文件。中心是一個文本節點，連向三個文件節點，分別是“模型基礎”、“提示詞工程”和“智能體實戰”。
```

### obsidian-canvas-creator

#### Skill 功能

內置了徑向佈局（MindMap）和自由排版（Freeform）算法，能夠自動計算節點座標、處理連接線路徑、並根據文本長度動態調整節點尺寸，從而生成整齊、美觀且邏輯清晰的視覺架構。

#### 使用方法

樣例提示詞：

```text
把這markdown知識筆記轉換成一個mindmap格式的 Obsidian Canvas。
```

#### 與 json-canvas skill 的對比

- **側重點不同** ： `json-canvas` 主要關注底層的 JSON 語法正確性和屬性定義；而 `obsidian-canvas-creator` 側重於高層的排版策略和空間座標計算。
- **自動化程度不同** ：使用 `json-canvas` 時，AI 可能只是機械地擺放節點；使用本 Skill 時，AI 會根據 `layout-algorithms.md` 計算每個節點的 X/Y 座標，確保節點不重疊且間距符合視覺審美。
- **結構化邏輯** ：本 Skill 引入了特定的佈局模式（如 MindMap 模式和 FreeForm模式），能自動處理父子層級關係，而不僅僅是單一的節點創建。

### mermaid-visualizer

#### 使用方法

樣例提示詞：

```text
根據這段關於軟件開發生命週期的描述生成一個橫向的 Mermaid 流程圖，要求包含不同的子圖來區分開發環境和測試環境。
```

### excalidraw-diagram

#### 所需依賴

- **Excalidraw 插件** ：必須安裝並啓用 Excalidraw 插件。

#### 觸發條件和使用方法

樣例提示詞：

```text
用 Excalidraw 畫一個 AI 智能體的工作流動畫圖，按照感知、思考、行動的順序設置動畫步驟，並保存為 .excalidraw 文件。
```

### tutor-skills

#### Skill 功能

`tutor-setup` 能將任何本地文檔或源代碼工程自動解析，並生成帶有雙鏈、MOC 和複習題的獨立 Obsidian 學習金庫 (StudyVault)；而 `tutor` 則讀取知識庫的進度數據，在終端內為你生成互動式測驗，追蹤並攻克你的知識薄弱點。

#### 所需依賴

- **基礎環境** ：智能體工具如 Claude Code, OpenCode。

#### 使用方法

- **使用方法** ：在特定工作目錄輸入命令 `/tutor-setup` 觸發構建，或在已有 StudyVault 的目錄下輸入 `/tutor` 觸發複習。

#### Skill 的特殊機制

- **模式自動偵測** ：無需手動指定，Skill 會自動掃描當前工作目錄，若發現 `package.json` 或 `pom.xml` 等工程文件會自動進入“代碼庫模式”；若只有 PDF/純文本，則進入“文檔模式 ”。

#### 注意事項

- **Token 消耗風險** ：儘管禁止了 PDF 圖像讀取，但“代碼庫模式”會遞歸讀取大量源文件並進行架構溯源（Phase C1-C9 循環），在短時間內消耗大量 Token 額度。

### scholar-skill

#### Skill 功能

`scholar-skill` 是一個深度的個人知識管理與文獻解構工作流。它通過分級標準（L1分發/L2標準閲讀/L3深度解構），將原始論文（PDF/ArXiv）轉化為 Obsidian 中的雙鏈卡片、MOC（內容地圖）以及系統性的反思報告。它還能記錄你閲讀過程中的誤區並提取可複用的研究方法論。

#### 所需依賴

要運行此係統，你需要配置一套相對重型的底層環境：

- **基礎環境** ：本地 Python 環境與預先安裝好的 Obsidian 客户端（及配置好的 Vault 文件夾）。
- **核心框架** ：安裝配置好的 OpenClaw 智能體框架。
- **依賴 Skill (通過 ClawHub 安裝)** ：
	- `obsidian-direct` （必須）：用於繞過官方限制，直接通過 Python 強行讀寫本地 `.md` 文件。
		- `arxiv-watcher` （必須）：用於通過 ArXiv API 抓取文獻資源。
		- `durable-task-runner` （核心必須）：用於支持 L3 級別長時間掛機任務的調度與斷點續傳。
		- 增強依賴（可選）： `tavily` （聯網抓取）、 `pdf` （文本解析）、 `academic-research-hub` 。

#### 觸發條件與使用方法

- **觸發條件** ：當意圖匹配到“閲讀論文”、“L1/L2/L3閲讀”、“知識內化”或“文獻筆記”時自動觸發工作流。
- **使用方法（提示詞樣例）** ：
```text
獲取這篇文獻 ArXiv:2407.19354 並進行處理。
先做 L1 快速評估，如果判定為 P0 優先級，則請在後台直接啓動 L3 深度閲讀。
完成後將知識樹更新推送到我的 Obsidian 對應目錄。
```

#### Skill 的特殊機制

- **超長週期任務編排** ：由於大模型無法一次性吃透幾十頁附帶複雜公式的論文，L3級深度閲讀被設計為長達 2.5 小時的異步掛機任務。底層深度依賴 OpenClaw 的 `durable-task-runner` 來處理多次 LLM 推演循環、API 限流等待以及崩潰恢復。
- **週期性反思機制** ：內置時間觸發器邏輯，強制在週末或月末對“臨時存儲的知識”進行 L2/L3 反思，生成知識體系演進報告。
- **人類確認防呆機制** ：當 AI 發現新論文推翻了你舊筆記的結論時，不會直接覆寫舊筆記，而是生成一份確認單放進 `0-Inbox` 文件夾，等待人類審核確認（Human in the loop）。

#### 注意事項與風險預警

- **財務毀滅/算力黑洞風險** ：長達 2.5 小時的 L3 循環和高頻的歷史知識檢索（RAG）會消耗極其恐怖的 Token。如果後端掛載的是商用前沿模型（如 Claude 3.5 Sonnet 或 GPT-4o），單篇深讀可能帶來高昂的 API 賬單。
- **數據覆寫與壞檔風險** ：底層的 `obsidian-direct` 使用的是民間 Python 暴力文件 I/O 腳本，而非 Obsidian 官方 CLI 通信。在文件多端同步（如 iCloud/Obsidian Sync）期間，極易引發文件衝突、內容丟失或雙鏈索引錯誤。強烈建議在獨立測試庫中運行，並開啓 Git 快照。

---

## 核心插件

- **claudian**: Obsidian 第三方插件（暫未上架官方市場），適配 Claude Code。GitHub Repo: `YishenTu/claudian`
- **obsidian-agent-client**: 第三方插件（暫未上架官方市場），適配主流智能體：Claude Code, Codex, Gemini CLI, OpenCode, Qwen Code。GitHub Repo: `RAIT-09/obsidian-agent-client`

### 1\. 安裝方式

#### 方案 A：通過 BRAT 安裝 (推薦)

這是保持插件自動更新的最佳方式，適合尚未上架市場的 Beta 插件。

1. **安裝 BRAT**: 在 Obsidian 插件市場搜索並安裝 BRAT。
2. **添加倉庫**: 打開 設置 -> BRAT -> Add Beta plugin，輸入倉庫地址：YishenTu/claudian。
3. **啓用**: 點擊 Add Plugin 等待下載完成後，在“第三方插件”列表中開啓 **Claudian** 。

#### 方案 B：手動加載

若網絡環境無法直接連接 GitHub 倉庫，可採用此法。

1. **獲取文件**: 訪問 GitHub 倉庫 Releases 頁面，下載 main.js、manifest.json、styles.css。
2. **創建路徑**: 進入倉庫目錄.obsidian/plugins/，新建文件夾 claudian。
3. **放置文件**: 將下載的三個文件放入該文件夾。
4. **啓用**: 重啓 Obsidian 或在插件設置頁刷新，手動開啓。

### 2\. 插件設置

#### claudian設置

1. 打開 claudian 設置頁。
2. **基礎設置**: 設置 `User Name` (如 Jason)。
3. **自定義AI模型**: 使用兼容Anthropic接口的模型（如智譜GLM或DeepSeek）來替換Claude模型。
```bash
ANTHROPIC_BASE_URL=https://open.bigmodel.cn/api/anthropic
ANTHROPIC_API_KEY=你的智譜api key
ANTHROPIC_DEFAULT_OPUS_MODEL=GLM-5
```
4. **連通性驗證**:
- `Ctrl/Cmd + P` 調出命令面板 -> 輸入 `claudian` -> 選擇 `Open chat view` 。
- 發送“你好”，若回覆正常則配置成功。

#### obsidian-agent-client設置

以 OpenCode為例：

1. 打開 agent-client 設置頁。在 Custom Agent 中，點擊 `Add Custom Agent` 按鈕。設置 Agent ID 和 Display Name 為 OpenCode。
2. 在命令行中輸入 `where opencode` 查看 OpenCode 安裝路徑，把路徑填入Path。
3. Arguments 填如下信息，注意第三行是你的Obsidian Vault路徑：
```bash
acp
--cwd
D:\Obsidian Vault\MyObVault
```
4. **連通性驗證**:
- 在Agent Client的AI對話框中，發送“你好”，若回覆正常則配置成功。

## Key Comments
（部落格文章，原頁無公開留言區 → 不適用。reference source link-rot 風險中等，已 archive 全文。）
