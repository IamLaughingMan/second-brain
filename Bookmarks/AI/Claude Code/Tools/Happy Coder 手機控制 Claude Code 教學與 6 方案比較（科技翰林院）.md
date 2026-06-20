---
type: bookmark
para: resource
domain: claude-code
title: "Happy Coder 是什麼？Claude Code 手機控制教學與 6 方案比較"
url: "https://www.techhanlin.tw/happy-coder-claude-code-mobile/"
author: "科技翰林院（techhanlin.tw）"
published: "2026-04-05"
status: active
created: 2026-06-21
updated: 2026-06-21
related:
  - "[[Happy Coder 手機遠端操控 Claude Code（什麼值得買）]]"
tags: [bookmark, happy-coder, claude-code, mobile, comparison, security, tutorial]
summary: "科技翰林院深入長文——Happy Coder 是什麼、安裝三步、實測心得，並橫向比較 2026 年 6 種手機操控 Claude Code 方案（官方遠端控制／聊天平台串接／任務派發／一鍵傳送／SSH+tmux／Happy Coder），作者結論推 Happy Coder。含三層加密架構解說、資安誠實評估、FAQ、參考資料。"
---

## Summary

科技翰林院（techhanlin.tw）嘅 Happy Coder 深入教學＋比較長文。先講 Claude Code 同聊天版 Claude 點解唔同，再橫向比較 **2026 年 6 種手機操控 Claude Code 方案**，作者每日實際用 Happy Coder（整合最完整、免費開源）。涵蓋安裝三步、三層加密架構（郵局比喻）、資安誠實評估、實測心得同 FAQ。

## Key Takeaways

- **Happy Coder = 免費開源手機 app**，遙控 Claude Code / Codex / Gemini；AES-256 四層加密、即時推播、多工作階段，GitHub 17,200★
- **6 方案比較**：① 官方遠端控制 ② 聊天平台串接（Telegram/Discord/iMessage）③ 任務派發 ④ 一鍵傳送 ⑤ 社群 SSH + tmux ⑥ Happy Coder → 作者結論：官方 4 月大幅改善，但 **Happy Coder 仍係功能最完整嘅單一方案**
- **內建 YOLO（`bypassPermissions`）切換**：手機就開關全自動模式，唔使返電腦（作者最愛功能之一）
- **三層架構**：電腦 CLI ↔ 轉發伺服器（只傳密文、看不到明文）↔ 手機 app；密鑰掃碼配對直接交換
- **安裝三步**：`npm install -g happy-coder`（Node 18+）→ 裝手機 app／開 `app.happy.engineering` → `happy --auth` 顯示掃描碼配對；之後打 `happy` 即起
- **費用**：核心完全免費；語音助手 1 小時後需訂閱（App Store $19.99/月，開發者稱係捐款按鈕）；Claude Code 訂閱（$20–200/月）另計、屬 Anthropic
- **資安誠實**：可自架轉發伺服器（只 900 行）；但**目前無獨立第三方安全審計報告**

## My Notes

呢篇比 vault 已有嘅 [[Happy Coder 手機遠端操控 Claude Code（什麼值得買）]]（smzdm 用家體驗文）**深入好多**，係**比較 + 教學 + 資安**取向：6 方案橫向表、三層架構解說、資安誠實評估（明講無第三方審計）、FAQ、完整參考資料（官方 docs／GitHub／HN／獨立評測）。兩篇互補：smzdm = 主觀體驗；本篇 = 客觀比較＋技術。

文中順帶提及 Anthropic 官方 remote-control / channels / Dispatch（Cowork 任務派發）同 OpenClaw「龍蝦」自動化，係 2026 手機遙控 AI 生態嘅好 landscape。

## Related

- [[Happy Coder 手機遠端操控 Claude Code（什麼值得買）]] — 同主題 smzdm 用家體驗文（互補）
- 官網：<https://happy.engineering/> ・ App/CLI（GitHub，17.2k★ · MIT）：<https://github.com/slopus/happy>
- 安全文件：<https://happy.engineering/docs/security/>
- 官方 Claude Code 遠端控制 docs：<https://code.claude.com/docs/en/remote-control>

<!-- ===== ARCHIVE BELOW — full article, not for quick scanning ===== -->

## Full Content (archived)

> 來源：`techhanlin.tw`（defuddle 抽取，已清 11 張圖片／空殼）。原文正體中文（台灣），未經 s2hk 轉換。保留作者原有「推薦閱讀／參考資料／FAQ」段（皆實質引用）。

如果你想用手機控制 Claude Code，Happy Coder 是 2026 年最容易上手的免費方案之一，這篇會先講它是什麼、怎麼安裝，再跟其他 6 種做法一起比較。

說真的官方進步速度很快，短短一個月就修了不少問題。但如果你問我每天實際在用哪一個，答案是 Happy Coder。

不是官方不好，是 Happy Coder 把所有優點整合在一個地方，而且免費開源。

這篇 Happy Coder 教學會帶你手機遙控 Claude Code，從六種方案的差異到安裝上手，五分鐘搞定。

## 為什麼我會想用手機操控 Claude Code 寫程式

### Claude Code 是什麼？一分鐘搞懂它跟聊天版 Claude 的差別

你可能用過 claude.ai 網頁版跟 AI 聊天，問它問題、它回你文字。Claude Code 完全不同，它是一個 AI 自動化寫程式工具。

你丟一個指令給它，它可以自己讀你整個專案的程式碼、開檔案改程式、跑測試、甚至幫你部署。一個指令下去，它可能連續改二十個檔案然後跑完測試，你只需要確認一下。

Claude Code 有好幾種版本：桌面版 app、VS Code 和 JetBrains 的外掛、終端機版（CLI）、還有瀏覽器版，底層是同一個引擎，功能很像。

我個人偏好用 CLI，全名是 Command Line Interface（命令列介面），這泛指所有透過輸入文字指令來與電腦溝通的介面，這與我們平常點圖示的 GUI 圖形使用者介面正好相反。而 MAC 它上叫做 ==終端機（Terminal）== ，在 Windows 上叫 ==命令提示字元 (Command Prompt)== ，簡稱 CMD。

因為它的自動化能力最強，可以用腳本串接、同時開多個 AI 分工協作，權限也是所有裡面最大，能做的事情最多。用起來就跟之前大家討論度最高的「OpenClaw 龍蝦」很像，幾乎什麼事情都能做。

不管你用哪個版本，Claude Code 跟普通聊天版 Claude 的差距都很大，差別不是對話品質，是它能不能真正幫你動手做事。

但不管用哪個版本，通常手機操作體驗都不好，很常會需要在電腦前。

你丟一個任務給 Claude Code，它可能要跑十幾分鐘，這段時間你就坐在電腦前等，如果它跑到一半需要你確認，你剛好去倒咖啡或開會了，整個任務就卡在那裡。

我自己的情況更極端，我經常不在電腦前，可能在外面開會、在移動中、或是躺在沙發上想到一個 idea 想讓 AI 先跑起來。

盯著電腦等它跑完，對我來說是最沒效率的工作方式，所以我一直在找能用手機遙控 Claude Code 的完美方法。

終端機版還有一個殺手級功能： ==全自動模式，官方叫 bypassPermissions，社群俗稱 YOLO== （You Only Live Once），意思就是「直接幹下去，別問這麼多」。

開啟之後 Claude Code 不會再跳出確認視窗問你要不要執行，改檔案、跑指令、裝套件全部自動跑。如果你有做好安全措施（例如在 Docker 容器或虛擬機裡跑），真的可以體驗到什麼叫全自動開發的爽感。

而 Happy Coder 的手機 app 直接內建了切換 YOLO 模式的功能，不用回電腦前就能開關，這也是我喜歡用 Happy Coder 的原因之一。

Happy Coder 權限模式選單，包含預設、計畫模式、不再詢問、接受編輯、Yolo 模式五個選項

### 手機操控 Claude Code 的六種方案，我推薦 Happy Coder

截至 2026 年 4 月，手機操控 Claude Code 的方案有六種，先快速看一下每個是什麼：

Claude Code 輸入 /rc 指令顯示 /remote-control 遠端控制選項，這是手機遙控 Claude Code 的內建方法

**1.遠端控制（Claude Code Remote Control）** ：Anthropic 官方目前我最推薦的方案！在終端機裡輸入指令（/remote-control），如上圖，就能從手機上的 Claude app 操控正在跑的工作階段，但手機端是網頁介面，不是完整的終端機畫面，有些斜線指令不能打，也不能切換全自動 YOLO 模式。

**2.聊天平台串接（Channels）** ：把 Claude Code 接到 Telegram、Discord 或 iMessage，透過聊天訊息操控。我實測 Discord 串接，一個 bot 只能綁一個工作階段，想同時管多個專案就要建多個 bot 很麻煩。比較適合自動化通知場景（例如測試失敗時通知 AI 修），拿來當手機遙控器不是它的設計目的，而且串接方便度不如 Anthropic 手機版。

**3.任務派發（Dispatch）** ：搭配 Claude 桌面版 app 使用，從手機傳任務出去，AI 會自動判斷要跑程式還是處理文件，也有人稱它叫 Anthropic 版龍蝦，現在已經有推播通知了。入門最簡單，但無法操縱終端機 CLI，導致權限不足。

**4.一鍵回傳（/teleport）** ：你原本在 claude.ai/code 網頁上跟 Claude 聊天，聊到一半覺得這段程式碼我需要在本地測試，這時你在終端機輸入 /teleport。它會跳出一個清單，讓你選取剛才在手機或網頁上的對話，然後整段對話、檔案變更和歷史紀錄會被傳送回你的 CLI 終端機裡，並自動幫你同步到本地檔案夾。但跟手機操控的概念稍微不太一樣。

**5.SSH + tmux 組合技** ：工程師的老派做法。用手機 SSH 連回電腦，搭配 tmux 維持連線不中斷。優點是拿到完整終端機，什麼都能做，缺點是設定門檻很高，要搞 VPN、裝 tmux、在手機小螢幕上打指令。不是工程師的話，直接跳過吧。

**6.Happy Coder** ：免費開源社群方案，安裝快速簡單，手機裝 app 掃碼配對就能手機遙控 Claude Code。有即時推播通知、端對端加密、支援多個工作階段同時管理，權限最大，而且可以開全自動 YOLO 模式。

六種方案的差異直接看表：

| 方案 | 難度 | 權限 | 全自動 | 手機操控能力 | 推播通知 | 端對端加密 |
| --- | --- | --- | --- | --- | --- | --- |
| Remote-control | 低 | 高 | 無 | 網頁介面操控 | 待更新 | TLS |
| 聊天工具 | 中 | 中 | 無 | 訊息轉發 | 靠聊天平台 | 有 |
| Dispatch | 低 | 中 | 無 | 可自動啟動工作 | 已有推播 | 有 |
| Teleport | 低 | 不可控 | 無 | 不是手機操控電腦 | 無 | TLS |
| SSH + tmux | 高 | 高 | 有 | 完整終端機 | 需自行設定 | SSH |
| Happy Coder | 低 | 高 | 有 | 操控介面 + 權限核准 | 原生推播 | AES-256 |

**Claude Code 手機操控六個方案比較：Happy Coder vs 官方方案 2026 年 4 月更新**

從表格可以看出，在 Claude Code 手機操控這件事上，Happy Coder 是唯一同時滿足所有條件的方案： ==難度低，權限最高，可全自動 YOLO 模式，真正的 CLI 終端機介面，原生推播通知，端對端加密== 。這也是為什麼官方方案改善了這麼多，我每天還是用 Happy Coder。

## Happy Coder 安裝教學五分鐘搞定

如果你看到這裡決定要試試 Happy Coder，下面會有 Happy Coder 安裝操作教學，我先讓大家看預覽畫面，再進入安裝教學。

### Happy Coder 手機工作模式

手機上會看到不同 CLI 的狀態，可以同時控制多台電腦，執行到哪個階段，一目瞭然，如下圖。

Happy Coder 手機 app 終端機列表，顯示 jugang11 已連線、線上狀態，支援多 session 管理

對話視窗中可以看到 CLI 所有指令，同時他會摺疊，讓閱讀比較順暢。

Happy Coder 手機介面顯示 Claude 正在讀取 WP 技能、文章格式規範、SEO 規則，Yolo 模式執行中

任務完成會隨時通知你，不怕你的 AI 偷懶。

iPhone 鎖定畫面收到 Happy app 通知「It's ready! Claude is waiting for your command」，Claude 任務完成推播

Happy Coder 近期更新還包含：
Git 工作樹（Worktree）管理、自動切換規劃模式、新增 OpenClaw 龍蝦代理、支援會話恢復（Resume）、「Bypass」模式更名為「Yolo」模式等，不但免費開源，功能還越來越強大。

Happy Coder 更新日誌列出新功能：Session Composer、Git worktree 管理、自動計畫模式切換、支援 OpenClaw

Happy Coder 開源專案在 GitHub 上已有 17k stars，是目前最多人使用的 Claude Code 手機操控開源方案

### Happy Coder 安裝第一步：電腦端安裝

前提條件：你的電腦需要 Node.js 18 以上版本，沒有的話先裝 Node.js，你可以在終端機輸入 node –version 確認版本。npm install -g 是全域安裝的意思，裝完之後在任何資料夾都能直接使用 happy 指令。

打開終端機，輸入一行指令：

```
npm install -g happy-coder
```

裝完確認一下：

```
happy --version
```

如果你還沒裝 Claude Code，也需要先裝：

```
npm install -g @anthropic-ai/claude-code
```

（以上資訊來源： [Happy Coder 官方 Quick Start](https://happy.engineering/docs/quick-start/) ）

### Happy Coder 安裝第二步：手機端下載 App 並配對

三個平台都有：

- iPhone： [App Store](https://apps.apple.com/us/app/happy-codex-claude-code-app/id6748571505) 搜尋 Happy Coder（開發者 Bulka, LLC，4.9 星 / 721 評分）
- Android： [Google Play](https://play.google.com/store/apps/details?id=com.ex3ndr.happy&hl=zh_TW) 搜尋 Happy Coder
- 不想裝 app：直接用瀏覽器開 app.happy.engineering

Happy: Codex & Claude Code App 在 Mac App Store 頁面，評分 4.9 顆星共 721 則評分，96.4MB

接下來配對。在電腦終端機輸入：

```
happy --auth
```

螢幕會顯示一個掃描碼（QR code），用手機上的 Happy Coder app 掃描，就可配對完成。如果掃不到，可以試 happy –qr-size large 放大，或 happy –no-qr 改用手動輸入文字碼。

執行 happy --auth 指令後終端機顯示 QR code，用手機 app 掃描即可配對，完成 Happy Coder 手機遙控 Claude Code 的認證設定

### Happy Coder 安裝第三步：啟動工作階段開始寫程式

配對完成後，以後每次只需要：

```
happy
```

就會啟動一個正常的 Claude Code 工作階段，同時手機端自動連上，你在手機上就能看到 Claude Code 的所有輸出，核准權限，一切就準備就緒，可以開始工作囉。

注意看，左下角的 bypass permissions on 就是全自動模式，如果預設不是全自動，可以按 shift+tab 切換成全自動。

終端機執行 happy 指令後啟動畫面，顯示 Claude Code v2.1.90、Sonnet 4.6、Claude Max 方案

補充！如果你也用 OpenAI Codex 或 Google Gemini，Happy Coder 也支援，可輸入以下指令：

```
happy codex
happy gemini
```

### Happy Coder 常見問題排錯

裝不起來或連不上的話，先看這幾個常見問題：

**問題一：找不到 Claude Code**
解法：先確認 Claude Code 有裝好。跑 npm install -g @anthropic-ai/claude-code 然後 claude –version 確認。

**問題二：連接埠被占用**
解法：跑 lsof -i:8765 找到佔用的程序，kill -9 \[PID\] 殺掉，或用 happy –port 8766 換一個連接埠。

**問題三：連不上轉發伺服器**
解法：試試切換到手機行動網路（不用 WiFi），或請 IT 開放 relay.happy.engineering 的連線。如果公司資安要求嚴格，可以自己架轉發伺服器（開源，只有 900 行程式碼）。

**問題四：Windows 每 20 秒閃一下視窗**
這是已知問題，開發者知道了但還沒修。暫時沒有解法，但不影響功能。

（以上資訊來源： [Happy Coder 官方 FAQ](https://happy.engineering/docs/faq/) ， [GitHub Issues](https://github.com/slopus/happy/issues) ）

## Happy Coder 設計原理

### Happy Coder 的三層架構：用郵局比喻解釋手機怎麼操控 Claude Code

Happy Coder 的運作方式分三層，官方文件的比喻很好懂。

第一層是電腦端的外掛程式，你跑 happy 指令，它會啟動一個正常的 Claude Code 工作階段，同時在背景監聽狀態。所有 Claude Code 的功能都不受影響，該有的都有。

第二層是加密的轉發伺服器，你可以把它想成郵局：手機和電腦都把信寄到郵局，但信是加密的，郵局看不懂內容，這解決了手機和電腦在不同網路時無法直接通訊的問題。整個伺服器只有 900 行程式碼，你不放心，開源程式碼可以自己檢查。

第三層是手機 App，iOS、Android、瀏覽器三個版本都有，介面是針對手機優化的，可以語音輸入、同時管理多個工作階段，延遲大約 0.3 秒，非常快。

（以上資訊來源： [Happy Coder 官方文件 – How It Works](https://happy.engineering/docs/how-it-works/) ）

### Happy Coder 的加密安全嗎？誠實說幾個 Claude Code 手機操控的資安重點

Happy Coder 用的是四層加密設計，簡單說：你的手機裡有一把主鑰匙，這把鑰匙永遠不會傳出去，每次跟電腦通訊，都會用這把主鑰匙產生新的加密金鑰，就算轉發伺服器被攻破，攻擊者拿到的也只是加密過的亂碼，沒有鑰匙解不開。

配對的時候，掃描碼做的就是交換鑰匙，用完即棄，不會重複使用。

不過我要誠實講幾件事：

Happy Coder 的開發者 Steve Korshakov 是前 Telegram 工程師，有密碼學實作經驗，底層加密技術是紮實的。但 App Store 跟官方文件對加密方式的描述不太一致，而且目前沒有獨立的第三方安全審計報告。如果你的公司對資安要求特別高，建議直接看原始碼或自己架轉發伺服器，不要只看行銷文案。整個專案開源，程式碼就在 GitHub 上。

還有，核心功能確實免費，但語音助手功能 1 小時免費後需要訂閱。App Store 有一個 $19.99/月的付費選項，開發者說這是捐款按鈕。GitHub 上有 521 個待解決的問題回報，Windows 上的穩定性問題比較多。

這些都是你在用之前應該知道的，我覺得寫出來比假裝不存在更有公信力。

## 我的 Happy Coder 實測心得

### 不是官方不好用，是 Happy Coder 把 Claude Code 手機操控的所有東西整合在一個地方

我先說清楚：Anthropic 的官方方案在 2026 年 4 月已經比 3 月好很多了。如果你只需要偶爾從手機確認一下進度，Claude Code Remote Control（遠端控制）或一鍵回傳就夠用。

但我每天的工作流程是這樣的：在電腦上用 happy 啟動 Claude Code，丟一個任務給它，然後就離開去開會、去吃飯、去散步。跑完或需要確認的時候，Happy Coder 推播通知到手機。我在手機上確認、給下一步指令，它繼續跑。 ==回到電腦前，所有紀錄都在。我只要按一下空白鍵，就可以繼續接手同一個工作視窗，手機跟電腦流程切換是我體驗最棒的== 。

Happy Coder Remote Mode 終端機畫面，顯示 Claude 對話紀錄與 Session 統計，Cost 1.22 美元、Duration 352 秒

這個 Claude Code 手機操控流程用官方方案也能拼出來，但你需要自己組合好幾個工具、設定推播通知、調整一堆設定檔。Happy Coder 一個 App 全包，五分鐘搞定。

### Happy Coder 把 Claude Code 手機操控變成日常

Happy Coder 還有幾個官方方案做不到的事：

多工作階段管理與跨平台支援，Happy Coder 不只能操控 Claude Code，也支援 OpenAI Codex 和 Google Gemini，如果你同時用多家 AI 工具，這是唯一跨平台的手機操控方案。

如果還是擔心資安問題，可自己架伺服器，如果你是金融業、法律業、醫療業，程式碼不能經過任何第三方，你可以自己架轉發伺服器，開源授權，支援 Docker，只有 900 行程式碼。

最近很多人在討論 OpenClaw 龍蝦自動化助手，但龍蝦本質上也是請另一個 AI 去操控 Claude Code 或 ChatGPT，token 消耗更多，而且多了一層 AI 中間人的風險。 ==最近 Claude 官方也開始把 OpenClaw 龍蝦封殺，只支援 API 消耗，以前省錢的做法沒了。==

對我來說，現在用 Happy Coder 搭配手機就能一句話做到幾乎 OpenClaw 龍蝦所有事情：開 YOLO 模式全自動跑、需要確認的時候手機推播通知、多個專案同時管理、隨時切換權限。我不需要承擔龍蝦額外的成本和風險，Happy Coder 就是最安全版的龍蝦，而且還很省錢。

對台灣企業主來說，我的建議是這樣：如果你的團隊已經有 Claude 訂閱，先試官方的任務派發和遠端控制。零成本、零設定、官方支援。如果試了覺得不夠順手，或者你需要多工作階段管理、跨平台支援、自架伺服器，那就裝 Happy Coder。五分鐘搞定，免費，隨時可以回到官方方案。

重點不是綁定某一個工具，而是現在就開始讓你的團隊習慣這種工作節奏：AI 不需要你盯著，它跑完會通知你，你在手機上就能給下一步指令。

## 結論：Happy Coder 和 Claude Code 手機操控，改變的是工作型態

Happy Coder 讓我確認了一件我在 Group.G 公司已經實踐一段時間的事。

我們公司現在的做法是用產出效率而不是坐在電腦前的時間來衡量工作，你在咖啡廳用手機遙控做完一個任務，跟你在辦公室坐八小時但只產出一半的成果，前者才是真正有效率工作，WFH 是必然趨勢。

AI 把執行的成本降到趨近於零，當 AI 可以自己跑、跑完通知你、你在手機上就能給下一步指令，那工作的定義就不再是坐在某張桌子前面的那段時間，工作變成你做了什麼決策、推動了什麼進度。

Happy Coder 只是讓這件事變得更簡單的工具，它可能被取代，Anthropic 的官方方案也在快速追趕，但把團隊從電腦前解放出來，讓 AI 在背景持續推進工作，這個工作趨勢不會逆轉。

如果你還沒試過，花五分鐘照著上面的 Happy Coder 教學裝一下，體驗一次用手機遙控 Claude Code 寫程式的感覺， ==甚至 Claude Code 不止可以寫程式，不管你是要深度研究、寫文章、發圖文、做設計，所有需要自動化的東西它都能做到== ，甚至連這篇文章都是我請它幫我找完資料之後，我再進一步修改完成的。

寫程式只是它其中一個功能，不管你選哪個方案，一旦你體驗過，你就會懂為什麼我會說這個工作型態必然是未來趨勢。

科技翰林院會持續追蹤 Claude Code 手機操控和遠端 AI 工作流的發展，有新的重要變化，我們會第一時間分析，也歡迎所有需要 AI 導入的企業聯繫我，打造專屬於你們公司企業的工作流程。

---

## 推薦閱讀

[Claude Dispatch 是什麼？手機遙控電腦 AI 自動化，龍蝦被 Anthropic 做成產品](https://www.techhanlin.tw/claude-dispatch-ai-automation-openclaw-comparison/)

[OpenClaw 龍蝦自動化是什麼？怎麼安裝？3 大優缺點大解密](https://www.techhanlin.tw/openclaw-automation/)

[Vibe Coding 是什麼？AI 寫程式的新方法完整解析](https://www.techhanlin.tw/vibe-coding-ai/)

---

## 參考資料

[Happy Engineering (2026). “Happy – Claude Code Mobile Client”](https://happy.engineering/)

[slopus (2026). “Happy: Mobile and Web client for Codex and Claude Code” – GitHub（17200 stars）](https://github.com/slopus/happy)

[Anthropic (2026). “Continue local sessions from any device with Remote Control” – Claude Code Docs](https://code.claude.com/docs/en/remote-control)

[Anthropic (2026). “Push events into a running session with channels” – Claude Code Docs](https://code.claude.com/docs/en/channels)

[Anthropic (2026). “Use Claude Code Desktop” – Claude Code Docs（含 Dispatch 說明）](https://code.claude.com/docs/en/desktop)

[Anthropic (2026). “Assign tasks to Claude from anywhere in Cowork” – Claude Help Center](https://support.claude.com/en/articles/13947068)

[Happy Engineering (2026). “Security & Encryption” – Happy Coder Docs](https://happy.engineering/docs/security/)

[Alex Cavender (2026). “Happy Coder Mobile Claude Code Integration” – 獨立評測](https://alexcavender.com/blog/happy-coder-mobile-claude-code-integration)

[Hacker News (2026). “Show HN: Happy Coder – End-to-End Encrypted Mobile Client for Claude Code”](https://news.ycombinator.com/item?id=44904039)

延伸閱讀： [Anthropic 洩漏 Claude Code 原始碼的 3 個警訊，如何看 AI 資安風險](https://www.techhanlin.tw/anthropic-claude-code-leak-ai-security/)

---

## FAQ

### Happy Coder 是什麼？

Happy Coder 是免費開源的手機 app，專門設計來遠端操控電腦上的 Claude Code、OpenAI Codex 和 Google Gemini。提供即時推播通知、AES-256 端對端加密、多工作階段管理，支援 iOS、Android 和瀏覽器。安裝只需要一行指令：npm install -g happy-coder。官方 GitHub 有 17200 顆星。

### Happy Coder 跟 Claude Code 遠端控制差在哪？

2026 年 4 月最新版本的遠端控制已正式上線，有自動重連，可存取本地工具和設定。但手機端仍然是網頁介面。Happy Coder 提供原生 app 體驗、即時推播通知、多工作階段管理和跨 AI 平台支援（Claude + Codex + Gemini），這些是遠端控制沒有的。

### Happy Coder 安全嗎？會不會看到我的程式碼？

Happy Coder 使用四層加密設計搭配 AES-256 加密。轉發伺服器只負責傳遞加密資料，看不到明文內容。整個專案開源，你可以在 GitHub 上查看原始碼。如果對資安要求特別高，也可以自己架轉發伺服器（只有 900 行程式碼）。但目前沒有獨立的第三方安全審計報告。

### Claude Code 手機操控 2026 年有哪些方案？

截至 2026 年 4 月有六種方案：Anthropic 官方的遠端控制、聊天平台串接（Telegram/Discord/iMessage）、任務派發、一鍵傳送，以及社群方案 SSH + tmux 和 Happy Coder。官方方案在 4 月大幅改善，任務派發加了推播通知、遠端控制正式上線。Happy Coder 仍然是功能最完整的單一方案。

### Happy Coder 要錢嗎？

核心功能完全免費，開源授權，沒有使用次數限制。語音助手功能 1 小時免費後需訂閱，App Store 有 $19.99/月的付費選項（開發者說這是捐款按鈕）。你仍然需要有 Claude Code 的訂閱（$20-$200/月），這是 Anthropic 收的費用，跟 Happy Coder 無關。

### Happy Coder 怎麼安裝？完整步驟是什麼？

三步驟。第一步：電腦上跑 npm install -g happy-coder（需要 Node.js 18+）。第二步：手機download Happy Coder app（iOS App Store 或 Google Play）或開 app.happy.engineering。第三步：電腦上跑 happy –auth 顯示掃描碼，手機掃描配對。以後每次只要打 happy 就能啟動。完整教學見 happy.engineering/docs/quick-start。

## Key Comments

留言未能抓取（WordPress 文章留言區多為動態載入／需登入，defuddle 未抓到；未能確認原文留言數）。
