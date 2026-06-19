---
type: bookmark
para: resource
domain: ai-tools
title: "AI 一直忘記？我用 Obsidian + Claude Code 蓋了會自己長大的知識庫"
url: "https://www.youtube.com/watch?v=EhMKfG1dvnI"
summary: "AgentCrew Academy (Dustin) YouTube（24:14，中文）：用 Obsidian + Claude Code + kepano 官方 Obsidian skill 做跨專案知識庫，靠 wikilink 跨資料夾連線解決 AI 失憶/上下文爆滿；強調知識庫由 projects+pillars 慢慢長出、AI 主動讀寫連，一個字都唔使親手打。"
channel: "AgentCrew Academy"
published: 2026-05-12
duration: "24:14"
status: active
created: 2026-06-19
updated: 2026-06-19
related:
  - "[[Paula 寶拉 - Karpathy 筆記術 (Claude Code 個人知識庫)]]"
  - "[[杰森的效率工坊 - Karpathy LLM Wiki (Claude Code + Obsidian 進階)]]"
  - "[[karpathy - LLM Wiki gist]]"
tags:
  - bookmark
  - ai-tools
  - claude-code
  - obsidian
  - obsidian-cli
  - knowledge-management
  - cross-project
  - youtube
  - video
---

# AI 一直忘記？我用 Obsidian + Claude Code 蓋了會自己長大的知識庫

- URL: https://www.youtube.com/watch?v=EhMKfG1dvnI
- Channel: AgentCrew Academy（Dustin）・ 24:14 ・ 發佈 2026-05-12 ・ 18,647 views ・ 574 likes
- Saved date: 2026-06-19
- Topic: **跨專案** Claude Code 記憶／知識庫（Obsidian + kepano 官方 Obsidian skill/CLI）
- Status: active

## Why I saved this

三條 Karpathy/Obsidian 系列入面**最貼本 vault 實作**嗰條 —— Dustin **用緊 kepano `obsidian-skills`**（即本 vault 裝嗰個）+ Obsidian CLI，角度係**跨專案記憶**（解 Claude Code 開機失憶／上下文爆滿）。佢嘅 `projects + pillars + decisions + logs + weekly + personal + insight + bookmarks` 結構，同本 vault 嘅 `Projects/ + Bookmarks/ + log + 收工 workflow` 高度呼應；佢「**知識庫慢慢長出、唔好一次到位**」嘅務實態度亦同本 vault anti-over-engineering 一致。實用價值最高。

## Summary

- **問題**：Claude Code 上下文視窗有限（4.6 = 20 萬/100 萬 token），工具呼叫+思考 token 一塞就滿 → AI 失憶、亂答。傳統樹狀檔案各鎖喺單一 project 資料夾，跨 project 問「呢週有咩待辦」答唔到。
- **解法**：Obsidian 知識庫，靠 **wikilink 跨資料夾連線** → AI 讀到連結就跳去讀相關檔案，掌握全貌。Markdown 本機存、資料主權。
- **點建**：① 裝 Obsidian ② 叫 Claude「裝 Obsidian CLI」搭橋 ③ **計劃模式**：叫 Claude 調查電腦現有 Claude Code 專案、上網找用法、問你需求 → 出計劃你睇完先動手。
- **官方 skill**：kepano `obsidian-skills` → 打 `/obsidian` 叫 Claude 用 CLI 讀/寫/連知識庫，**唔會寫錯、唔使親手打**；亦可叫佢「按語義加 wikilink 雙向連線」。
- **務實**：由 `projects + pillars` 兩個起步，慢慢長出 decisions/logs/weekly/personal/insight/bookmarks。
- **外掛推薦**：Templater / Dataview / Tasks。Obsidian 需 ≥1.12.4（內建 CLI）。

## Key Takeaways（章節）

- 00:00 點解跨專案知識庫係 AI 時代必備　03:39 Step1 裝 Obsidian 建 vault
- 04:59 Step2 用 Claude Code **計劃模式**設計結構　10:47 Dustin 自己知識庫結構導覽
- 14:00 知識庫由 projects+pillars 慢慢長出　18:11 Claude 建出初始結構 + 自動連結
- 19:58 裝 **kepano 官方 Obsidian skill**（CLI 對話 vault）　22:46 外掛（Templater/Dataview/Tasks）　23:55 收尾

**工具連結**：Obsidian ≥1.12.4 https://obsidian.md ・ Claude Code https://claude.com/claude-code ・ kepano skill https://github.com/kepano/obsidian-skills ・ 課程 https://agentcrew.cc

## My Notes

- **三條對照**：Paula = 入門 flat；杰森 = skill 化 ingest/query/lint；**Dustin = 跨專案記憶 + 實戰結構演化**。三條合睇＝由淺到深 + 由「單庫整理」到「跨 project 記憶」。
- **同本 vault 直接重疊**：用緊**同一個 kepano obsidian-skills**、Obsidian 1.12.x、wikilink path-independent、log/週報（≈本 vault 收工 workflow）、Projects/Bookmarks。可作「外部驗證」本 vault 設計方向冇行錯。
- **可借鏡**：Dustin 嘅 `pillars`（生涯主軸）、`insight`（AI 每週睇工作模式）、`weekly` 主檔自動更新機制 —— 本 vault 未有等價物，或值得考慮（尤其 weekly 回顧 + 主檔進度自動同步）。
- **抓取**：人手繁體字幕（zh-TW-…）→ yt-dlp chrome cookies 攞到，~8.5k 字。

## Related
- [[Paula 寶拉 - Karpathy 筆記術 (Claude Code 個人知識庫)]] —— 入門版
- [[杰森的效率工坊 - Karpathy LLM Wiki (Claude Code + Obsidian 進階)]] —— skill 化進階版
- [[karpathy - LLM Wiki gist]] —— 原始理念
- [[Bookmarks]]

<!-- ===== ARCHIVE BELOW — 全文 snapshot（yt-dlp zh-TW 人手字幕，2026-06-19），掃描/triage 時可跳過 ===== -->

## Full Content (archived)
> 來源：YouTube **人手繁體字幕**（zh-TW，yt-dlp `--write-sub` 2026-06-19 HKT，已去時間碼/去重）。原片普通話、字幕為作者上載，準確度高。

好。各位朋友大家好，我是 Dustin。今天我們的影片會稍微長一點，因為我們今天要去介紹我自己在管理跨專案的時候的一個系統。我用的是 Obsidian。在開始示範之前，我想用 90 秒讓你知道為什麼要做這件事，這樣你裝的時候才會知道每一步在解決什麼問題。

首先複習「上下文」：每個 AI 模型都有上下文視窗容量（Claude 4.6 是 20 萬 token 或 100 萬 token）。聽起來很多，但實際工作時除了模型回答，還有中間呼叫的工具、自己思考所用的 token，所以上下文會慢慢滿。一旦接近滿，AI 表現明顯下降——會忘記前面講過的事、開始亂答。所以最重要的能力就是上下文管理：剛好不多不少塞給他需要的東西。於是你會把長久需要的資訊寫成文件（工作模板、常見 SOP、專案進度），下次開工就立刻知道之前做到哪。

但傳統檔案是樹狀結構，文件侷限在一個專案資料夾裡。當你用 Claude Code 管理很多個專案時，專案之間可能有連線（A 專案一部分跟 B 專案共用同一套資訊）。例如你問 AI「我這週有哪幾個專案、哪些待辦沒做」，如果 AI 只停在其中一個專案資料夾，就不知道其他專案的背景。Obsidian 作為知識庫最好的是：它有傳統樹狀結構，但也開放了 **wikilink**，讓文件之間就算不在同一層級也能互相連線，AI 讀到連線就跨過去讀相關文件，更有效掌握全貌。另外 Obsidian 檔案都是 Markdown 存在本機，你有資料主權；就算 Obsidian 倒了你也能把資料帶走（不像 Evernote/Notion 存在別人雲端）。它社群成熟、開源外掛多（可變資料庫、待辦儀表板、專案管理系統），非常自由。

接下來示範我自己的方式（只是其中一種，建議你探索自己的）。第一步：上網搜尋 Obsidian 安裝。第二步：來到 Claude Code，跟他講「請幫我安裝 Obsidian CLI」。CLI（command line interface 命令列介面）讓我們用一串指令做到跨平台、跨服務的指揮對話——讓 Claude Code 可以用這串語言去跟 Obsidian 對話：寫入、修改、讀取知識庫。你要幫它建這座橋。

Obsidian 剛進來是空的，點建立，示範做一個 test，放在你未來找得到的位置。在這個 test 資料夾裡開啟 Claude Code，**開啟計劃模式**之後跟他講：「這個資料夾是用來做我的跨專案管理知識庫。請你調查我電腦裡所有使用 Claude Code 的專案背景，然後上網找結合用法，並問我需求的問題，幫我規劃知識庫的計劃。」下指令的關鍵三招：① 請他去讀跟你目標相關的資料 ② 請他上網找用法 ③ 請他問你問題。計劃模式的好處是他不會直接動手——他會上網找到跟你狀況類似的最佳用法，給你看計劃，你看懂了再讓他動手。

我的知識庫真實結構（隱私部分用模擬庫講解）：第一層主軸放生涯目標、待辦總和、每週例行（週報、本週進度、下週要做）、每天要做的事；個人相關資訊（稅務策略、家人 schedule、財務狀況與規劃）；生涯主軸（GMAT 教學、Claude Code 教學課程、AI 個人顧問生涯）；一個「日誌」地方（每完成一個任務就請 Claude 自動寫進日誌）；每週回來反省的「週報」（請 Claude 整理本週日誌：花多少時間在每個任務、每個專案進度、下週推進）；具體在推進的專案；以及平常看到的網路書籤（跟某些專案有關，先存下來）。

你說「這不就是樹狀結構嗎？」其實不一樣——因為每個檔案我都可以再加連結、加標籤（這檔案跟課程計劃有關、跟個人財務有關、跟家人 schedule 有關）。當 AI 讀到這些檔案，就會根據這些連線自動連到相關專案或生涯，更進一步了解全貌。傳統樹狀他讀這檔案不會知道跟其他子資料夾某文件有關係；加上 wikilink 連成一張網後，他讀某檔案就會知道跟其他檔案的關聯、連過去讀，找到更精準的上下文。

回看初始設定進度：開計劃模式、請他上網搜尋、看專案背景、問你問題——他派出好幾個 agent 去搜尋，發現電腦裡已有知識庫、有哪些活躍專案，問我定位是什麼（純測試），問對這些 Claude Code 專案要做到什麼程度（總覽 dashboard／知識索引／拉重要記憶／每天進度整合），我選 Index Only。看不懂可選 check with me 繼續討論，他就給一個完整計劃。

讀的路徑：第一層有 CLAUDE.md，AI 找知識庫內容時優先讀它。這檔案不是給你自己看，是給 AI 看——告訴 AI 知識庫主人是誰、名字叫 My Vault、結構長什麼樣（每週狀態、生涯目標：事業線/技能線/生活線，生活線在 Pillars 下有健身計劃、課程業務等）。每一個（如健身計劃）裡都有待辦、目前狀態、最近進展、專案、阻擋、工具、書籤。單一計劃與生涯主線透過 wikilink 連線（如 L2 Phase 1 交付連回課程業務）。每天的地方記：今天要推進什麼、已做什麼、日誌、新想法、明天要做、個人能量記錄。所以任何時候你問 AI「我昨天做了哪些、某專案進度怎樣」，AI 可回去找日誌並結合專案背景與更大連線背景給完整回答，不會每次開啟都像完全忘記。

他幫我們做的計劃：整合所有專案狀態的 dashboard、抽出固定 pattern／已有決定／過去 debug 經驗建立檔案。結構跟我個人的不太一樣（我選的是管理專案重要資訊：決定、過去錯誤、跨專案共同模式），因為 Obsidian 只是平台/工具，裡面結構要靠你去探索（請他調查、上網找、問你問題三招）。

你一定要一開始就做得這麼完整嗎？更務實的做法是——知識庫是慢慢長出來的。誠實分享：我一開始只有 projects（記每個專案背景）和 pillars（連到生涯主線）兩個。後來發現有些背景會階段性變化（突然做了什麼決定），就加了 decisions。後來想看前天/每週做了什麼，加了日誌（以天為單位）。日誌太零散，就每週整理一次，加了週報。發現 projects/pillars 主檔一直不動，就加了機制：每週更新週報時請 AI 根據日誌跟週報回來更新主檔進度。用得越深，加了 personal 管理個人生活；加了 insight 讓他每週看我工作模式給指教；又加了書籤存有價值但還沒進計劃的東西。所以完整結構不是一開始就做好，是慢慢探索。

回到 Claude Code，它已幫你建好初始東西：patterns（過去事情的共同點）、decisions（未來重要決策）、每個 project 背景（部落格、做音樂專案、教學專案…），並在關聯地方按語義互相連線。之後每次有更新就請 Claude 寫進知識庫。維護會不會很困難？老實講——不是你來讀，大部分由 AI 來讀；連線也不是你來建，你直接跟 AI 講「請按語義判斷哪些檔案有關係，幫我加 wikilink 雙向連線」就可以。連線加好加足，AI 讀每個檔案時就清楚它跟其他檔案的邏輯關聯、連過去讀，在恰好時刻讀到恰好多的上下文，跟你互動越來越同步。

怎麼寫入/讀取？跟他講「請幫我上網找官方的 Obsidian skill 並安裝、接好」。Obsidian 官方出了一個教 AI 怎麼操作 Obsidian 的 skill（kepano）——裡面都是寫給 AI 看的：用什麼指令跟 Obsidian 用 CLI 對話、寫多行怎麼換行、指定讀寫某檔案怎麼表示路徑/檔名、常用模式、怎麼建立標準 Obsidian 筆記、放 PDF/圖片/連線的方法。裝進 Claude Code 後，你只要打斜線 `obsidian` 再講你想做的事（「讀知識庫找這專案背景」「看昨天進度」「寫入今天日誌」「重整 Obsidian」），Claude Code 就會按這本書教的操作方式跟 Obsidian 溝通，不會寫錯。你永遠不用親自寫。同樣，想建立關聯就跟他講「請按意思在檔案之間建立合理關聯」，他會幫你拉連結。

所以我的 Obsidian 知識庫從建立到現在，我沒有親自打過一個字，全部 AI 幫我建立、記錄、讀取。幫助非常大——AI 可以知道我做過什麼、昨天/上禮拜做什麼、專案最近進到哪、這專案客戶跟另一專案的人認識、他們有共同淵源。他再也不會忘記，不會有我的記憶領先於他的情況。這時你的跨專案管理才算真的成熟。

補充：到 Obsidian 設定的第三方外掛可搜尋社群外掛（近 3,000 個）。我自己裝了模板外掛（Templater，設計模板後他寫新筆記就按模板走）；處理資料相關可裝 Dataview（變資料庫功能）；做專案/待辦管理可裝 Tasks（跨文件跨專案跨資料夾管理待辦）。不知道裝哪些可直接問 Claude Code「比較熱門的外掛你判斷我需要哪些？不清楚可問我、上網找、讀我目前文件」，討論後他會解釋你需要哪些，看不懂叫他用白話文說明。Obsidian 已融入我生活的一部分，一時要分享千頭萬緒。有問題歡迎留言、加社團、訂閱頻道。我是 Dustin，我們下次見。

## Key Comments
（YouTube 留言未抓取 —— 需 `yt-dlp --write-comments`（慢、易撞 bot-wall）。教學 reference，留言非必要；如需可補。）
