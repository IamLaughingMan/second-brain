---
type: bookmark
para: resource
domain: News
title: "聞庫 collection.news — 《蘋果日報》/《立場新聞》文章存檔"
url: "https://collection.news/"
url_appledaily_archive: "https://collection.news/appledaily"
url_thestandnews_archive: "https://collection.news/thestandnews"
url_github: "https://github.com/collection-news/collection-news"
url_lens: "https://lens.collection.news/"
author: "聞庫團隊（匿名 HK 義工，open-source）"
summary: "HK 重大新聞保育項目：完整存檔已停運嘅《蘋果日報》（2021-06-24 國安法迫停）+《立場新聞》（2021-12-29 警方搜查停運）。截至 2026-06 已上傳 **2,321,702 篇文章 + 3,046,000+ 圖片**。匿名團隊、不收捐款、自費維護 server（Vercel hosted）、source code + data 全 open-source 上 GitHub（MIT License）；2023-09 短暫被 Vercel 因 DMCA takedown 下線，恢復後刪除 1 篇非政治文。2025-12 加入站內搜尋。名字源自唐君毅「花果飄零，靈根自植」→《果靈》→《聞庫》（「文庫」廉價普及讀物意象 + 圖標綠色 = 新聞自由生命力）。**Cloudflare-style 防護**：defuddle 403、curl 403、**Playwright headed Chrome 過**。"
status: active
related:
  - "[[香港新聞連線 Hong Kong Matters (香港元宇宙文化傳承計劃 Phase 1)]]"
  - "[[蘋果日報 — 脫髮是遺傳的（基因＋激素＋中西醫＋4 穴位）2021-03]]"
  - "[[GameOver HK — 港漫＋hi-fi 個人 blog（已停運，2024-09 後 Wayback only）]]"
  - "[[HKanime 香港動畫網 粵語配音動畫平台]]"
tags:
  - bookmark
  - news
  - hk
  - hk-preservation
  - apple-daily
  - 蘋果日報
  - stand-news
  - 立場新聞
  - press-freedom
  - open-source
  - anonymous
  - archive
  - hk-culture
created: 2026-06-22
updated: 2026-06-22
---

# 聞庫 collection.news — 蘋果日報＋立場新聞文章存檔

- URL: <https://collection.news/>
- Saved date: 2026-06-22
- Topic: HK news preservation／digital heritage archive
- Maintainer: **聞庫團隊**（匿名 HK 義工 collective）
- Hosted: **Vercel**（dev-friendly serverless）
- License: **MIT**（source code）+ **CC BY-NC-SA 4.0**（logo & content metadata）
- Status: active（持續 2025+ 維護 + 加搜尋）

## Summary

聞庫係保育已停運嘅 HK 新聞媒體文章嘅匿名 open-source 項目：
- **《蘋果日報》**（1995 創立、2021-06-24 因國安法凍結資金被迫停運）
- **《立場新聞》**（2021-12-29 警方搜查、6 人被捕、停運）

**規模（截至 2026-06）**：
- **2,321,702 篇文章**
- **3,046,000+ 圖片**

**團隊原則**：
- 完全匿名（國安法 chilling effect 警告）
- **不接受捐款**（伺服器費用自負）
- 完全 open-source（code + data 喺 GitHub）— 防 single-point-of-failure
- 唔做主動 takedown，例外只受 DMCA 法律壓力（Vercel 2023-09 case）
- 自定義 mission：「**保留一切**」、唔評斷文章對錯／價值

**功能**：
- **內建搜尋**（2025-12 新增）— 基於開源中文分詞、approximate match
- **lens.collection.news**（圖庫 sub-domain）— 圖片獨立查閱
- 文章 URL 格式：`/appledaily/articles/<26-char ULID>` 或 `/thestandnews/articles/<numeric ID>`

## Key Takeaways

1. **名字典故**：唐君毅「花果飄零，靈根自植」→《果靈》→《聞庫》。"果" = 蘋果＋傳統文化；"靈" = 提醒 HK 人靈根可植於任何地方。"文庫" 源 19 世紀法國出版家 Hachette、日本明治後流行袖珍版普及讀物意象。
2. **Vercel hosting 風險**：2023-09 一次 DMCA takedown（非政治文章）令 Vercel 下線整 site；經溝通刪該文後恢復。**Single-vendor dependency** 係 archive 嘅 weak link
3. **唔接捐款**嘅原因：避免捐款 → 收益 → 報稅 → 身份曝光鏈條；國安法環境下 anonymity 比 fundraising 更重要
4. **DMCA 濫用觀察**：聞庫團隊明言該起 takedown 由非版權持有人發起、屬 censorship dressed as DMCA — 普遍 chilling effect 工具
5. **數據規模 vs 2021 停運前 raw**：
   - 蘋果日報自 1995-2021 共 26 年、Apple Daily HK + Next Magazine + 飲食男女 + 果籽 + 動新聞等 vertical
   - 立場新聞自 2014-2021 共 7 年
   - 2.32M 文章 = approximate full corpus（possibly minor gaps for content behind paywall / video / 動新聞 等 non-text）

## My Notes

- **使用方式**：
  - 直接搜尋（2025-12 起新增）— **Playwright 自動化 friendly**（input 嘅 fill + press Enter 即返結果）
  - URL pattern guess：如知道原 Apple Daily article ID（26-char ULID）可直接 `collection.news/appledaily/articles/<ID>` access
  - GitHub data export：完整 dataset 公開可下載 — 適合做 academic／journalism research、唔受 server 限制
- **應用範圍**（為何呢個對你 vault 有用）：
  - 香港人個人 vault 嘅 HK culture preservation cluster 不可缺嘅 reference point
  - 已死 HK 媒體文章救回 → 同 [[GameOver HK]]／applehealth／HKanime 等 dead-site 案例形成 dataset
  - 如 future bookmark 任何 2021 前 Apple Daily／立場新聞 文章 → 預設用 collection.news mirror URL（不用 archive.org）
- **抓取技術 note（加 known-sites table）**：
  - defuddle：403
  - curl + UA：403
  - **Playwright headed Chrome**：✅ — Cloudflare-style 5 秒 challenge 過、SPA 載入後 evaluate `document.body.innerText` OK
  - Search interaction：`input[placeholder*="搜"]` → fill + press Enter → `/search?apple-articles[query]=<text>` route，返結果列表 + body excerpt（每 result 約 200-500 字 preview）
- **同類保育項目 catalog**（HK 視角）：
  - **聞庫**（本 bookmark）— 蘋果＋立場 text + image
  - **Hong Kong Matters**（[[香港新聞連線 Hong Kong Matters (香港元宇宙文化傳承計劃 Phase 1)|已 bookmark]]）— diaspora aggregator + 香港文化傳承計劃
  - **Wayback Machine**（archive.org）— general fallback
  - **Archive.today / archive.ph** — 反 dynamic-page-takedown
  - **PTT／Telegram channel** — 民間 cross-post mirror
- **唔可放／要小心嘅 risk**：
  - 喺 HK 境內訪問 collection.news 仍**可能被 ISP DNS poison／VPN-only access**（截至 2026 status 未確定）
  - 引用聞庫 article 喺 HK 出版／公開場合 = 國安法灰色
  - Bookmark 內容雖然 sensitive 但**不含任何 active illegal URL**、AV／harness 應該 OK

## Related

- [[香港新聞連線 Hong Kong Matters (香港元宇宙文化傳承計劃 Phase 1)]] — HK diaspora 新聞 aggregator，同 cluster
- [[蘋果日報 — 脫髮是遺傳的（基因＋激素＋中西醫＋4 穴位）2021-03]] — 本 site mirror 嘅一個 article 嘅 bookmark（demo dead URL + alive mirror pattern）
- [[GameOver HK — 港漫＋hi-fi 個人 blog（已停運，2024-09 後 Wayback only）]] — 同類 dead site，但只能 Wayback 唔在聞庫
- [[HKanime 香港動畫網 粵語配音動畫平台]] — HK culture preservation 另一範疇（粵語配音）

<!-- ===== ARCHIVE BELOW · 防 link-rot 全文與留言 ===== -->

## Full Content (archived — homepage / about-us 2026-06-22)

### Landing tagline

> **我們失去了甚麼？**
>
> 蘋果日報 — 2021 年 6 月 23 日
> 立場新聞 — 2021 年 12 月 29 日

### 蘋果日報停運背景

> 《蘋果日報》創立於 1995 年，曾是香港其中一份最暢銷的中文報紙。2021 年，多名高層因政治原因被捕，香港政府以《港區國安法》凍結報館資金，迫使《蘋果日報》於 6 月 24 日凌晨停止營運。

### 命名典故（《果靈》→《聞庫》）

> 《果靈》一名，由唐君毅先生的「花果飄零，靈根自植」演變而來。
>
> 「果」是傳統中華文化，也是《蘋果日報》，更可以是香港人引以為傲的價值。
>
> 昔日，先賢守護著傳統文化，靈根植於香港。如今，香港人的本土文化、抗爭精神隨政府打壓、疫情、移民潮被迫飄零。
>
> 「靈」希望提醒香港人，我們並非失根的花果，我們的靈可以在每一個地方紮根，亦應該在每一顆心裏面生根發芽。

### 關於我們

> 「文庫」（bibliothèque）一詞最早源於 19 世紀法國出版家路易．哈謝特，原指將不同的作品集合於一個標題下，並由一家出版社刊發。日本在明治時期後開始印刷袖珍尺寸的經典名著，引起多次文庫風潮。昭和以後，「文庫」（Bunko）成了廉價、便攜的小型普及讀物代名詞。
>
> 《聞庫》圖標中的一抹綠，是新聞自由燒不盡的生命力。如今，常見於報紙攤檔、茶樓食肆、巴士地鐵的香港報紙一份份消失。《聞庫》團隊以便攜的線上形式，打造保留香港新聞的資料庫。

### FAQ 摘錄

**你們是誰？**
> 一群希望保留香港歷史的香港人。

**將《蘋果日報》等媒體的文章公開，會否造成麻煩？**
> 壹傳媒已被多次抄家，國安處一早已經搜集報章證據，我們不想再自設紅線，打一步退一步。

**你們擔心國安法嗎？**
> 不擔心⋯⋯當然是假的。所以我們會保持匿名，亦不會接受任何捐款。

**伺服器安全嗎？**
> 詳細技術架構已在 GitHub 公開。

**可以公開整理好的數據嗎？**
> 現有文章資源（合計 **2,321,702 篇**）已全數上傳，並已上傳超過 **3,046,000 張圖片**。

**搜尋功能**
> 2025 年 12 月已新增搜尋功能。倚賴開源平台預設的中文分詞機制，所以用中文搜尋時可能有不完美。

**伺服器費用**
> 不為牟利，網站沒有任何廣告，自行承擔伺服器費用。

**用戶資訊記錄**
> 網站從未記錄過任何使用者資訊，我們不會知道你搜尋過什麼關鍵字。

**2023-09 下線事件**
> 收到 Vercel（服務提供者）電郵，根據 DMCA（數位千禧年著作權法）要求刪除一篇**非政治相關文章**。我們錯過了電子郵件，Vercel 關閉了聞庫。發現後與 Vercel 合作刪除該文，恢復運作。**DMCA 經常被濫用**：本次事件中文章版權所有者應為《蘋果日報》/壹傳媒集團，而非發起投訴指責聞庫誹謗的個別人士。我們開發聞庫的初心非常單純：**保留一切**。

### License

> This software is released under the **MIT License** in GitHub. Logo on this site is licensed under **CC BY-NC-SA 4.0**. **Next Digital Ltd.** maintain the copyright of all the content of Apply Daily. **Best Pencil (Hong Kong) Ltd.** maintain the copyright of all the content of Stand News.

### Contact

- info@collection.news
- GitHub: <https://github.com/collection-news/collection-news>
- GitHub directory mirror: <https://github.com/collection-news/appledaily-archive-directory>

### Sub-properties

- `lens.collection.news` — 圖庫 sub-domain
- `collection.news/appledaily` — 蘋果日報 完整索引
- `collection.news/thestandnews` — 立場新聞 完整索引

## Key Comments

*(聞庫無內建留言系統 — 跟其 anonymity 原則一致。社群 feedback 經 GitHub issues／PR 進行。)*
