---
type: idea
stage: 可能開project
status: active
para: inbox
created: 2026-07-03
updated: 2026-07-03
tags:
  - idea
  - personal
  - crypto
  - polymarket
  - claude-code
  - trading-bot
---

# Polymarket copy-trading bot（Anthropic 工程師 71x 帖啟發）

由一個 viral 故事啟發嘅念頭：**用 Claude Code 整個 Polymarket copy-trading bot**——跟聰明錢、喺 whale 撤退前止盈。

## 念頭來源
Threads（@mini_littlechanges，中文轉述）＋ 原始 X viral 帖：一個「Anthropic 工程師」用 Claude Code 寫 Polymarket bot，$200 → $14,300（71x，幾週）。策略＝掃 8,600 萬宗交易 → 按勝率/利潤排 14,000 個 wallet → 每日約 10 單 copy-trade → whale 撤退前提早止盈。
- Bookmark（中文轉述）：[[mini_littlechanges — Anthropic 工程師 $200→$1.4萬 Polymarket bot（中文轉述）(Threads)]]
- Bookmark（原始出處）：[[Altcoin Buzz — Anthropic engineer $200→$14.3k Claude Code Polymarket bot（原始 viral 帖）(X)]]
- **另一路線（niche 專精，非 copy-trade）**：[[斷浪 — Polymarket 天氣盤 niche 錢包（5¢–30¢ 低價合約）(X)]]——只做天氣盤、買 5¢–30¢ 被低估合約，一週 $3,491（262 預測）。啟發：edge 可能喺「揀個你有優勢嘅冷門子市場」多過「跟大戶」。

## 點解值得諗
- 策略核心（wallet-ranking + copy + 提早離場）**概念可複製**，唔一定要「Anthropic 工程師」先做到——on-chain 數據公開、Polymarket 有 CLOB API。
- 正正撞正你手上 Claude Code 技能，係「AI agent 自動化」嘅實戰練習。

## ⚠️ 冷靜位（唔好上頭）
- **故事未經證實**：「an Anthropic engineer」係社媒 claim、**冇具名/冇 repo/冇證據**，可能誇大或半虛構。連原帖都警告「唔好信自動賺錢 bot，多數係 scam」。
- **賠率殘酷**：on-chain 顯示 **Polymarket 92.4% wallet 蝕錢**，成功故事係極端例外。
- **Survivorship bias**：按過去勝率排 wallet＝事後揀贏家，未來未必 work；「提早離場」有前瞻偏差。
- **法規/地區**：Polymarket 對美國人 geo-block（CFTC 和解）；你而家喺美西要留意。

## Open questions（decide 咗先 promote）
1. **Scope**：實盤落真錢？定先 paper-trade / 回測驗 edge？（傾向後者先）
2. **落腳**：獨立 code project（`~/AI/Claude/<name>-2026-07-03`）定併入 vault research？
3. **驗證**：有冇公開 dataset 重現 wallet-ranking？copy-trade 延遲/滑點食唔食晒 edge？

## Next
- 未定 scope，擺住做 idea。若決定認真做 → 跟 [[Ideas]] 嘅「可能開project → promote」流程開 `Projects/` 頁。傾向 **先 paper-trade/回測**，證實有 edge 先講真錢。
- **建置參考**：[[Robot Traders — Polymarket AI bot 叫 Claude 分析並交易（Python 教學）]]（~180 行 Python + 完整源碼；注意佢係 LLM-reasoning approach，同 viral 帖嘅 copy-trading 唔同，兩路線可混）。

## 相關
- [[Ideas]] hub
