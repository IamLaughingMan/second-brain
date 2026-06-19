---
type: bookmark
para: resource
domain: ai-tools
title: "你為什麼立即要用 Obsidian+AI 搭建第二大腦？保姆級教程｜Claude Code+Obsidian"
url: "https://www.youtube.com/watch?v=RZEb6FLZSHE"
channel: "Serena心心加州"
published: 2026-04-26
duration: "15:47"
status: active
created: 2026-06-19
updated: 2026-06-19
related:
  - "[[AgentCrew (Dustin) - 跨專案知識庫 Obsidian + Claude Code]]"
  - "[[杰森 - Karpathy LLM Wiki 完整實作指南 (Claude Code + Obsidian 文字版)]]"
tags:
  - bookmark
  - ai-tools
  - claude-code
  - obsidian
  - second-brain
  - workflow
  - youtube
  - video
---

# 你為什麼立即要用 Obsidian+AI 搭建第二大腦？（保姆級教程）

- URL: https://www.youtube.com/watch?v=RZEb6FLZSHE
- Channel: Serena心心加州 ・ 15:47 ・ 發佈 2026-04-26 ・ 99,763 views ・ 2,295 likes
- Saved date: 2026-06-19
- Topic: Obsidian + Claude Code 第二大腦**實戰 workflow**（文件夾設計 / 兩層 token 控制 / 自動輸入管道 / skills）
- Status: active

## Why I saved this

實戰 workflow 片，**多個技巧直接可借鏡本 vault**，尤其「**兩層導航控 token**」（root CLAUDE.md + 每個文件夾 instructions.md）—— 同你近期睇嘅「CLAUDE.md <150 條」「漸進式披露」呼應，係**具體可落地**嘅做法。亦示範咗手機一鍵語音捕捉、Web Clipper、Apple Books highlights 等輸入管道。

## Summary

- **點解搬**：由 Milanote → Obsidian，唯一理由 = **本地 Markdown 可俾 Claude 直接讀寫**（雲端嵌套結構 AI 讀唔到）。folder-as-an-app 概念。
- **⭐ 兩層導航（控 token 核心）**：① root `CLAUDE.md` —— 介紹你係邊個 + **文件夾地圖**（邊個 task 讀邊個夾）② 每個文件夾放 `instructions.md` —— 局部地圖（結構/命名/操作）。CLAUDE.md 強制規則：入任何夾前先讀該夾 `instructions.md`。⇒ Claude **只讀當下需要嗰層**，唔掃全庫 = 慳 token + 快。= Anthropic「**漸進式披露**」。
- **`context/` 夾**：放關於自己嘅資訊（你係邊個/目標/表達風格），AI 每次先讀，唔使重新自我介紹。
- **自動輸入管道**：Obsidian Web Clipper（一鍵網頁→md，含影片閱讀模式+時間戳）、Apple Books highlights 插件（劃線一鍵導入）、**iPhone Action Button + Shortcuts**（語音→當日 daily notes，捕捉碎碎念）。
- **Canvas**：取代 Milanote 思維導圖；JSON 本地檔，可截圖俾 Claude 複刻。
- **接入 Claude**：拖 vault 俾 Claude Code（YOLO 模式）／Obsidian terminal 插件／AI chat。
- **daily notes 做 session handoff**：每日尾叫 Claude 把今日所做寫入 daily notes + log → 下個 session 只讀最近幾日 daily notes（唔讀全庫）就知進度。
- **省 token**：Obsidian 官方 CLI、Claude skills 放 `skills/` 夾（隨個人風格實時更新）。
- 結尾扣 Karpathy LLM Wiki（本地結構化編譯 = 私有、任何 AI 可用嘅個人知識資產）。

## My Notes（對本 vault）

- **⭐ 兩層 CLAUDE.md + 每夾 instructions.md**：本 vault 得**一個大 CLAUDE.md**（偏長）。Serena 嘅 per-folder `instructions.md` 係**漸進式披露**嘅具體實現，可考慮 —— 尤其配合「CLAUDE.md <150 條」（見 [[柒星棧 - Claude Code 最佳實踐三件套 (Karpathy Skills + claude-mem + Best Practice)|柒星棧]]）。但本 vault 走 index.md + wikilink 檢索，未必需要 per-folder instructions；值得評估邊個適合。
- **daily notes handoff** ≈ 本 vault **收工 workflow + Claude history Stop hook**（已有等價物，甚至更自動）。
- **context/ 夾** ≈ 本 vault `memory/`（user 類）+ CLAUDE.md，但 Serena 係 vault 內檔、本 vault 係 ~/.claude memory；做法不同。
- **手機 Action Button 語音捕捉 → daily notes**：本 vault `Inbox/` capture-first 嘅一個可能輸入端（未實作手機管道）。
- 同 [[AgentCrew (Dustin) - 跨專案知識庫 Obsidian + Claude Code|Dustin]] 一樣係 workflow 片、用 kepano 生態；同 Karpathy 系列互補（佢偏 workflow、Karpathy 偏 compile）。

## Related
- [[AgentCrew (Dustin) - 跨專案知識庫 Obsidian + Claude Code]] —— 另一條 workflow 片
- [[杰森 - Karpathy LLM Wiki 完整實作指南 (Claude Code + Obsidian 文字版)]] —— Karpathy 完整法
- [[Bookmarks]]

<!-- ===== ARCHIVE BELOW — 字幕逐字稿（yt-dlp zh-CN 人手字幕 → opencc s2hk 轉正體，2026-06-19），掃描/triage 時可跳過 ===== -->

## Full Content (archived)
> 來源：YouTube **人手字幕**（zh-CN，yt-dlp `--write-sub` 2026-06-19 HKT，去時間碼/去重後 opencc `s2hk` 轉正體）。原片普通話、字幕為作者上載簡體。

我年初剛續費了Milanote的會員但是我還是決心把所有筆記都搬走不是因為Obsidian功能更多而是我意識到啊Obsidian可以很好的和Claude Code或者Codex結合可以打造一個我專屬的AI在AI時代做我的無敵第二大腦那前一陣呢我發了一個短視頻講了一下為什麼要用Claude Code 加Obsidian記筆記那期講的是為什麼那今天這期視頻呢我就分享一下怎麼做這期長視頻我和大家去看一下我平時怎麼利用AI來打造我的第二大腦的我會給大家先看一下我的obsidian文件夾結構是怎麼搭的然後呢我怎麼用手機一鍵記錄下我腦子裏的碎碎念再利用這些閃念進行創作怎麼把讀書筆記啊和日常積累打造成個人的維基百科還有一個很多人問我的問題讓AI讀筆記TOKEN不要錢的嗎？那今天呢我也會分享一下我平時是怎麼節省TOKEN消耗的小技巧最後呢會聊一聊靈魂的skills是怎麼把整套系統給串起來的那我們就開始吧在講怎麼用之前呢我想先説一下我是怎麼一步步走到這裏的其實我用milanote用了好幾年了因為它非常簡單非常方便我去畫我分散的思維導圖但是呢它有一個問題就是它存在雲端而且它結構是層層嵌套的AI很難系統地去讀取我所有的內容然後呢我後面就想到如果AI可以讀取我所有的讀書筆記啊還有我的視頻腳本它是不是就能夠了解我這個人我的思維方式那我是怎麼解決這個問題的呢首先呢我就在本地創建了一個文件夾然後呢裏面存了我的視頻腳本呀還有我的一些讀書筆記我在用cursor去打開我這個文件夾用AI直接去操作啊這就是我們去年《用ai發電》裏強調的一個概念folder as an APP也就是其實很多問題呢我們可以用一個文件夾就解決都不用去做APP用了一段時間我才反應過來obsidian本質上就是管理本地文件型的工具那既然我已經在做本地文件型的筆記了那我為什麼不直接用obsidian呢obsidian有更好的UI有更多的插件生態所以呢我就給它搬了過來那這就是我筆記切換的一個過程我先給大家看一下它其實非常簡單就是這些文件夾裏邊呢是一堆Markdown的文件只不過呢我們用obsidian這個筆記軟件去打開呢有更好的UI呈現啊文件夾怎麼設計呢其實是沒有標準答案的但有一點你要記住啊這些文件夾不只是給你自己導航用的更重要的是要讓AI知道去哪裏找什麼那給大家看一下我目前的筆記結構是這個樣子的啊比如這個context文件夾呢裏面放的就是關於我自己的信息我是誰啊我的目標我的表達風格呢這個是整套系統的核心AI每次進來呢都會先讀一下這裏這樣呢我就不用每次重新介紹我自己了最後呢在我們這個vault根目錄裏面放一個Claude.md文件這個就是我們第二大腦的入口claude每次運行我都會先讀一下這個claude.md的文檔它其實只做兩件事情第一個呢就是介紹你這個人你是誰你在做什麼那第二個呢就是我會給出一個文件夾的地圖就是告訴claude每個文件夾它是做什麼的那什麼情況是需要讀哪個文件夾比如説我的Claude.md裏面就寫着幫我寫視頻內容之前呢你要先去讀一下這個context brand.MD這個文件那幫我去記讀書筆記的時候呢你就去reading這個文件夾裏面去看你不需要把整個筆記庫掃一遍這樣呢也會幫我們節省不少的TOKEN但是呢光有這一層還是不夠的我在我的每一個文件夾裏呢我都放了一個instructions.MD這個文件哦我在Claude.md裏面有一個強制的規則就是進入到任何文件夾之前呢一定要先讀那個文件夾裏的instructions MD那這個文件夾級別的instructions呢會告訴Claude這個文件夾的具體結構還有呢文件命名規則呀還有一些我關於這個文件夾怎麼操作的一些説明那這樣呢就形成了兩層導航Claude.md呢是總目錄指向正確的文件夾啊文件夾裏面的instructions呢是局部的地圖告訴claude在這裏是需要怎麼操作的那claude永遠只讀它當下需要的那一層不會説把整個筆記庫全掃一遍這樣子呢TOKEN就控制住了速度也會變得更快obsidian這款筆記軟件呢它是免費的但如果你想要它官方帶的那個同步功能呢是收費的不過呢我呢是把我的obsidian文件夾呢放在了我的icloud裏這樣呢就可以保證我在不同設備裏面直接去同步那現在呢地基搭建好了我們再來講一下我們怎麼去往裏面存東西第二大腦有多強呢其實是取決於你往裏面存了什麼樣的東西如果存東西這個事情變得很費勁的話你就不會堅持下去為此呢我搭了幾個全自動的輸入管道讓信息可以輕鬆的流動起來不用我去手動的整理那首先呢我就要推薦一個神級插件就是obsidian官方推出的這個瀏覽器插件叫做Web Clipper它呢可以讓你一鍵的去保存任何你在網上看到的東西然後以Markdown的形式存入到你的筆記裏面比如説啊我看到這篇推文我覺得不錯那我就點擊一下這個插件呃然後呢它就會讀取這個title呀還有它這個鏈接呀作者呀還有裏面的內容那我現在就點擊add to obsidian然後哦你看直接就把這篇推文幫我保存到了我這個clippings這個文件夾裏面那還有一個模式呢我非常喜歡就特別適合我們去學習啊內容型的長視頻比如説我看到這個視頻呢我想去學習它我可以點擊下這個插件然後呢我可以給它切換到這個閲讀模式那這個樣子的話我就能呃邊看視頻邊看裏面的這些字幕然後呢我還可以點擊一下底下的這個時間戳自動會跳轉到相應的這個視頻片段然後呢我還可以把它導出來我就點擊一下我這個obsidian插件給它add to obsidian你看這樣子它就一鍵把這個視頻內容全部給我導到我的這個筆記裏面了最近我在我們用ai發電裏看了Ami的直播讓我學到了一個非常驚喜的插件就是這個apple BOOKS highlights這個插件也就是呢我去看書的時候呢如果我在我的書裏面直接highlight某一段的話那之後呢我可以直接點擊這個插件去導入我的內容比如説我最近在看這個die with Zero那這本書呢還是蠻有意思的也推薦大家去看就是怎麼最大化你的人生體驗那我highlights這段以後呢我可以在我這個obsidian裏面點擊一下我的這個插件然後呢它就會把所有的劃線內容呢幫我導入到我的這個筆記裏面也是因為這個原因呢我現在逐漸的從紙質書轉換到了apple BOOKS裏去讀那導入之後呢我就可以打開我的claude和他聊一下我的感受AI呢作為輔助還可以回答我的問題我覺得還是蠻有意思的像現在vibe coding呢我都習慣在電腦上一鍵就對着AI講話請你幫我實現這個功能巴拉巴拉巴拉然後我就在想啊手機可不可以實現這樣的一個功能就是我一鍵就讓它捕捉到我所説的碎碎念然後呢給它記錄到我的obsidian裏面你要知道人的一天可以有幾十個想法我們要集中性的去輸入而發散性的去輸出不管我是在走路還是在開車的時候呢我都希望可以把我一閃而過的想法給它記錄下來那我現在再來分享一下我的這個小技巧我的這個設置呢一共分為兩步其實很少有人真的去利用好了這個iPhone自帶的這個action button這個小按鈕就是點一下它呢可以切換到自己想要的一個程序裏面第一步呢我就在iPhone自帶的SHORTCUTS裏面設置了我的這個工作流讓它去聆聽我説的話再把我説話的這些文字呢直接給它加入到obsoleting今天的這個daily Notes裏面那第二步呢就是打開我們iPhone自帶這個action button的設置頁面讓它直接去打開我們剛剛設置好的這個快捷指令比如説我走在路上突然有了一個靈感我就可以直接點擊這個action button它就會自動地去記錄我現在的想法要隨時記錄我們的靈感然後我就可以在我的saving daily Notes裏看到我剛剛記錄的這條碎碎念而且呢我還在我的daily Notes instructions裏面告訴了AI這些帶時間戳的都是我當下的一個碎碎念方便之後呢幫我再次整理進行二次創作看到這裏呢可能有小夥伴記得我之前是milanote的用户那有人可能要問了那我之前用milanote是就是因為它比較好畫我分散的思維導圖那如果切換到obsidian以後這個功能怎麼辦呢其實呢我發現了canvas有一樣的功能就是這個canvas我可以在裏面同樣的去畫我的思維導圖更重要的是呢它是本地的文件然後它用JSON寫的我可以直接讓claude來輔助我我給大家看一下我是怎麼遷移的啊我當時猶豫很久要不要遷移就是因為這兩款筆記它的設計理念太不一樣了遷移起來真的太費勁了但是我後來發現啊就是我可以直接截屏給我的claude code讓他幫我去操作就比如説啊我跟他講請你在這裏呢幫我先創建一個文件來複刻這張圖那我之前發現讓AI幫我開掛的秘密也是如果這個東西它是本地的文件而且呢它是用代碼去編譯的那麼我就可以很好地去利用AI去操作因為這正是AI最擅長的地方哦我們可以看到啊claude正在幫我創建這個思維導圖那我們看一下它已經做好了就在這個rehab strategies這裏你看這就是它剛剛畫好的圖所以obsidian裏的canvas也很好地解決了我喜歡畫思維導圖的這個痛點好現在就來到我們這套系統最核心的地方把我們的AI給它接入進來其實剛剛演示呢我已經用到了我的claude code我一般就是用最原始的辦法那我呢就會把我整個筆記文件夾給它拖過去啊然後呢我就會呼喚一下我的claude並且呢我一般就直接用yolo模式它不用再問我什麼什麼權限還可以呢有一個terminal插件你可以直接點擊你就可以在你的obsidian裏面直接去使用啊你的這個終端然後呢你就可以在這裏去呼喚你的claude那還有一個辦法呢就是可以用它裏面的這個AI CHAT的功能這個你可以自己去設置一下那我一般呢就是用我這個最原始的辦法那比如説我現在就跟他講一下請你幫我把我最近的碎碎念整理成一篇文章或者説呢你給我幾個創作的靈感大家還記不記得我之前説過我會給它設置一個claude MD文檔所以每次呢這個claude執行任務的時候呢它都會先讀取我的這個claude MD文檔然後呢再去到相應的文件夾再去讀相應的這個instructions文件然後再去做相應的任務所以我覺得這個第二大腦的助手對我來説還是蠻有幫助蠻有意思的上次我發了那個短視頻以後呢很多人都問我你這麼讓AI去讀整個筆記庫TOKEN不要錢的嗎那其實呢我們可以學習一下 Anthropic設計claude code的原理就是 漸進式披露，AI它不需要每次直接讀取你整個筆記庫我們只需要按需給它就可以像我剛剛提到了這個claude.md文檔給它一個整個文件夾的結構啊還有每一個文件夾我都會設置一個instructions告訴它這個每個文件夾怎麼用那還有呢我們可以每次給AI當下它所需要的上下文讓它按需去讀取那我每天呢都會打開一個新的claude codesession然後呢去讓他做這一天的工作當這一天結束的時候呢我會跟他講請你把今天做的內容呢幫我整理到我們的daily Notes裏那claude code呢就會把今天他做了什麼需要跟進哪些事情呢全部都寫到我們當天的這個daily Notes裏那下次打開新的session他不需要讀整個筆記庫他只需要讀最近幾天的daily notes他就立即知道我們前幾天做了什麼卡到了哪裏現在還需要做什麼所以我覺得讓claude去寫好每天的daily notes然後讓他自己去記錄今天的log是非常重要的隨着你的筆記庫越來越大間接式披露和按需索取這個思維模式呢就越來越關鍵那還有一個省token的小技巧就是Obsidian裏其實有它官方的CLI也就是命令行工具我們可以用它們官方的這個CLI來幫我們操作筆記這樣呢就會減少我們claude token的消耗那我之前做過一期視頻就是講我們今年如果一定要學的AI那一定是claude skills那claude skills就是告訴claude怎麼去執行一個特定的任務讓它穩定地去輸出那我現在呢把我的claude skills都放到了我的obsidian的skills文件夾裏然後再讓claude直接指向我這裏的skills這樣做有一個什麼好處呢大家知道那個skills裏面它的reference也就是它的那些參考文檔是非常重要的那我在搭建我的第二大腦的同時呢我其實是在不斷的優化我裏面的筆記我裏面的內容所以呢我希望啊我的skills也是可以實時更新的比如説我這個發佈博客的skill啊還有我這個做視頻的skill啊那隨着我的日積月累這些skill呢它也是需要不斷地去根據我個人的風格去優化的好那今天呢就簡單介紹一下我自己工作流搭建的一個過程當然了我的工作流還在不斷的改進中更多具體的實踐細節呢一個視頻真的講不完那更多的內容呢我會放在我們用ai發電 裏面也歡迎你的加入最後呢我想聊一個更長遠的概念是Andrej Karpathy提出來的他是前特斯拉的AI總監open AI的聯創是AI時代最具影響力的工程師之一那他提出來呢我們每天其實是會接觸大量的原始信息像你看的推文呀文章呀會議記錄呀讀書筆記呀等等但是呢這些信息亂七八糟的不好直接使用如果你可以用l l m直接去把這些信息呢本地結構化的去編譯然後呢你再用obsidian加AI去查看和操作那你就擁有了一個隨着時間積累越來越強的個人知識系統那這可不是某個AI公司賣給你的功能這是一個完全你自己搭建出來的完全本地化完全私有的任何AI都可以使用那我們都知道啊AI現在真的是迭代的太快了今天出一個功能明天出另一個功能但是我覺得在這個AI時代慢慢地去建立自己的一個個人知識資產那這件事情是不可替代的也是我在做的一個方向我的筆記庫可能現在看起來還很初級但是它每天都在成長几個月以前呢裏面還是空的但是現在呢一打開claude它就能認出我這個人了我覺得這個才是我值得去做的事情那既然這個視頻就拋磚引玉一下有什麼想法歡迎到評論區裏留言那我是心心我們下期見拜拜

## Key Comments
（YouTube 留言未抓取 —— 需 --write-comments。教學 reference，留言非必要。）
