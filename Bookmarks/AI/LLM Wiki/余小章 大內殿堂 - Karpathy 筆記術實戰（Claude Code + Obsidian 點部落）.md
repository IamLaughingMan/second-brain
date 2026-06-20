---
type: bookmark
para: resource
domain: ai-tools
title: "通過 AI Agent + Obsidian 建立個人知識庫：Karpathy 筆記術實戰"
url: "https://dotblogs.azurewebsites.net/yc421206/2026/04/19/building_a_personal_knowledge_base_via_ai_agent_and_obsidian_karpathy_note_taking_in_practice"
author: "余小章 @ 大內殿堂（點部落 dotblogs）"
published: "2026-04-19"
status: active
created: 2026-06-21
updated: 2026-06-21
related:
  - "[[Karpathy LLM Wiki Pattern]]"
  - "[[karpathy - LLM Wiki gist]]"
  - "[[LLM Wiki]]"
tags: [bookmark, llm-wiki, karpathy, obsidian, claude-code, tutorial, windows]
summary: "余小章（點部落）hands-on 實作教學——Windows 11 + Obsidian + Claude Code + Obsidian Clipper，由零建 Karpathy LLM Wiki：raw/wiki/index/log/Claude.md 架構、no-RAG、Step 1–5（裝工具→用 gist prompt 初始化→clip 入 Raw→ingest→Graph view 看成果），頁型 Concepts/Entity/Source。"
---

## Summary

余小章（@ 大內殿堂，點部落）嘅 **hands-on 實作教學**：用 **Claude Code + Obsidian** 由零建 Karpathy LLM Wiki，一步步走過環境建置到 ingest 文章。cluster 中**少有嘅 Windows 視角**＋最具操作步驟（Step 1–5）嗰篇，同杰森文字版互補。

## Key Takeaways

- **環境**：Windows 11 + Obsidian + Claude Code（付費）+ Chrome Obsidian Clipper
- **架構（同本 vault 一致）**：`Raw`（收件匣）／`Wiki`（AI 整理）／`Index`（目錄導航）／`Log`（動作日誌）／`Claude.md`（操作手冊靈魂）—— **不切塊、無向量庫，純 Markdown + 目錄**
- **Step 1–5**：① 裝工具（`scoop install obsidian`…）② 建 Vault → 喂 Karpathy gist URL 畀 Claude Code 初始化架構 ③ Obsidian Clipper 收文章入 `Raw` ④ 落令「ingest」AI 自動拆 Concepts/Entity、建頁、雙向連結、更新 Index/Log ⑤ Graph view 睇成果
- **頁型**：Wiki 內容分 **Concepts / Entity / Source** 三種（同本 vault `type` 系統呼應）
- **進階**：跨文章提問／找 Knowledge Gaps／自動搜尋補洞；**好答案存回 Wiki**（Karpathy 強調）
- **心得限制（誠實）**：CC 要付費；30 篇 ingest 約 10–15 分鐘；~100 篇最佳，要處理幾萬份仍需真 RAG；庫越大每次查詢 Token 成本越高；作者選 Obsidian + GitHub 同步（唔淨係本地，防失）

## My Notes

cluster 中**最 step-by-step 嘅實作篇**，亦係**唯一明確 Windows 視角**（`scoop` 裝法）。內容貼足本 vault 模型（raw/wiki/index/log/Claude.md、no-RAG、~100 篇規模、Concepts/Entity/Source 頁型）但**無超出** [[Karpathy LLM Wiki Pattern]] spec → 純 reference／實作入口，**唔增強 spec**。同 [[杰森 - Karpathy LLM Wiki 完整實作指南 (Claude Code + Obsidian 文字版)]] 互補（杰森偏概念完整、本篇偏逐步截圖操作，惜截圖係 base64 內嵌、存檔保留唔到）。

## Related

- [[Karpathy LLM Wiki Pattern]] — 本 vault 方法論 spec
- [[karpathy - LLM Wiki gist]] — Karpathy 英文一手 gist（本篇 Step 2 直接喂佢初始化）
- [[杰森 - Karpathy LLM Wiki 完整實作指南 (Claude Code + Obsidian 文字版)]] — 另一中文文字實作
- [[LLM Wiki]] — 本夾 cluster hub

<!-- ===== ARCHIVE BELOW — full article, not for quick scanning ===== -->

## Full Content (archived)

> 來源：`dotblogs.azurewebsites.net`（點部落；defuddle 抽取）。正體中文，無需 s2hk。**注意**：原文 5 張步驟截圖係 base64 內嵌（佔原始 ~24KB），按 cleanup 標準剝走（存檔保留唔到截圖，但文字步驟＋code block 完整）；尾部 MVP badge／footer 噪聲亦已 trim。

你是否曾讀過一篇文章覺得很重要，但兩週後卻想不起來在哪看過？或者辛苦存了書籤、截圖，一個月後打開卻不知從何看起？更常見的問題是，文章 A 和文章 B 提到了同一個概念，但因為存在不同地方，你根本沒發現它們的關聯。

最近 OpenAI 共同創辦人、前 Tesla AI 總監 **Andrej Karpathy** 在 X 上分享了解決這個問題的方法，在網路上引起廣大回響。他的作法很簡單：把文章丟給 AI，AI 讀完後自動整理成一個 Wiki 知識庫，包含總結、目錄以及相關概念的連結，全部以 Markdown 檔案的形式存在你的電腦裡。

這篇文章我想要演練「用 Claude Code 建立這套個人知識管理系統」，從環境建置到實際 ingest 文章，一步一步帶大家走過去。

## 開發環境

- Windows 11 Pro
- [Obsidian](https://obsidian.md/) ，安裝可以參考上篇 [透過 Graphify 建立專案知識庫 | 余小章 @ 大內殿堂 - 點部落](https://dotblogs.com.tw/yc421206/2026/04/14/build_project_knowledge_base_via_graphify)
- AI Agent 這裡我用 [Claude Code](https://claude.ai/code) （需付費訂閱）
- Chrome 擴充功能： [Obsidian Clipper](https://chrome.google.com/webstore/detail/obsidian-web-clipper)

---

## 核心概念

在動手之前，先了解這套系統的架構，不然做到一半會不知道自己在幹嘛。

整個知識庫就是一個 Obsidian Vault，裡面有幾個核心元素：

- **Raw（原始資料夾）** ：就像收件匣，文章、PDF 等素材先放這裡
- **Wiki** ：AI 整理好的內容放這，每頁都有總結、標籤和連結
- **Index（目錄）** ：Wiki 裡的關鍵導航，列出所有頁面與分類；AI 查詢時先看目錄，就算有幾百頁也能保持快速
- **Log（日誌）** ：記錄 AI 的所有動作，方便追溯，也避免重複作業
- **Claude.md** ：給 AI 看的操作手冊，定義了專案內容、資料整理和寫作規則（每次打開 Claude Code 它都會先讀這份檔案）

這套系統與傳統 RAG（Retrieval-Augmented Generation）最大的不同在於， **它不需要將文章切塊、不需要向量資料庫和相似度搜尋** ，只靠 Markdown 檔案和目錄就能運作。

Karpathy 本人用這種方式整理了約 100 篇文章，原本以為會需要 RAG，但發現讓 LLM 自己維護目錄就夠了。只有存在本地端太危險了，這裡我選擇用 Obsidian + github 同步資料。

---

## 實作

### Step 1：安裝工具

1. 下載並安裝 **Obsidian** `scoop install obsidian`
2. 依照官方教學安裝 **Claude Code**
3. 在 Chrome 安裝並釘選 **Obsidian Clipper** 擴充功能

### Step 2：建立 Vault 並初始化架構

打開 Obsidian，點擊「Create」建立新的 Vault，自訂名稱（這裡我用 `DEMO` ），並選擇儲存路徑。

接著開啟終端機，切換到剛建立的資料夾路徑，輸入 `claude` 啟動 Claude Code：

```
mkdir ~/Documents/DEMO
cd ~/Documents/DEMO
claude
```

前往 Karpathy 在 [GitHub Gist](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) 上提供的提示詞

```
https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
根據上述連結，建立整個知識庫架構並說明我接下來要怎麼使用
```

確認 AI 建立的計劃書是否可行

確定可以，繼續往下

==NOTE：claude.md 是整個系統的靈魂，AI 每次啟動都會先讀它，所以架構若有自訂需求，修改這裡就對了。==

### Step 3：用 Obsidian Clipper 收集文章

1. 在瀏覽器開啟你想收集的文章
2. 點擊右上角的 **Obsidian Clipper** 擴充功能
3. 將儲存的資料夾（Folder）欄位改為 **Raw**
4. 點擊「Add to Obsidian」

### Step 4：讓 AI 消化文章（Ingest）

確認文章都進入 `Raw` 資料夾後，回到 Claude Code 下達指令：

```
Raw 資料夾裡有新文章，消化（ingest）它們
```

AI 接著會自動：

1. 讀取 Raw 資料夾裡的文章內容
2. 拆解概念（Concepts）與實體人物（Entity）
3. 在 Wiki 資料夾建立對應頁面，並加上總結、標籤
4. 為不同頁面之間建立雙向連結
5. 更新 Index 總目錄與 Log 日誌

### Step 5：查看成果

處理完成後，回到 Obsidian：

- **Graph view（關聯圖）** ：可以看到 AI 自動為不同文章建立的共同節點
- **Wiki 資料夾** ：內容已分類為 Concepts / Entity / Source 三種頁面，彼此互相連結

---

## 進階應用

建立好知識庫後，還可以這樣用：

- **跨文章提問** ：直接問 AI「這兩篇文章的共同觀點是什麼」，它會綜合所有 Wiki 頁面回答
- **找出知識漏洞（Knowledge Gaps）** ：請 AI 告訴你哪些領域內容太薄弱，建議補充哪類文章
- **自動補充資料** （進階）：讓 AI 執行搜尋，抓取外部資料來填補漏洞

==NOTE：每次向 AI 提問，你可以把它的回答存回 Wiki，讓知識庫隨著使用越來越豐富。這是 Karpathy 特別強調的一點。==

---

## 心得

優點：

- 設定簡單，幾乎不需要自己維護
- 不需要向量資料庫，純 Markdown 就能運作
- 知識會自動建立跨文章連結，發現過去看不到的關聯

缺點：

- Claude Code 需要付費
- 處理 30 篇文章需要等 10～15 分鐘
- 有規模限制，約 100 篇文章是最佳狀態；若要處理幾萬份文件，還是需要真正的 RAG 系統
- 知識庫越大，每次查詢讀取目錄與頁面的 Token 成本也會增加

如果你有興趣，可以先丟兩三篇文章進去試試看，感受一下。

若有謬誤，煩請告知，新手發帖請多包涵

## Key Comments

留言未能抓取（點部落留言區動態載入；未能確認原文留言數）。
