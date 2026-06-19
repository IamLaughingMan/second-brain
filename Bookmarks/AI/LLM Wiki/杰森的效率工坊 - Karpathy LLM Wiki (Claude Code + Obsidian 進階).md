---
type: bookmark
para: resource
domain: ai-tools
title: "硅谷顶尖 AI 大佬如何搭建个人AI知识库？从0开始用Claude Code + Obsidian搭建Karpathy的LLM Wiki知识库"
url: "https://www.youtube.com/watch?v=CTyx5XF2KVA"
summary: "杰森的效率工坊 YouTube（14:23，中文）：進階實作 Karpathy LLM Wiki —— 三層架構 + 三核心操作（ingest/query/lint）做成 agent skill，CLAUDE.md 立規、Obsidian CLI 省 token、配套 GitHub repo。比入門版深入。"
channel: "杰森的效率工坊"
published: 2026-04-14
duration: "14:23"
status: active
created: 2026-06-19
updated: 2026-06-19
related:
  - "[[Paula 寶拉 - Karpathy 筆記術 (Claude Code 個人知識庫)]]"
  - "[[karpathy - LLM Wiki gist]]"
tags:
  - bookmark
  - ai-tools
  - claude-code
  - obsidian
  - karpathy
  - llm-wiki
  - agent-skill
  - youtube
  - video
---

# 硅谷顶尖 AI 大佬如何搭建个人AI知识库？(Karpathy LLM Wiki 進階)

- URL: https://www.youtube.com/watch?v=CTyx5XF2KVA
- Channel: 杰森的效率工坊 ・ 14:23 ・ 發佈 2026-04-14 ・ 25,417 views ・ 566 likes
- Saved date: 2026-06-19
- Topic: Karpathy LLM-wiki **進階**實作（skill 化 ingest/query/lint + Obsidian CLI）
- Status: active

## Why I saved this

同樣係 Karpathy LLM-wiki 法，但比 [[Paula 寶拉 - Karpathy 筆記術 (Claude Code 個人知識庫)|Paula 入門版]]**深入好多**，而且**多處同本 vault 現狀重疊**：提到 `CLAUDE.md` vs **`AGENTS.md`**（OpenCode 用，正好對應本 vault 啱啱整嘅 AGENTS.md）、**Obsidian CLI 省 token**（本 vault 有 obsidian-skills）、`syntheses` 頁型（本 vault 用 `synthesis` type）、skill 化三操作。值得對照本 vault 已實現/未實現嘅部分。配套 GitHub repo 可下載成套 skill。

## Summary

- **三層架構**：① 原始資料層（raw，分 articles/papers/transcripts）② Wiki 層（concepts/entities/sources/**syntheses** + index + log）③ schema 規範層（`CLAUDE.md` / OpenCode 用 `AGENTS.md`）。
- **三核心操作（做成 agent skill）**：`ingest` 攝取（raw→編譯 Wiki）、`query` 查詢（先讀 index→深讀→答→好答案存回 syntheses，知識復利）、`lint` 巡檢（孤島筆記/死鏈/矛盾/過時，生報告待 user 確認先改）。
- **進階位**：用 Anthropic 官方 **Skill Creator** 幫手寫 skill；集成 **Obsidian CLI** 降 token；片中用 Kimi K2.5 model 經 Claude Code 轉接。
- **避坑**：token 消耗極高要留意；**AI 幻覺會被存入知識庫並無限放大**。卡帕西自稱喺 ~40 萬字知識庫運行良好。

## Key Takeaways（章節）

- 00:00 點解傳統 RAG 唔好用 / LLM Wiki 係咩　01:16 三層架構 + 三核心 AI 操作
- 02:58 Obsidian 建基礎文件結構　04:44 配置 CLAUDE.md 立規
- 05:40 Web Clipper 收料　06:17 **Ingest** 全自動寫 Wiki
- 09:01 **Query** 提問並沉澱新知　10:55 **Lint** 查孤立筆記/死鏈
- 12:22 配 Obsidian 官方 CLI 省 token　13:02 避坑（token/幻覺）　13:58 總結 + 開源資料

**配套**：GitHub repo `jason-effi-lab/karpathy-llm-wiki-vault`（整套 skill + CLAUDE.md + 知識庫結構可下載）。

## My Notes

- **vs Paula 入門版**：Paula 示範 flat raw+wiki、3 頁型、純對話 ingest；呢條把三操作**skill 化**（`/ingest` `/query` `/lint`）、加 raw 子分類 + archive + syntheses + Obsidian CLI。更接近本 vault 嘅成熟度。
- **同本 vault 對照**：本 vault 已有 `AGENTS.md`、`synthesis` type、obsidian-skills(含 obsidian-cli)、index/log/dual-log、lint 概念（CLAUDE.md「Lint & Maintain」）。呢條 repo 嘅 skill 可能值得**借鏡或 ingest**（佢把 ingest/query/lint 寫成正式 SKILL.md，本 vault 而家係 Claude 手動執行 + native hook，無 project skill）。
- **可跟進**：`jason-effi-lab/karpathy-llm-wiki-vault` 內嘅 skill 寫法 vs 本 vault `[[skills]]` catalog（現 project skill = 0）—— 如想 skill 化操作可參考。

## Related
- [[Paula 寶拉 - Karpathy 筆記術 (Claude Code 個人知識庫)]] —— 同主題入門版
- [[karpathy - LLM Wiki gist]] —— 原始 Karpathy gist
- [[Bookmarks]]

<!-- ===== ARCHIVE BELOW — 全文 snapshot（yt-dlp zh-Hant 人手字幕，2026-06-19），掃描/triage 時可跳過 ===== -->

## Full Content (archived)
> 來源：YouTube **人手繁體字幕**（zh-Hant，yt-dlp `--write-sub` 2026-06-19 HKT，已去時間碼/去重）。原片普通話、字幕為作者上載繁體，準確度高。

前OpenAI聯合創始人AI大神卡帕西最近提出了他的個人AI知識庫理念LLM Wiki，他摒棄了傳統的RAG轉向了一套極簡的LLM Wiki系統。今天我們就用Claude Code和Obsidian來實現卡帕西的這套系統，我們會親手創建三個skill，配置Claude.md文件，然後讓AI智能體為我們構建一整套Wiki架構。我會把所有用到的skill配置文件以及整個知識庫都打包上傳到我的GitHub上供大家下載。

首先卡帕西的理念到底是什麽？簡單來說就是把要學習的資料和文章通過AI智能體（比如Claude Code）轉換成Wiki形式的Markdown筆記庫，那最好的實現就是Obsidian。然後在這個編譯後的筆記庫中利用AI進行持續的學習與探索，把每次學習和總結的重要內容再次積累到知識庫，實現知識的復利。同時對筆記庫進行定期的維護和體檢保持系統健康。傳統的RAG系統每次問答都是重新搜索知識庫，沒有任何記憶和積累；而LLM Wiki則是持久化的維護一個知識庫，這也是智能體時代個人AI知識庫的必然形式。

卡帕西的理念簡單來說就是三層架構外加三個核心操作。三層架構：首先原始資料層，就是我們平時收集或策劃的文檔集合，包括剪藏的網絡文章、要學習的論文文獻、轉錄的YouTube視頻等等，卡帕西列舉的主要工具就是Obsidian Web Clipper。第二層則是Wiki層，也就是AI智能體對原始資料進行深入分析後生成的Markdown文件目錄，包含摘要、實體、概念、對比分析等，同時還包含索引與日誌文件。第三層就是schema架構規範，實際上就是智能體工具的配置文件，比如你使用Claude Code那麽就是CLAUDE.md，使用OpenCode就是AGENTS.md，作用是告訴智能體工具具體的工作流程和規範。整個架構的實現實際上就是智能體工具加Obsidian，我們今天用的是Claude Code加Obsidian，在Obsidian中使用Claudian插件集成Claude Code。

三個核心操作分別是ingest攝取、query查詢、lint巡檢。ingest攝取就是讓智能體把原始資料充分消化並編譯成Markdown格式的Wiki筆記庫。query查詢就是由你對AI進行提問，從而對知識庫進行深入的學習，並把學習整理的內容積累到知識庫中。而lint巡檢則是對知識庫架構的維護，包括雙向鏈接的關聯、數據空白的填補、孤立頁面的發現等等。這三個操作我們會做成3個agent skill。

接下來正式上手：在電腦端創建一個空白的項目文件夾，然後分別創建raw、Wiki和assets三個子文件夾。raw就是原始資料的收集層（類似inbox），裏面創建子文件夾分類，分別存放網頁剪藏的文章、專業的論文文獻和研報、視頻和播客的轉錄文章等等；另外創建一個archive文件夾，資料被分析完畢後會歸檔到archive。Wiki文件夾內要創建索引文件index.md和日誌文件log.md，然後創建子文件夾：concepts存放方法論、entities存放實體概念、sources存放針對原始文件一對一提煉出來的摘要、syntheses存放你用AI進行深度學習與探索後保存下來的知識積累。assets存放媒體資源（圖片和附件），在Obsidian設置中把附件文件夾路徑設為assets。

用Obsidian打開文件夾，打開Claudian插件或直接用Claude Code，輸入/init初始化命令，Claude Code就會創建一個CLAUDE.md配置文件以及.claude文件夾（如果用OpenCode創建的就是AGENTS.md，原理一樣）。打開CLAUDE.md把自動生成的英文內容刪掉，按需求寫入中文約束。CLAUDE.md主要約束：① 目錄結構的權限邊界（三個文件夾用途 + 智能體編輯權限）② Wiki文件夾生成內容的規範、index與log的格式 ③ 生成Markdown筆記的規則。這個CLAUDE.md對應的就是卡帕西理念中的Schema架構規範層。

然後做深入學習：在瀏覽器安裝Obsidian Web Clipper，設置保存路徑為知識庫raw/articles子文件夾。以「AI提示詞工程」這個領域為例（收藏了Gemini提示詞策略、谷歌提示詞工程白皮書、經典5C架構提示詞框架論文）。執行第一步知識攝取：在.claude/skills文件夾裏創建Ingest文件夾，新建skill.md，開頭yaml元數據加name和description，然後撰寫正文（觸發邏輯、執行步驟、約束注意事項）。這個skill是用Anthropic官方GitHub倉庫的Skill Creator來幫忙寫的——你只需把需求告訴智能體，它就會調用skillCreator幫你創建。或者直接來我GitHub下載整個知識庫。整個流程就是讓智能體深入分析原始文件、整理並撰寫Markdown文件、建立雙向鏈接、更新index和log，最後把原始文件移動到archive。

在智能體窗口輸入/ingest觸發skill流程（這裏在Claude Code裏轉接的是Kimi K2.5模型；卡帕西也說用Codex或OpenCode都可以，原理一樣）。提醒：大規模文件讀寫非常消耗token。智能體分析後撰寫對應Markdown、更新index和log、把原始文件歸檔到archive，並列出任務列表（創建的文件、核心知識發現、重要標註）。打開知識圖譜可見提示詞工程相關概念都被創建並建立雙向鏈接。

第二步query：創建第二個skill（較簡單）——要求AI回答問題前永遠先讀index.md定位，然後深度閱讀目標文件並回答；如果生成有價值內容要詢問用戶是否保存到知識庫（LLM Wiki核心理念：知識不斷積累進化、實現復利），並規定保存回知識庫時遵循的規範和模板。例如提問「結合5C提示詞框架為我設計一個用於撰寫Markdown知識筆記的提示詞」，智能體回復詳盡（5C框架提示詞+使用案例）並詢問是否保存，確定後保存到Wiki/syntheses，建立雙向鏈接並更新index和log。你還可以讓智能體挖掘知識點矛盾、探索知識盲區、做戰略規劃，或用Obsidian生成marp幻燈片、Canvas結構圖、Excalidraw圖表。

第三步lint巡檢：隨知識庫變大需定期維護體檢——檢查頁面矛盾、被新資料取代的老舊信息、沒有雙向鏈接的孤島筆記、死鏈、缺乏獨立頁面的重要概念。在skills文件夾創建lint skill，要求優先讀index和log、掃描整個知識庫後生成檢查報告並給出修復計劃（加約束：只生成報告，用戶確認後才修改，不自行改筆記）。輸入/lint，智能體掃描並生成報告（未同步的索引、多個死鏈、知識沖突）並列出行動計劃。

上述是最簡單入門級實現，還可擴充：集成Obsidian CLI工具（卡帕西文章也建議用CLI輔助AI更高效操作Wiki，可大大降低token消耗並提升準確性），在三個skill中加入技能鏈約束智能體檢索時使用Obsidian CLI skill。卡帕西表示自己在40萬字左右的知識庫中這套理念運行得非常良好，持續進化和積累特別適合中小團隊和個人做深度學習研究；除非你是企業級非常龐大的知識庫，否則RAG永遠只是現用現搜的冷冰冰機器。

核心理念描繪的是智能體時代個人知識管理的必然形態：人類只做高價值的信息篩選與戰略提問，AI接管所有繁瑣的節點編織。兩個注意事項：① 注意token消耗（智能體對token消耗非常高）② 注意AI幻覺問題——如果大模型某次處理產生幻覺，錯誤同樣會被保存到知識庫，未來的學習和推理都會以此為基礎導致錯誤被無限放大。視頻筆記可來個人網站下載，整個知識庫（含提示詞工程原始資料）打包上傳到GitHub，倉庫地址在視頻描述中。

## Key Comments
（YouTube 留言未抓取 —— 需 `yt-dlp --write-comments`（慢、易撞 bot-wall）。教學 reference，留言非必要；如需可補。）
