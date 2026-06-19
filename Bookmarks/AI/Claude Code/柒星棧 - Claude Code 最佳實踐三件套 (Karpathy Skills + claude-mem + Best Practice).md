---
type: bookmark
para: resource
domain: ai-tools
title: "Claude Code 最佳實踐全攻略：Karpathy Skills + claude-mem + Best Practice 三件套"
url: "https://zhuanlan.zhihu.com/p/2027705686390313096"
author: "柒星棧（知乎）"
status: active
created: 2026-06-19
updated: 2026-06-19
related:
  - "[[雷蒙 Lifehacker - Claude Code 學習資源 hub]]"
  - "[[hooks]]"
  - "[[skills]]"
tags:
  - bookmark
  - ai-tools
  - claude-code
  - karpathy
  - claude-mem
  - best-practice
  - hooks
  - subagents
---

# Claude Code 最佳實踐三件套（Karpathy Skills + claude-mem + Best Practice）

- URL: https://zhuanlan.zhihu.com/p/2027705686390313096
- Author: 柒星棧（知乎）・ 17 贊同
- Saved date: 2026-06-19
- Topic: 三個 GitHub 開源項目（合計 10 萬+★）組成嘅 Claude Code 效率體系
- Status: active
- **抓取備註**：知乎封自動抓取（defuddle / WebFetch / curl 全部 403，login + anti-bot），**全文由使用者登入後 paste 提供**（非 Claude 自動抓）。

## Why I saved this

呢篇直接講到本 vault／本機 setup 嘅**根**：`andrej-karpathy-skills`（Forrest Chang，13.7K★）**正正係你 `~/.claude/CLAUDE.md` 嗰四原則**（Think Before Coding / Simplicity First / Surgical Changes / Goal-Driven Execution）。文章把佢同 `claude-mem`（記憶）+ `claude-code-best-practice`（配置體系，已喺 [[雷蒙 Lifehacker - Claude Code 學習資源 hub|雷蒙 hub]] 出現）三件套串埋講。對照本 vault 已有/未有嘅機制好有用。

## Summary（三件套）

| 項目 | ★ | 解決 | 角色 |
|------|----|------|------|
| **andrej-karpathy-skills**（forrestchang）| 13.7K | 行為失控（過度工程/亂加依賴/自信犯錯）| 行為校準器 = 一個 CLAUDE.md + 四原則 |
| **claude-mem**（thedotmack）| 46.1K | Claude「失憶症」每次 session 清零 | 記憶系統（語義壓縮存 SQLite，三層檢索）|
| **claude-code-best-practice**（shanraisshan）| 42.3K | 配置散亂 | 生產級配置藍圖（L1-L4 分層）|

## Key Takeaways

**Karpathy 四原則**（= 你 `~/.claude/CLAUDE.md`）：① Think Before Coding（先用自然語言講點做+點解，你睇完先動手）② Simplicity First（3 行唔寫 30 行、用現有工具、唔搞 design pattern；作者實測碼量 -40%）③ Surgical Changes（只改該改、唔順手「優化」周邊）④ Goal-Driven Execution（持續對齊目標、偏離即停問）。侷限：寫畀 solo engineer，缺「做啱嘢」（PM/創辦人最貴失敗係做錯功能）。

**claude-mem**：session 開始注入最近 10 次 context → 工具執行自動捕獲 → Claude Agent SDK 語義壓縮成結構化觀察存 SQLite → session 結束生成總結。**三層檢索**（會話摘要層自動注入／語義搜尋層按需 `claude-mem://` URI／資料夾 context 層自動生成 CLAUDE.md）。省 ~2250 token/session。有多機 SSH 同步、雙標籤隱私（標 private 唔注入，處理 .env/密鑰用）。裝：`npx claude-mem install`。

**best-practice 四層配置體系**：
- **L1 CLAUDE.md**（項目記憶，**建議性**）：技術棧/命名/目錄，**控制 <150 條指令**
- **L2 Skills**（可複用工作流，自動觸發）
- **L3 Hooks**（**強制執行**：禁改 .env、自動格式化）
- **L4 Subagents**（分工：code-reviewer 等，獨立 context window）
- **關鍵認知**：Hooks 強制、CLAUDE.md 只建議 → 安全規則放 Hooks/`permissions.deny`，唔好淨靠 CLAUDE.md 寫「唔好碰」。

**上下文管理（隱形殺手）**：① 勤 `/clear`（感覺跑偏即清，重要嘢 claude-mem 已存）② 主動 `/compact 保留 <X>`③ 按 context 單元拆任務（會話1 規劃 Plan Mode → /clear → 會話2 實現 → /clear → 會話3 測試）。

**效果對比（加搜尋功能）**：裸奔 vs 三件套 = 新依賴 3→0、碼量 287→164 行(-43%)、偏離需求 5→0 處、人工修正 4→1 次、第二 session 記憶 ❌→✅。同模型同 Claude，配置差 ≥3 倍效率。

## My Notes（對本 vault 嘅映射）

- **andrej-karpathy-skills = 你 `~/.claude/CLAUDE.md`** —— 四原則逐字對上（machine-wide 行為守則）。即係你早就裝咗三件套嘅第一件。
- **claude-code-best-practice 已 bookmark**（喺 [[雷蒙 Lifehacker - Claude Code 學習資源 hub]] 清單內，shanraisshan）。
- **claude-mem vs 本 vault 記憶**：本 vault 有自家 memory（`memory/*.md`）+ **Claude history Stop hook**（per-turn mirror）+ dual-log。claude-mem 係另一條路（語義壓縮 SQLite + 自動注入）。**可評估**：claude-mem 自動注入 vs 你手動 curated memory，邊個適合 —— 但你 vault memory 係 curated、claude-mem 係 auto-capture，哲學唔同（你偏 curation）。
- **L1-L4 分層 ≈ 本 vault `[[extensions]]` catalog**（skills/plugins/hooks/mcp）。但文章「CLAUDE.md <150 條指令」**值得留意**：本 vault `CLAUDE.md` 偏長（mixed-mode 多規矩）—— 可考慮係咪部分搬去 skill（你 project skill 現為 0）。
- **Hooks 強制 vs CLAUDE.md 建議**：本 vault 已用 native hook（auto-commit / Stop / PreToolUse RTK…），同文章主張一致。`permissions.deny` 保護敏感檔嘅招本 vault 未用，可考慮。

## Related
- [[雷蒙 Lifehacker - Claude Code 學習資源 hub]] —— 內含 claude-code-best-practice
- [[hooks]] —— 本 vault hooks（強制層）
- [[skills]] —— 本 vault skills（project skill 現 0）
- [[Bookmarks]]

<!-- ===== ARCHIVE BELOW — 全文（使用者 paste 2026-06-19，知乎封自動抓取），掃描/triage 時可跳過 ===== -->

## Full Content (archived)
> 來源：https://zhuanlan.zhihu.com/p/2027705686390313096（柒星棧，知乎）。知乎封自動抓取（403），**全文由使用者登入後 paste**；已略去 Unsplash 圖片來源行。

### 導語
打開 Claude Code，信心滿滿地説"幫我重構這個模塊"，然後眼睜睜看着它：加了三個你從沒聽過的依賴，搞出一堆你根本沒要求的抽象層，還順手把你的命名規範改了個遍。最後你花了比手寫還多的時間來收拾殘局。我也是，直到我發現了 GitHub 上三個加起來超過 10 萬 Star 的開源項目，這徹底改變了我和 Claude Code 的協作方式。

### 一個推文所引發的"配置革命"
2026 年初，Andrej Karpathy（OpenAI 聯合創始人、前 Tesla AI 負責人、"vibe coding" 一詞發明者）在 X 發推，沒分享新工具或框架，只是冷靜地把 LLM 寫代碼反覆出現的毛病列出來：**過度工程**（讓它修個按鈕，反倒搭了一整個組件庫）、**無視現有模式**（項目用 Zustand 偏要引入 Redux）、**亂加依賴**（沒要求過的 npm 包悄悄裝上）、**自信地犯錯**（不確定時不詢問直接猜，猜錯還表現得特別篤定）。Karpathy 的洞察："如果這些錯誤是可預測的，那它們就是可預防的。"

開發者 Forrest Chang 把 Karpathy 的觀察提煉成一個 CLAUDE.md 文件放上 GitHub，即後來狂攬 13.7K Star 的 **andrej-karpathy-skills**。同時另兩個項目爆發式增長：thedotmack 的 **claude-mem（46.1K⭐）** 解決 Claude Code 的"失憶症"；shanraisshan 的 **claude-code-best-practice（42.3K⭐）** 把 Skills、Hooks、Subagents 的配置體系整理成生產級模板。三件套各有分工，組合形成完整的 Claude Code 效率體系。

### Karpathy 四原則：給 AI 裝上"剎車"
andrej-karpathy-skills 本質做一件事：借四條規則，把 Claude Code 從"自信的初級程序員"調教成"謹慎的高級工程師"。

**原則一：Think Before Coding** —— 編寫任何代碼前，必須先用自然語言描述清楚打算做什麼、為什麼。解決"自信地犯蠢"。Claude 會先輸出思考過程（如：在 UserService 新增 validateEmail、複用 utils/regex.ts、不引入新依賴用項目已有 validator 庫，原因：保持一致性）。先"説出來"你再決定要不要"做出來"，方向偏一句話糾正，比改代碼快。

**原則二：Simplicity First** —— 針對"過度工程"：能 3 行別寫 30 行、能用現有工具別引入新依賴、能簡單實現別搞設計模式。作者體感碼量平均 -40% 而功能不變；之前動不動 Factory/Strategy 模式，現在老實寫 if-else 反而更清晰。

**原則三：Surgical Changes** —— 只改需要改的，不順手"優化"周圍代碼。修一個 bug 順手重構旁邊三行、牽扯另兩個模塊一測全錯——精準修改：改一行是一行，不碰不該碰的。

**原則四：Goal-Driven Execution** —— 執行中持續對齊目標，偏離原始意圖就停下確認。給列表加搜索框不會中途自作主張優化分頁。

**安裝**：`git clone https://github.com/forrestchang/andrej-karpathy-skills.git`，把項目裏的 CLAUDE.md 複製到項目根目錄即可。**侷限**：規則寫給獨自編碼的工程師；若你是 PM 或 SaaS 創始人，最貴的失敗或許不是"過度工程"而是"做錯了東西"（沒定義清楚用户痛點就開寫）——這缺口需自己填補。

### claude-mem：讓 Claude 擁有"長期記憶"
解決每次新會話記憶清零。核心流程：會話開始→注入最近 10 次會話上下文；輸入 Prompt→創建會話記錄保存提示；工具執行→自動捕獲觀察結果（Read/Write）；Worker 處理→通過 Claude Agent SDK 提取語義摘要；會話結束→生成總結備用。關鍵：不存原始對話（token 爆炸），用**語義壓縮**成結構化觀察存本地 SQLite；下次新會話檢索相關上下文只注入當前任務所需部分。據 DataCamp 測試每會話省 ~2250 token。

**三層檢索**：會話摘要層（最近 10 次概要，自動注入）；語義搜索層（MCP 工具按需檢索，`claude-mem://` URI 引用具體觀察）；文件夾上下文層（項目目錄自動生成 CLAUDE.md 含活動時間線）。

**安裝**：`npx claude-mem install`，或插件市場 `/plugin marketplace add thedotmack/claude-mem` → `/plugin install claude-mem`，重啓生效。首次較"飢渴"需學習項目，幾輪後穩定。**多機同步**：claude-mem-sync 借 SSH 同步觀察與摘要。**隱私控制**：雙標籤隱私系統，可標某些內容為私密不注入未來會話（處理 .env/密鑰必要）。

### Best Practice 倉庫：生產級配置模板
Karpathy Skills 是"行為校準器"、claude-mem 是"記憶系統"，shanraisshan 的 claude-code-best-practice 是完整配置藍圖（42.3K Star，Anthropic 黑客松獲獎者實戰配置）。

**四層配置體系**：
- L1 **CLAUDE.md** — 項目記憶（建議性）：技術棧、命名規範、目錄結構
- L2 **Skills** — 可複用工作流：代碼審計、品牌文案檢查
- L3 **Hooks** — 強制執行規則：禁止修改 .env、自動格式化
- L4 **Subagents** — 分工協作：代碼審查員、遷移專員

不少人把各類內容都往 CLAUDE.md 塞，文件越來越長，每次會話都讀一遍浪費 token。正確做法：CLAUDE.md 只放最核心項目信息並控制在 **150 條指令以內**，詳細流程放 Skills，安全規則放 Hooks，複雜任務交 Subagents。

**Hooks：不可逾越的紅線** —— Hooks 強制、CLAUDE.md 建議。CLAUDE.md 寫"不要修改 .env"Claude 大概率遵守但非 100%；Hooks 配 PreToolUse 在系統層攔截，Claude 連文件內容都看不到。示例 settings.json 用 PreToolUse matcher `Write|Edit` + command `echo 'Blocked' && exit 1`。也可在 settings.json 把敏感文件設 deny，比 Hooks 攔截更乾淨。

**Skills：可複用工作流** —— 2026 最重要功能升級之一，比舊 Commands 強大，支持附加文件、自動觸發、Subagent 執行。典型結構 `.claude/skills/quick-audit/`（SKILL.md / references/ / scripts/ / examples/）。核心特性自動觸發：在 SKILL.md 的 description 寫明觸發條件（如"當編寫或編輯內容文件時使用"），Claude 依上下文自動匹配執行。

**Subagents：讓 Claude 團隊作戰** —— 每個 Subagent 有自己的上下文窗口、工具權限、模型配置。實用模式"test time compute"：一個 Subagent 寫代碼、另一個同模型 Subagent 審查（獨立 context，審查者不被寫碼時的假設偏見影響）。示例 `.claude/agents/code-reviewer.md`（name / model / tools: Read,Grep,Glob；職責：發現 bug 和安全漏洞、檢查規範、不改代碼只給意見）。倉庫還有天氣 Agent 例子（預加載 Open-Meteo API 調用方式，主 Agent 委派而不在主上下文塞 API 文檔）。

**配置層級**：`~/.claude/CLAUDE.md`（全局個人，所有會話生效）→ 項目根目錄/CLAUDE.md（項目級）→ src/CLAUDE.md（目錄級，進入 src 時生效）。漸進式披露：全局保持精簡，細節按需加載。

### 上下文管理："隱形殺手"
上下文窗口非無限，每輪對話整個上下文重新處理；越長 Claude 表現越降（忘約定、重複錯誤、幻覺）。SmartScope 觀點：不是"堅持越久越好"，而是以"會話會被污染"為前提操作。

**三個關鍵操作**：① 勤用 `/clear`（感覺跑偏果斷清，重要信息 claude-mem 已存）② 主動 `/compact`（壓縮時告知保留內容，如 `/compact 保留 API 變更列表和已修改文件清單`；也可在 CLAUDE.md 加常駐指令"壓縮上下文時始終保留：完整修改文件列表和當前測試狀態"）③ 按上下文單元拆任務（會話1 需求分析+方案設計 Plan Mode → /clear → 會話2 核心實現 → /clear → 會話3 測試+清理）。

### 三件套整合：實戰配置方案（作者兩個月迭代）
**第一步 裝 Karpathy Skills**：`curl -o CLAUDE.md https://raw.githubusercontent.com/forrestchang/andrej-karpathy-skills/main/CLAUDE.md`，然後在 CLAUDE.md 末尾追加項目專屬配置（技術棧 React19+TS5+Tailwind4 / Zustand 不用 Redux / Node22+Fastify；命名規範 PascalCase 組件、camelCase 工具函數、UPPER_SNAKE_CASE 常量、kebab-case 文件；關鍵約束 API 響應 {success,data,error}、遷移放 src/database/migrations/、不引入新 UI 庫用已有 shadcn/ui）。

**第二步 裝 claude-mem**：`npx claude-mem install`，重啓，`npm run worker:status` 確認 Worker。首次幾輪學習項目，運行幾天起步速度明顯變快。

**第三步 配 Hooks 和 Subagents**：`git clone https://github.com/shanraisshan/claude-code-best-practice.git`。至少配：自動格式化 Hook（PostToolUse matcher `Write|Edit` → `npx prettier --write $CLAUDE_FILE_PATH`）；敏感文件保護（permissions.deny: `.env`, `.env.*`, `*.pem`, `*.key`, `credentials/*`）；code-reviewer Subagent（model claude-sonnet-4，tools Read/Grep/Glob，檢查是否遵循 CLAUDE.md 規範/bug/安全漏洞/多餘依賴/修改是否精準，只給意見不改代碼）。

**第四步 建立日常節奏**：每天開始→啓動 Claude Code→claude-mem 自動注入；新功能→Plan Mode 規劃→/clear→實現；修 Bug→精準描述→讓 Claude 先思考再動手；代碼審查→委派 code-reviewer Subagent；感覺跑偏→果斷 /clear→從 CLAUDE.md 重新開始；每天結束→關閉會話→claude-mem 自動生成總結。

### 效果對比（同一任務：給現有項目添加用户搜索功能）
| 指標 | 裸奔 Claude Code | 三件套配裝 |
|------|------|------|
| 新增依賴 | 3 個（lodash.debounce, react-select, fuse.js）| 0 個（複用已有）|
| 代碼行數 | 287 行 | 164 行（-43%）|
| 偏離原始需求的改動 | 5 處 | 0 處 |
| 需要人工修正次數 | 4 次 | 1 次 |
| 第二次會話是否記得上下文 | ❌ 完全不記得 | ✅ 自動注入 |

同樣的 Claude、同樣的模型，配置不同效果差距巨大。

### 一些誠實的補充
- Karpathy Skills 四原則對個人開發者夠用，但對產品團隊缺"做對的東西"（masteringproducthq.com 分析：至少 1/3 AI 輔助開發問題不是"代碼寫錯"而是"一開始就不該開發這個功能"）——CLAUDE.md 解決不了，靠你的產品判斷力。
- claude-mem 項目初期有"學習期"，前幾輪注入量大、token 偏高；語義搜索是否導致不同項目上下文"串台"——現有文檔看更像"對過去會話的快速搜索"，跨項目隔離需自行留意。
- Best Practice 倉庫全面也代表複雜；新手別一上來裝 30 Skills + 9 Hooks + 5 Subagents，從 CLAUDE.md + 一個 Hook + 一個 Subagent 開始逐步加。

### 寫在最後
Claude Code 的頂尖水準不在模型本身——同一個 Sonnet 4，未配置 vs 精調配置差距 ≥3 倍效率。Karpathy 四原則解決"行為規範"、claude-mem 解決"記憶持久化"、best-practice 解決"配置體系化"，三件套組合後 Claude Code 才從"工具"變"搭檔"。配置只是手段非目的，真正目的是讓你把時間花在需要人類判斷的地方，而非反覆糾正 AI 的低級錯誤。今天就能動手：先裝 Karpathy Skills，再裝 claude-mem，最後按需從 best-practice 倉庫挑配置，一個下午搭好基礎框架。

## Key Comments
（知乎文章，17 贊同；留言未抓取（login wall，全文亦由使用者 paste）。如需留言可日後補。）
