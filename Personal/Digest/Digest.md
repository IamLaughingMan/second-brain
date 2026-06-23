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

每日 3 類新聞精煉：**Finance**（台美股／加密／macro）／**International**（地緣／政策／大事件）／**AI**（model／paper／industry）。一日一夾，每夾 3 個檔，方便 parallel query。

## 結構

```
Personal/Digest/
├── Digest.md               # 本 hub
└── <YYYY-MM-DD>/             # 一日一 subfolder
    ├── Finance.md            # 台美股／crypto／央行／macro
    ├── International.md      # 地緣／政策／大事件
    └── AI.md                  # model release／paper／industry move
```

## ⚠️ Filename 唯一性例外

跟 vault `Domain typed-folder pattern` 嘅 filename uniqueness exception 原則：每日 subfolder 內三個檔（`Finance.md`／`International.md`／`AI.md`）會喺多日重複出現，**唔算撞名 violation**，但 wikilink 必須**用 path 限定**：

```markdown
[[Digest/2026-06-23/Finance|Finance 2026-06-23]]
[[Digest/2026-06-23/International|Intl 2026-06-23]]
[[Digest/2026-06-23/AI|AI 2026-06-23]]
```

唔可以淨用 `[[Finance]]`（會 ambiguous）。

## Source pool

| 領域 | 主 source | 備用 |
|------|-----------|------|
| Finance | [[鉅亨網 — 頭條新聞 cnyes（TW 金融全方位新聞 portal）\|鉅亨網 cnyes]] | Bloomberg／WSJ／Yahoo Finance |
| International | BBC World / Reuters | The Guardian／NYT World／NHK |
| AI | Hacker News (`news.ycombinator.com`) | The Information／Decoder／OpenAI/Anthropic blogs／HuggingFace daily |

## Frontmatter convention

每個 daily category file 用：

```yaml
---
type: digest
category: Finance | International | AI
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

## 流程

1. 使用者話「digest today」／「digest <date>」/ 「today's news」等指令
2. Claude 抓 source pool（defuddle／WebFetch）
3. 撰 3 個 category 檔
4. Append 一行去 [[Digest log]]（呢度將來起，初期暫用本檔 `## Log` section）
5. Commit（Personal/ 屬 auto-commit 範圍外，手動 commit）

## Log

| 日期 | Finance | International | AI |
|------|---------|---------------|-----|
| 2026-06-23 | ✅ | ✅ | ✅ |

## Related

- [[Ideas.md\|Personal Ideas]] —— 同 root cluster
- [[英文 vocab\|English Vocab]] —— 同 Personal cluster
- [[冷知識]] —— 同 Personal cluster
- [[鉅亨網 — 頭條新聞 cnyes（TW 金融全方位新聞 portal）]] —— Finance 主 source
