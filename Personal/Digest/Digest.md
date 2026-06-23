---
type: moc
title: Daily Digest
para: area
status: active
created: 2026-06-23
updated: 2026-06-23
tags:
  - moc
  - digest
  - daily
  - personal
---

# Daily Digest（每日新聞精選）

每日 4 類新聞精煉：**Finance**（台美股／加密／macro）／**International**（地緣／政策／大事件）／**AI**（model／paper／industry）／**Trending**（三圈混合 Top 5：英文圈 HN+Reddit+X、中圈 bilibili+微博、港圈 LIHKG）。一日一夾，每夾 4 個檔，方便 parallel query。

## 結構

```
Personal/Digest/
├── Digest.md               # 本 hub
└── <YYYY-MM-DD>/             # 一日一 subfolder
    ├── Finance.md            # 台美股／crypto／央行／macro
    ├── International.md      # 地緣／政策／大事件
    ├── AI.md                  # model release／paper／industry move
    └── Trending.md             # 三圈混合 top 5 (HN/Reddit/X+bilibili/微博+LIHKG)
```

## ⚠️ Filename 唯一性例外

跟 vault `Domain typed-folder pattern` 嘅 filename uniqueness exception 原則：每日 subfolder 內四個檔（`Finance.md`／`International.md`／`AI.md`／`Trending.md`）會喺多日重複出現，**唔算撞名 violation**，但 wikilink 必須**用 path 限定**：

```markdown
[[Digest/2026-06-23/Finance|Finance 2026-06-23]]
[[Digest/2026-06-23/International|Intl 2026-06-23]]
[[Digest/2026-06-23/AI|AI 2026-06-23]]
[[Digest/2026-06-23/Trending|Trending 2026-06-23]]
```

唔可以淨用 `[[Finance]]`（會 ambiguous）。

## Source pool

| 領域 | 主 source | 備用 |
|------|-----------|------|
| Finance | [[鉅亨網 — 頭條新聞 cnyes（TW 金融全方位新聞 portal）\|鉅亨網 cnyes]] | Bloomberg／WSJ／Yahoo Finance |
| International | BBC World／Reuters | The Guardian／NYT World／NHK |
| AI | Hacker News (`news.ycombinator.com`) | The Information／Decoder／OpenAI/Anthropic blogs／HuggingFace daily |
| Trending — 英文圈 | Hacker News (non-AI top) | Reddit (r/all r/wsb r/worldnews r/ML r/LocalLLaMA — Playwright needed)／X trending (Playwright + login) |
| Trending — 中圈 | bilibili 熱門（JSON API） | 微博熱搜 (Playwright + login) |
| Trending — 港圈 | LIHKG topics | X HK trending (Playwright + login) |

## Frontmatter convention

每個 daily category file 用：

```yaml
---
type: digest
category: Finance | International | AI | Trending
date: YYYY-MM-DD
sources:
  - <url1>
  - <url2>
status: active
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags:
  - digest
  - <category>
  - <date>
---
```

## 翻譯規矩

per [[feedback-translate-non-hk-to-zh-hk]]：

- **Body prose**：用正體中文（HK 寫法 + 廣東話語感）
- **Proper nouns**：第一次出現用 `中文 (原文)`，後文純中文。例：`勒科爾尼 (Lecornu)`／`杜林普 (Trump)`／`加沙 (Gaza)`／`滴露 (Dettol)`
- **保留原文**：純英文 brand identifiers（OpenAI／Anthropic／GPT-5.5／GLM-5.2／Bloomberg）／model 名／stock tickers／URLs／code／量詞單位
- **簡體 source** 先 OpenCC `s2hk` 再 swap mainland-only terms 去 HK
- **TW source**：可保留 TW 用語（輝達／殖利率／鎖漲停）配 `(英文)`，或用 HK alt name；揀一致即可

## 流程

1. 使用者話「digest today」／「digest <date>」/ 「today's news」等指令
2. Claude 抓 source pool（defuddle／WebFetch）
3. 撰 3 個 category 檔
4. Append 一行去 [[Digest log]]（呢度將來起，初期暫用本檔 `## Log` section）
5. Commit（Personal/ 屬 auto-commit 範圍外，手動 commit）

## Log

| 日期 | Finance | International | AI | Trending |
|------|---------|---------------|-----|----------|
| 2026-06-23 | ✅ | ✅ | ✅ | ✅ Playwright backfilled（X HK 服務缺失） |

## Related

- [[Ideas.md\|Personal Ideas]] —— 同 root cluster
- [[英文 vocab\|English Vocab]] —— 同 Personal cluster
- [[冷知識]] —— 同 Personal cluster
- [[鉅亨網 — 頭條新聞 cnyes（TW 金融全方位新聞 portal）]] —— Finance 主 source
