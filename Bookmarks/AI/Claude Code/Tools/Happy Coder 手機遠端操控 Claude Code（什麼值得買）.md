---
type: bookmark
para: resource
domain: claude-code
title: "把 Happy Coder 搬到手機上——隨時隨地寫代碼"
url: "https://post.smzdm.com/p/anvwm2e0/"
author: ""
published: "2026-04-03"
status: active
created: 2026-06-20
updated: 2026-06-21
tags: [bookmark, happy-coder, claude-code, mobile]
summary: "什麼值得買用家分享 Happy Coder 使用體驗——透過 AES 端對端加密中繼，用手機遠端操控 Claude Code/Codex，解決「必須守在電腦前等確認」痛點；支援推播通知、語音操控、多任務並行。"
---

## Summary

smzdm（什麼值得買）用家分享親身體驗：用 Happy Coder 把 Claude Code 工作流搬到手機，不用一直守著電腦等確認彈窗。文章涵蓋安全原理（零信任 AES 加密）、安裝流程、alias 技巧，以及真實使用感受。

## Key Takeaways

- **核心痛點**：Claude Code 頻繁彈確認框（權限 / 繼續 / review），人走不開；手機遠端桌面字太細、體驗差
- **解決方案**：Happy Coder = Claude Code + Codex 的手機客户端；推播通知 → 手機點確認
- **安全架構**：電腦端 AES 加密上傳 → 中繼伺服器只搬密文 → 手機本地解密；密鑰掃碼配對時直接交換，不過服務器；零信任架構
- **開源**：MIT 協議，Relay Server 亦開源可自建
- **推播通知**：Claude Code 需要操作時推送，不用一直盯屏幕
- **語音操控**：説「繼續」「執行」即觸發，非單純語音轉文字
- **多任務**：可同時跑多個 Claude Code 實例，手機切換查進度
- **alias 技巧**：`alias claude='happy claude'` 防止忘記用 happy claude；加 `\claude` 可跳過 alias

## My Notes

呢篇係 smzdm 用家主動分享嘅體驗文，唔係官方軟文。用家提到 playwright MCP 測試時仍然頻繁要求確認、唔想 user-level 放大權限——呢個痛點好真實，係 Happy Coder 嘅核心 use case。

語音識別中文準確率唔穩定，用家自己改用微信語音轉文字做中轉，值得留意。

## Related

**官方來源（canonical，本篇為第三方體驗文）：**
- 官網：<https://happy.engineering/>
- App（手機/Web client，>17k★ · MIT）：<https://github.com/slopus/happy>
- CLI（電腦端 `happy claude`）：<https://github.com/slopus/happy-cli>

**同主題（互補）：**
- [[Happy Coder 手機控制 Claude Code 教學與 6 方案比較（科技翰林院）]] — 深入比較文（6 方案橫向＋資安＋FAQ），相對本篇嘅主觀體驗

**其他 Claude Code 工具：**
- [[Superpowers (obra)]] — 另一個 Claude Code 增強工具（TDD + plan + review 方法論）
- [[claude-auto-retry (cheapestinference)]] — 自動重試 rate limit（已知與 cmux 不相容）

<!-- ===== ARCHIVE BELOW — full content + comments, not for quick scanning ===== -->

## Full Content (archived)

我把 Happy Coder 搬到手機上，隨時隨地寫代碼

2026-04-03 12:16:23

用 Claude Code 寫代碼最大的痛苦就是得一直守在電腦前等確認。Happy Coder 讓你用手機遠程操控 Claude Code 和 Codex，終於可以離開工位了。

### 起因

最近在做一個小小的個人項目，日常開發基本靠 Claude Code + GLM 配合 Codex 做 vibe coding。説實話效率確實高，一個需求扔進去，它哐哐一頓寫，我負責 review 和調整就行。

但有個問題一直困擾我——我得一直盯着它。

Claude Code 不是全自動的，它會頻繁地要求你確認權限：這個文件能不能改？這個命令能不能執行？要不要繼續？你要是不及時回應，它就停在那裏等你。人根本走不開。尤其有些項目涉及到前端，我配置了 playwright mcp 做測試，在 claude 裏已經配置"mcp__plugin_playwright*", 的情況下，仍然需要頻繁的去請求權限，常常被確認的邏輯卡住，但又不想配置到用户目錄的配置而導致權限放的過大。

我試過用手機遠程連 Mac 的屏幕，想着至少能去倒杯水。但實際用起來太難受了，手機屏幕就那麼大，終端界面的字小到看不清，點個按鈕都得放大再放大，操作效率約等於零。

這個問題困擾了我挺久的，直到最近看到了 Happy Coder。

### Happy Coder 是什麼

簡單説，它就是 Claude Code 和 Codex 的手機客户端。

你在電腦上跑 Claude Code，通過 Happy Coder，你可以用手機實時看到它在幹什麼，並且能直接在手機上操作——確認權限、輸入指令、切換任務，跟坐在電腦前一樣。

幾個我覺得比較關鍵的特點：

- 免費開源，MIT 協議，代碼在 GitHub 上
- 端到端加密，你的代碼和對話內容經過 AES 加密傳輸，中繼服務器只搬運密文，看不懂你在傳什麼
- 推送通知，Claude Code 需要你操作的時候會推送到手機
- 支持語音，可以直接説話讓它執行命令，不只是語音轉文字那種
- 多任務並行，可以同時跑好幾個 Claude Code 實例

### 安全性聊聊

看到"把代碼傳到手機上"這個説法，第一反應肯定是——安全嗎？

我查了一下它的原理，大概是這樣的：整個系統分三塊——電腦端的 CLI、一個中繼服務器（Relay Server）、手機端的 App。你的電腦和手機之間不直接通信，所有數據都經過中繼服務器轉發。

但關鍵是，中繼服務器只搬運加密後的數據塊，它自己解不開。

具體來説：

- 電腦端把 Claude Code 的終端狀態用 AES 加密後上傳
- 手機端拉取加密數據，本地解密後展示
- 你在手機上的操作指令反過來，也是加密後上傳，電腦端解密執行
- 密鑰在你掃碼配對的時候直接在兩個設備之間交換，不經過服務器

這叫零信任架構——你不需要信任中繼服務器的運營者，因為它從頭到尾只接觸密文。而且整個項目是開源的，加密實現可以自己審計。如果你還是不放心，Relay Server 也是開源的，完全可以自己搭一套。

對我來説，平時寫代碼傳的是加密密文，比手機遠程桌面明文傳輸終端畫面安全多了。

### 安裝配置

整個過程不復雜，幾分鐘搞定。

**電腦端**

先裝 CLI 工具：

```
npm i -g happy-coder
```

裝好之後直接運行：

```
happy claude
```

它會啓動一個 Claude Code 的會話，同時把這個會話註冊到 Happy 的服務上。你在終端裏看到的跟正常用 Claude Code 沒什麼區別，只是這個會話現在可以被手機端接管了。

**手機端**

去應用商店搜 "Happy Coder" 就行，iOS 和 Android 都有。

裝好打開之後，它會引導你跟電腦端配對。

配對完成後，你就能在手機上看到電腦上正在跑的 Claude Code 會話了。

### 一個小技巧

用了一段時間後發現一個問題——我老是習慣性地敲 claude 而不是 happy claude，等反應過來的時候已經晚了，會話沒註冊到 Happy 上。

後來我在 .zshrc 里加了個 alias：

```
alias claude='happy claude'
```

這樣不管敲 claude 還是 happy claude，走的都是 Happy。如果某天 Happy 出問題了想用原版，敲 claude 加個反斜槓就能跳過 alias。

### 實際使用體驗

**終於可以離開電腦了**

這是最大的變化。以前跑個任務，我得坐在那等它彈出確認框。現在手機收到推送，點開看一眼，確認就完事了。去廚房拿個外賣、沙發上躺着，都不耽誤幹活。

**推送通知是真的好用**

Claude Code 需要你輸入的時候、代碼寫完等你 review 的時候、出了什麼問題的時候，都會推送通知到手機。這個功能看着不起眼，但實際用起來你會發現——終於不用一直盯着屏幕刷新了。

**語音操作有點驚喜**

本來覺得語音操控 Claude Code 是個噱頭，但實際用下來還不錯。躺着的時候不想打字，直接説一句"繼續"或者"執行"，它就動了。不是簡單的語音轉文字，是真的語音到動作的執行。

**多任務是真的爽**

做新項目時的時候，經常前端後端同時改。現在我可以同時開兩個 Claude Code 實例，一個改後端規則引擎，一個改前端配置頁面，手機上切來切去看進度。以前得一個個排着來，現在並行搞效率高了不少，當然一個 claude 多個 agent 一次性下發任務命令執行也是非常爽的。

**也有不完美的地方**

説説缺點。畢竟是第三方工具，界面上偶爾會有點卡頓。另外如果你家網絡不太好，手機端的響應會有延遲，這個看你自己的網絡環境。還有就是語音識別偶爾會抽風，説中文的時候準確率不太穩定（我感覺到了，所以我都用微信語音轉文字）。

### 適合什麼人

如果你符合下面任意一條，可以試試：

- 用 Claude Code 或 Codex 做主力開發工具，但不想一直坐在電腦前
- 經常需要同時跑多個 AI 編程任務
- 想在手機上也能隨時查看和操控你的編程 session
- 對代碼安全有要求，需要端到端加密

### 寫在最後

Happy Coder 解決的不是什麼大問題，它就是幫你把"必須坐在電腦前"這個束縛去掉了。但就是這個小變化，讓整個 vibe coding 的體驗舒服了很多。

至少對我來説，終於不用在等確認的時候乾坐着了。

## Key Comments

原文 0 則評論（非抓取失敗——原文 metadata 顯示「0 點贊 0 收藏 0 評論」，本身就無留言）
