---
type: digest
category: Trending
date: 2026-06-23
sources:
  - https://news.ycombinator.com
  - https://lihkg.com
  - https://www.bilibili.com/v/popular/all
  - https://www.reddit.com (Reddit anti-bot — needs Playwright; not captured today)
  - https://weibo.com/ajax/side/hotSearch (login wall; not captured today)
  - X trending (not captured today)
status: active
created: 2026-06-23
updated: 2026-06-23
tags:
  - digest
  - trending
  - 2026-06-23
---

# Trending Digest — 2026-06-23（三圈混合 Top 5）

> 三圈：英文／中文（CN 簡體）／港，每平台 top 5 light coverage。HK 時 ~19:50 抓取。

## 英文圈

### Hacker News（非 AI 類，top by points；AI 類已在 [[Digest/2026-06-23/AI|AI digest]]）

1. **Steam Machine launches today** (1643 pts / 1411 c) — Valve [Steam Machine](https://store.steampowered.com/news/group/45479024/view/685257114654870245) 終於發售；主機／PC mid-form-factor 戰局新章。
2. **Help I accidentally a wigglegram** (536 pts / 124 c) — [立體照片 (wigglegram)](https://lmao.center/blog/wiggle-accidents/) 意外發現過程，homebrew 攝影樂趣。
3. **Flock-Powered Police Chiefs Stalking Women** (533 pts / 241 c) — [IPVM 調查報告](https://ipvm.com/reports/police-chiefs-track) 揭警方利用 Flock 車牌偵測系統追蹤女性 → privacy／surveillance 議題大火。
4. **Canada plans 'nuclear renaissance'** (499 pts / 343 c) — [CBC 報導](https://www.cbc.cs/news/politics/federal-nuclear-strategy-9.7244509)：加拿大 2040 前建多達 10 個新核反應堆。能源 transition 路線分歧。
5. **Polymarket flooded social media with deceptive videos** (351 pts / 264 c) — [華爾街日報 (WSJ) 報導](https://www.wsj.com/business/media/polymarket-social-media-bets-prediction-market-441cdeb5)：預測市場 (Polymarket) 用 paid creator 灌水社媒 → prediction market integrity 議題。

### Reddit r/all & subreddits — **未能抓取**

Reddit 對 curl／defuddle 啟動 anti-bot blocking（HTML 替代 JSON 返回），**屬抓取失敗、唔係原文無內容**。可用 [[project-playwright-mcp|Playwright MCP]] fallback backfill：
- `r/all/top` — 跨域 zeitgeist
- `r/wallstreetbets/top` — 散戶 finance sentiment
- `r/worldnews/top` — 國際 mainstream sentiment
- `r/MachineLearning/top` — ML researcher 角度
- `r/LocalLLaMA/top` — open-source LLM scene

### X (Twitter) trending — **未能抓取**

X 需 login／需 Playwright；今日未跑。

---

## 中文圈（CN 簡體 → 已用 OpenCC s2hk 轉正體 HK）

### bilibili 熱門（前 10 top by 播放量）

| # | 標題 | 區 | 播放量 | UP 主 |
|---|------|----|--------|-------|
| 1 | 鲁豫對話蔡磊段睿：只要不放棄，四面八方都是前方 | 人文歷史 | 275 萬 | 陳魯豫 - 慢談 |
| 2 | 《釋放阿凡達 (Unleash the Avatar)》實機預告 | 單機遊戲 | 83 萬 | IGN 中國 |
| 3 | 有能的阿偉 | 影視剪輯 | 174 萬 | 神威 - 狗剩 |
| 4 | HOPICO × 蕭敬騰：曾經討厭自己的聲音 | 樂評盤點 | 235 萬 | HOPICO |
| 5 | 甄嬛多動症版 | 影視雜談 | 124 萬 | 泰褲辣 C 總 |
| 6 | 風生水起少年遊 — 江南時代（《燕雲十六聲》新章） | 影視剪輯 | 115 萬 | 燕雲十六聲官方 |
| 7 | 外星人來地球了，但遲到了一小會（AI 科幻短片《地球往事》）| 同人手書 | 72 萬 | 張拉燈 |
| 8 | ⚡對對子戰神特別篇⚡ | 鬼畜劇場 | 51 萬 | 洛溫阿特金森 |
| 9 | 秦始皇：你說徭役徭是吧？ | 明星綜合 | 105 萬 | 清風最夢 |
| 10 | 閃閃的兒科醫生 4 第 4 集：復活甲代理人 | 紀錄片／社會 | 190 萬 | bilibili 紀錄片 |

**Trend 觀察**：
- **AI 內容**：張拉燈 AI 短片《地球往事》上熱門 → AI 生成短片入主流創作。
- **歷史 / 人物對話**：陳魯豫 × 蔡磊（前京東副總，現渐冻症 (ALS) 病人轉做 ALS 科研），人物深度訪談類繼續走紅。
- **遊戲**：《燕雲十六聲》（網易）江南 expansion / 《釋放阿凡達》（印度題材）齊上榜。
- **鬼畜／改編**：甄嬛多動症版／秦始皇徭役 reaching 100+ 萬播放 → 經典 IP 二創 evergreen。

### 微博熱搜 — **未能抓取**

微博 hotSearch API 需登入 cookie；curl 返空 response。可用 [[project-playwright-mcp|Playwright MCP]] backfill。

---

## 港圈

### LIHKG 熱門（前 10 by 即時 activity，非分區）

按 LIHKG `topics` 頁 snapshot（無公開「熱門投票」排序，下面係即時新貼／頁面前 10）：

1. **東張西望討論區 (330)** — TVB 旗艦 reality／時事 show 長期熱貼。
2. **【超級黐線 HAVERTZ】阿仙奴 25-26 英超冠軍討論區 IVCVIII** — 阿仙奴 (Arsenal) 球迷主帖（34+ 頁）。
3. **\[本地足球\] 2026/27 港超聯、亞冠二及香港隊討論區 (1)** — HK 本地足球 ongoing.
4. **有線寬頻擬改名為周大福媒體娛樂** — 鄭家純（周大福）旗下擬改名有線寬頻；媒體 / 家族企業議題。
5. **48 歲清潔工欠債百萬愧對家人 到尚未入伙屋苑單位燒炭亡** — HK 在地慘劇，社會議題（債務／心理健康）。
6. **想畫套香港隊可以拎到世界盃冠軍漫畫** — 創作打趣帖。
7. **突發，中大 email 自爆中咗 HPV** — 中大 (CUHK) email 烏龍 / privacy 事件。
8. **南韓女消防員被迫陪酒後跳樓亡 總統李在明 (Lee Jae-myung) 震怒下令徹查** — 南韓社會議題；連登轉發。
9. **有冇師兄係四十歲後先開始好境 D？** — 中年 reset 故事帖。
10. **墨西哥毒犯點解唔係世界盃綁架啲球星** — 連登式調侃帖。

**Trend 觀察**：
- **TVB／本地媒體**：東張西望／有線寬頻改名同步上榜 → 媒體生態變動 ongoing。
- **本地慘劇**：清潔工燒炭、中大 HPV email、南韓女消防員 — 社會議題持續登版。
- **足球**：阿仙奴 + 港超聯 + 玩笑帖共存。
- **個人發展／網絡 meme**：40 歲後 reset、墨西哥毒犯調侃帖 — 連登 baseline 風格。

### X HK trending — **未能抓取**

需 Playwright + login。今日 skip。

---

## My Take（cross-platform 觀察）

- **AI 渗透 mainland 創作**：bilibili 第 7 條張拉燈 AI 短片進入百萬播放 → 中國創作者 AI tool adoption 加速；同 [[Digest/2026-06-23/AI|AI digest]] 嘅 model 戰況呼應。
- **港台社會議題分歧**：HK 連登重 local 慘劇／媒體變動／個人 reset；國際／AI 動態反而較少（會走 X／reddit）。
- **遊戲 zeitgeist**：HN Steam Machine（536 萬美元級 PC 主機）+ bilibili 兩單機遊戲短預告 → console / PC 中間地帶 trends globally。
- **預測市場誠信**：HN Polymarket 灌水 + Trump 倒影池 narrative warfare 同步 → 信息戰／market manipulation 議題 cross-platform。

## 抓取 status / Backfill todo

| Source | Status | Backfill 方法 |
|--------|--------|---------------|
| Hacker News | ✅ 已抓 | n/a |
| LIHKG | ✅ 已抓 | n/a |
| bilibili | ✅ 已抓 (JSON API) | n/a |
| Reddit | ❌ 抓取失敗（curl/defuddle 403） | Playwright MCP fetch + parse |
| 微博熱搜 | ❌ 抓取失敗（需登入） | Playwright + login session |
| X trending | ❌ 未試 | Playwright + login session |

## Related

- [[Digest/2026-06-23/Finance|Finance 2026-06-23]]
- [[Digest/2026-06-23/International|International 2026-06-23]]
- [[Digest/2026-06-23/AI|AI 2026-06-23]]
- [[Digest]] (hub)
- [[project-playwright-mcp]] — Playwright fallback reference
