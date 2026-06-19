---
type: bookmark
para: resource
domain: ai-tools
title: "矽谷大神 Karpathy 筆記術！十分鐘學會如何用 Claude Code 建立個人知識庫"
url: "https://www.youtube.com/watch?v=FdSO1Yhr76I"
summary: "Paula 寶拉 YouTube 教學（11:39，中文）：實作 Karpathy 個人知識庫法 —— 不用 RAG/向量庫，只靠 Obsidian + Claude Code，AI 自動整理成會自長/自健檢嘅 Wiki。本 vault 嘅基礎方法。"
channel: "Paula 寶拉"
published: 2026-04-14
duration: "11:39"
status: active
created: 2026-06-19
updated: 2026-06-19
related:
  - "[[karpathy - LLM Wiki gist]]"
tags:
  - bookmark
  - ai-tools
  - claude-code
  - obsidian
  - karpathy
  - llm-wiki
  - youtube
  - video
---

# 矽谷大神 Karpathy 筆記術！十分鐘學會如何用 Claude Code 建立個人知識庫

- URL: https://www.youtube.com/watch?v=FdSO1Yhr76I
- Channel: Paula 寶拉 ・ 11:39 ・ 發佈 2026-04-14 ・ 70,811 views ・ 1,658 likes
- Saved date: 2026-06-19
- Topic: Karpathy LLM-wiki 法實作（Obsidian + Claude Code，無 RAG/向量庫）
- Status: active

## Why I saved this

**呢條片就係本 vault 嘅基礎方法論。** Paula 一步步示範 Karpathy 喺 X 分享嗰套「LLM 當 compiler、唔用 RAG/向量庫」嘅個人知識庫法 —— 同本 vault 嘅 `raw/ + wiki/ + index + log + claude.md` 架構一模一樣。順手亦 cite 咗 Web Clipper（同本 vault bookmark pipeline 預留嘅一致）。留低做 reference + 對照本 vault 點樣 extend 咗原法。

## Summary

- **核心**：兩篇文章丟入 `Raw/` → 叫 Claude「ingest」→ AI 自動拆成 Wiki 頁（Concepts / Entity / Source），各有 summary + tags + 跨頁連結，更新 Index、寫 Log。
- **點解 work**：查嘢只讀 `Index` 定位、唔逐個 file 掃 → 上百頁都快。**唔使 RAG、唔使 embedding**。
- **複利**：問完問題，好答案存返 Wiki → 越用越厚；可叫 AI 定期健檢補 gap。
- **工具**：Obsidian（免費）+ Claude Code（付費）。片中用 Antigravity 驅動 Claude、用 Obsidian Web Clipper 收文。

## Key Takeaways（章節）

- (00:00) Karpathy 方法社群瘋傳　(00:36) 原貼重點：Wiki 自長 + 自健檢
- (01:39) 架構：Raw / Wiki / Index / Log / claude.md　(02:58) 工具：Obsidian + Claude Code
- (03:33) 建 Vault + 初始化結構　(05:27) Web Clipper 收文　(06:44) Claude 讀文自動建 Wiki
- (07:17) Graph View 看跨文連結　(07:52) 頁型：Concepts / Entity / Source
- (08:29) 用法：問問題 / 找知識缺口 / AI 補資料　(09:53) 同傳統 RAG 差異
- (10:43) 四個限制與適用場景　(11:22) 總結

**片中連結**：Obsidian https://obsidian.md ・ Web Clipper https://chromewebstore.google.com/detail/obsidian-web-clipper ・ Karpathy gist https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f

## My Notes

- 呢條片係**入門版**（flat raw+wiki、3 頁型）；本 vault 已 extend：mixed-mode（Personal/Projects/Bookmarks/Meta 各有邏輯）、domain typed-folder、PARA 鏡頭、status-over-folder、dual-log、Claude history hook 等。可作「對照原法 vs 本 vault 演化」嘅參考點。
- 片提 RAG 限制「~100 篇」同本 vault CLAUDE.md 講法一致。
- **抓取備註**：YouTube 對 headless IP 出「confirm you're not a bot」，要 `yt-dlp --cookies-from-browser chrome` 先攞到 metadata+字幕（Safari cookies 受 sandbox 保護攞唔到）。字幕轉 srt 需 ffmpeg（未裝）→ 改 parse 原始 `.en.vtt`。記低做日後 YouTube bookmark SOP。

## Related
- [[karpathy - LLM Wiki gist]] —— 原始 Karpathy gist（片中嗰個 prompt 來源）
- [[Bookmarks]]

<!-- ===== ARCHIVE BELOW — 全文 snapshot（yt-dlp en auto-caption，2026-06-19），掃描/triage 時可跳過 ===== -->

## Full Content (archived)
> 來源：YouTube 自動字幕（en，yt-dlp `--write-auto-sub` 2026-06-19 HKT，已去時間碼/去重）。原片中文發音，呢個係 YouTube 英文自動翻譯字幕；用詞或有出入，以原片為準。

Drop in two articles, and AI generates this itself — no sorting, no tagging, no database. A Silicon Valley legend shared this method and it went viral. Today I'll actually build it for you. Have you ever read an article and thought, this is important, I have to remember it — and two weeks later you can't even recall where you saw it? Or you diligently saved bookmarks, screenshots, dumped it all into a notes app, open it a month later — bookmarks everywhere, but you have no idea where to even start. And here's an even more common problem: article A mentions a concept, article B hits the same idea from a completely different angle, but because they live in different places, you never notice the connection. Recently Andrej Karpathy — former head of AI at Tesla, and one of the co-founders of OpenAI — shared a method on X to solve this exact problem. His approach is to hand articles to AI, and after reading, AI auto-organizes them into a Wiki — with summaries, an index, and links between related concepts, all stored on your own computer as a pile of markdown files. He made a few key points in that thread I really liked. First — you ask AI a question, it answers, and you save the answer back into the Wiki. That means your knowledge base gets richer the more you use it. Every lookup accumulates into the system. Second — you can let AI do periodic health checks on your Wiki. It looks for contradictions or gaps in your notes, and will even tell you, "Your coverage in this area is thin, want to add a few more articles?" Then he said something I really liked: you'll almost never need to edit the Wiki yourself, because it's the LLM's turf — building and maintaining it is all AI's job. He organized about 100 articles this way. He said he originally thought he'd need RAG, but letting the LLM maintain the index itself was enough. Before we build, let's go through the system's structure, so the demo makes more sense later. The whole knowledge base is just an Obsidian Vault. Inside, there are two main folders. The first is Raw — where you drop things in. Articles, PDFs, any raw material you want to organize — it all lands here first. Think of it as an inbox. The second is Wiki — where AI puts the organized version. It splits the Raw material into Wiki pages. Each page has a summary, tags, and links to other related pages. Inside the Wiki folder there's an Index — this part is key. It's the directory of the whole knowledge base, listing every page and category. When AI looks something up, it doesn't have to read every file. It just reads the Index first to know where to go. That's why this method stays fast even with hundreds of pages. There's also a Log — everything AI does: which article it read, which pages it added, which Wiki links it changed — all logged here. So you can trace back what happened, and AI also knows what it did before and won't redo it. Finally there's a claude.md file — it's the instruction manual for AI. It tells AI what this project is, how to organize data, and how to write the Wiki. Every time you open Claude Code, it reads this file first, so it always knows what to do. So how do we start? You only need two tools. First, Obsidian — a free notes app. It lets you see connections between notes as a graph. Just download it at obsidian.md — completely free. Second is Claude Code — the AI engine that reads, organizes, and links. That's it. Installation steps are in my previous video, linked in the description. Takes a few minutes to set up. Now I'll walk you through building it. If you don't want to miss tutorials like this, hit subscribe if you haven't. I'm Paula, this channel is all about testing and teaching AI tools. Okay, after installing Obsidian, open it up and click Create. Name it whatever. Since this is Andrej Karpathy's demo, I'll call mine AKDEMO. Pick a location you can find later, then click Create. I'm using Antigravity to drive Claude. If you don't know how to use it, I have a tutorial — link in the description. Here I'm opening the AKDEMO folder I just made. Open the terminal and type "claude". Now we paste Karpathy's concept in. Let's go back to X. He put his prompt in this Gist — so we click it. After clicking, you end up on this screen. This is the content of his prompt. Below, lots of people are discussing how they do it themselves. Worth a scroll if you're curious. Back at the top, click Raw, and select-all, copy. Back in Antigravity, paste it in. Then ask Claude: based on this concept, build out the whole knowledge base structure for me. And we wait a bit. Okay, it's done. You can see it created the Raw folder for us. Inside there's an Assets folder, and there's also the Wiki folder. And there's the Index page, and the Log — which records this initialization run. We can also open claude.md to take a look. You can see it wrote out a lot about this project — how to organize data, the formatting rules for the Wiki. That's the instruction manual for AI we mentioned. Every time you open Claude Code, it reads this file first, so we don't have to re-explain what the project is. The structure is ready. How do we get articles into our Wiki? The easiest way is a Chrome extension called Obsidian Clipper. Add it to Chrome. Once installed, pin it. Let's grab two articles. The first is from the author of The Almanack of Naval Ravikant, about reading being the foundation of learning — start with what you enjoy. Click the Obsidian extension, and here, change the folder to Raw — matching our folder name. Then click Add to Obsidian. You can see it saved into the Raw folder. Let's add a second article. Also from Naval — about finding your own specific knowledge, the kind of work that feels like play to you but looks like work to others. Same thing — click the Obsidian extension, change it to Raw, Add to Obsidian. And it gets ingested the same way. Back to Antigravity to drive Claude Code. Both articles are now in. Open the terminal, and tell Claude: there are new articles in Raw, please ingest them. As it reads them, it breaks out the concepts and people, builds a wiki page for each, with a summary and tags, and links to other related pages. It also updates the index, adding new pages into the directory. So let's wait a moment. Claude Code is done. Let's hop back to Obsidian. You can see it built out this graph. Let's check the graph view. Two articles — each has its own cluster of nodes. But some of them cross over. Like the "continuous learning" node — it caught the overlap between the two and formed a shared node. This is what makes the system powerful — AI finds the common ground between articles on its own and wires them up automatically. The more articles you add, the more cross-article links you get, and the more useful it becomes. Done with the graph — let's look at what's inside the Wiki. Concepts — it takes ideas from those two articles and gives each its own page, explaining the definition and key points. Entity — the people mentioned in those two articles, with notes on who they are and which concepts they connect to. Source — each original article we fed in, recording what it covered and which concepts and key points it maps to. These three page types link to each other — that's what the graph shows. Okay, so what can this system do? First — ask it questions. Like, how does Naval's idea of specific knowledge relate to reading? One is about making money, the other is about reading — so how do these two actually connect? We type that in and wait for the answer. A cross-article question like this — you might not spot the connection on your own, but AI can. So it answers based on what we fed into the system. We can also ask something more concrete: if I don't know what my specific knowledge is, what would Naval suggest I do? It synthesizes both articles to answer. Naval's view — first cultivate curiosity, find what you enjoy, notice what feels like play to you but looks like work to others. Second use case — finding knowledge gaps. You can ask it: based on the current Wiki, which areas are under-covered? It'll help you fill those gaps. It points out exactly where you can add more. It can also run searches for us. So the third, more advanced use — it can pull in extra material to fill those gaps. That's the practical side of this Wiki. If you follow AI, you've probably heard of RAG. That's when AI searches a database to answer a question. The biggest difference with Karpathy's method — no vector database, no embeddings at all. Traditional RAG chunks articles, turns them into vectors, stores them in a database. Queries rely on similarity search, and the setup bar is higher. This method is just a pile of markdown files plus an index. AI finds things by reading the directory and links — no similarity search. Upside: simple to set up, easy to maintain, cost is basically just AI tokens. Downside: it has a scale limit. Around 100 articles works well in practice. But for tens of thousands of documents you'd probably need a real RAG system. For most individual users though, this method is plenty. As usual, let's talk about the limits. First — Claude Code costs money, you need a paid plan. Obsidian is free. Second — ingest takes time, a few minutes per article. Throw 30 articles in at once and you'll wait 10 to 15 minutes. Third — it's built for personal scale. Dozens to a few hundred articles: fine. For tens of thousands of documents, you'll likely want other tools. Fourth — bigger knowledge base, more tokens. Every query, AI reads the index and the relevant wiki pages. More content means more tokens in the context. If you're paying per API call, that cost adds up. Andrej Karpathy's method — two folders plus an AI and you're done. If this makes you want to try it, just start. Drop in two or three articles and see how it feels. That's it for this episode. Leave a comment and tell me what topic you want next. Like, subscribe, ring the bell — see you next time.

## Key Comments
（YouTube 留言未抓取 —— 需 `yt-dlp --write-comments`（慢、易撞 bot-wall）。本 bookmark 屬教學 reference，留言非必要；如需可日後補。）
