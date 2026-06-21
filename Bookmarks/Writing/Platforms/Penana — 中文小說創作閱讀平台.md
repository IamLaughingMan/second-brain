---
type: bookmark
para: resource
domain: Writing
title: "Penana — 中文小說創作／閱讀平台（繁中／港台社群）"
url: "https://www.penana.com/home"
summary: "Penana 係繁中小說連載／閱讀／創作挑戰平台（mobile 版 m.penana.com），分類覆蓋愛情浪漫／玄幻武俠／科幻／懸疑／奇幻冒險／寫實社會／青春校園／二創／男男耽美／女同百合／輕小說＋漫畫；港台社群活躍（粵語／廣東話／本地題材常見）；定期辦「創作挑戰」（如 2026 足球世界盃主題）。"
status: active
created: 2026-06-21
updated: 2026-06-21
related:
  - ""
tags:
  - bookmark
  - writing
  - reading
  - chinese-novels
  - publishing-platform
  - hong-kong
  - taiwan
---

# Penana — 中文小說創作／閱讀平台

- URL: https://www.penana.com/home（canonical；mobile = `m.penana.com`）
- Saved date: 2026-06-21
- Topic: 繁中網絡小說 / 創作 / 閱讀 / 創作挑戰平台
- Type: site root（user-generated content / publishing）
- Status: active

## Why I saved this

中文 web fiction 平台，**繁中（粵／廣東話／本地題材）社群活躍**，有別於起點／晉江／LongNovel 嗰類純簡中 mainland 站；港台原創作者比例高，**包含粵語作品**——值得做 reading／writing 嘅 reference platform。

## Summary

**Penana** 係繁中向小說連載／創作平台，slogan「分享你寫的小說，參加創作挑戰，閱讀免費故事！」三大功能：

1. **閱讀**：免費連載小說／漫畫
2. **創作**：作家可開連載發佈，自由編輯／更新
3. **創作挑戰**：主題式徵稿活動（最近主題：2026 足球世界盃熱血運動）

港式繁中＋粵語作品比例顯著，UI/UX 偏向手機優先（mobile 版 `m.penana.com` 同 desktop 內容互通）。

## Key Takeaways

### 內容分類（12 大類）

愛情浪漫｜玄幻武俠｜科幻世界｜懸疑推理｜奇幻冒險｜寫實社會｜青春校園｜二創｜男男耽美｜女同百合｜輕小說｜漫畫

### 港台社群指標（2026-06-21 homepage sample）

「足球世界盃」主題書單，多本明顯**港式作品**：

- **《繼續上》** 東炒飯 — 港超故；tags: 香港／粵語／港超
- **《中佬的足球場》** TheBoxStudio — tags: 港漫／中佬
- **《重來一次的足球人生》** 史提夫陳 — tags: 香港作者／本地／足球員
- **《命運籃球》** 歐子爭 — 七宗罪／籃球／玄幻
- **《時速四百公里》** 薯仔聞茱莉 — 羽毛球
- **《準繩道》** Jacob Yuen — 跳繩（「香港運動員係垃圾」反命題）
- **《籃球小說 - 追》** 東南 — 80s 香港青年北上籃球夢

→ 平台允許粵語 / 廣東話書寫（罕見），對 HK 本地小說友善。

### 主要功能模組（top nav）

- **小說**（瀏覽）
- **創作**（開新作）
- **創作挑戰**（活動）
- **交流**（社群）
- **漫畫**

### 商業模式 / 變現（推測）

未直接示，但常見此類平台靠 ads + 打賞 + 訂閱章節 + 周邊（部分作品「實體書於各大書局有售」表明有 print spin-off）。

## My Notes

- **vs 其他中文小說平台**：
  - **晉江文學城** / **起點中文網** / **縱橫中文網** = 簡中 mainland 主導、商業化深、女頻男頻分離明顯
  - **痞客邦** / **方格子** = 多用途 blog 平台，唔係小說 native
  - **Penana** = **繁中 + 港台 +（罕見）粵語**，社群規模細但 niche 補位
- **粵語作品市場**：紙本出版罕（成本／受眾 limit），網絡平台允許粵語係**保育 + 創新雙重意義**；可留意有冇 Penana 嘅本地作家畢業到實體書。
- **Cloudflare 反 bot**：defuddle／curl 抓 `m.penana.com` 都 403（Cloudflare「Just a moment...」challenge），需 Playwright 過 JS challenge 先攞到內容——同 [[project-playwright-mcp]] table 補一條 Penana case（headed Chrome 過 CF 成功）。
- **Mobile URL `?from=upbtn`** 估計係 "upload button" tracker（user 由上載入口入嚟）—— 純 referrer marker，唔影響內容。Canonical 自動 redirect 去 `www.penana.com/home`。
- **適合 use cases**：
  - 想睇繁中／港式小說（vs 簡中起點晉江）
  - 想試手寫小說但唔想自己整 site（vs 自建 blog／Substack）
  - 想參加主題創作挑戰累積讀者（vs 完全自由發 = 冇 momentum）
- **不適合**：
  - 想 hard monetize（細市場、打賞額有限）
  - 想做純嚴肅文學（平台 lean toward 通俗類別）

## Related
- [[ ]]

<!-- ===== ARCHIVE BELOW — 全文 snapshot，掃描/triage 時可跳過（Read 用 limit 只讀上半；要全文先讀落呢度） ===== -->

## Full Content (archived)
<!-- Playwright 從 Cloudflare 後 DOM 抽 metadata + 主要結構；homepage 內容每日變、唔係 evergreen——本 snapshot 僅作站結構參考。 -->

### Page metadata（2026-06-21）

| Field | Value |
|-------|-------|
| Title | Penana |
| Description | 分享你寫的小說，參加創作挑戰，閱讀免費故事！ |
| Mobile URL | https://m.penana.com/home |
| Canonical URL | https://www.penana.com/home |

### Top nav / categories

`menu / Penana / 登入 / search`

**12 大分類**：全部 ／ 愛情浪漫 ／ 玄幻武俠 ／ 科幻世界 ／ 懸疑推理 ／ 奇幻冒險 ／ 寫實社會 ／ 青春校園 ／ 二創 ／ 男男耽美 ／ 女同百合 ／ 輕小說

**5 大功能**：小說 ／ 創作挑戰 ／ 創作 ／ 交流 ／ 漫畫

### 2026-06-21 Featured section: 熱血足球運動季

> 有關「足球」及「運動」的主題書單

主要 featured works（節錄 homepage 列表）：

- **《命運籃球》** 歐子爭 — 七宗罪／籃球／玄幻／打鬥冒險（已完結；實體書於各大書局有售）
- **《繼續上》** 東炒飯 — 港超故；「作為喜歡足球的香港人，你是不是一直都只看外國的球賽？能夠每周也看英超、西甲，卻不曾現場看過一場港超？」tags: 香港 友情 熱血 廣東話 粵語 運動 足球 努力 勝利 東炒飯 港超
- **《中佬的足球場》** TheBoxStudio — 「踢波梗係踢前鋒啦，猜輸先守龍嘅啫」；tags: 運動 足球 港漫 中佬
- **《時速四百公里》** 薯仔聞茱莉（已完結）— 羽毛球；tags: 奇幻 搞笑 科學 羽毛球
- **【創作挑戰】燃起你的足球之魂⚽️** 東炒飯 and 3 Others — 世界盃主題徵稿
- **《準繩道》** Jacob Yuen — 跳繩（冷門運動主題）；tags: 運動 港漫動力 跳繩
- **《重來一次的足球人生》** 史提夫陳 — 28 歲球員重生；tags: 香港作者 本地 運動 足球 足球員 足球運動
- **《籃球小說 - 追》** 東南（休息中）— 80s 香港青年北上籃球夢；tags: 青春 熱血 2023佛系日更大挑戰 籃球 東南小說
- **《足球日記》** 袁術（已完結）— tags: 運動 足球 體育

### 已完結精彩故事 — Famous Completed Story

- **《破紋夜》** 楓成 and 1 Others — 武俠系列（《召喚武師》《遊戲之道》《三魂行》《真山誌》）；FB: 楓成 / TG: 萬千…

## Key Comments
<!-- 有重要內容嘅留言，逐條附作者/出處。 -->

Penana homepage 屬聚合頁，**無 native comment section**（評論喺各 work 內頁；本檔只 snapshot 首頁結構）→ N/A 喺 home 層。
