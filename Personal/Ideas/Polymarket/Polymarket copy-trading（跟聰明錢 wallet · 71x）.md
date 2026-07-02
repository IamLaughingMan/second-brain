---
type: idea
stage: 完成
status: active
para: inbox
created: 2026-07-03
updated: 2026-07-03
tags:
  - idea
  - personal
  - polymarket
  - crypto
  - claude-code
  - trading-bot
  - copy-trading
---

# Polymarket copy-trading（跟聰明錢 wallet · 71x）

> ✅ **已 promote 入 project [[polymarket-autotrader]]**（路線 A）

**Edge 路線 A（3 選 1）**：由 on-chain 數據排 Polymarket wallet 勝率、**copy-trade 跟聰明錢**、喺 whale 撤退前止盈。

## 念頭來源
「Anthropic 工程師」viral 帖：Claude Code bot $200→$14,300（71x）。策略＝掃 8,600 萬交易 → 排 14,000 wallet 勝率/利潤 → 每日 10 單 copy → whale 離場前先走。
- [[mini_littlechanges — Anthropic 工程師 $200→$1.4萬 Polymarket bot（中文轉述）(Threads)]]
- [[Altcoin Buzz — Anthropic engineer $200→$14.3k Claude Code Polymarket bot（原始 viral 帖）(X)]]

## 核心假設
公開 on-chain 數據可重建 wallet 排名 → 揀高勝率 wallet 跟單 → 提早離場避免接火棒。

## ⚠️ 冷靜位
- 故事**未經證實**（無具名/repo）；Polymarket **92.4% wallet 蝕錢**。
- **Survivorship bias**：按過去勝率揀＝事後揀贏家，未來未必 work。
- Copy 有**延遲/滑點**，可能食晒 edge；「提早離場」靠偵測 whale 動作，實作難。
- 美國 geo-block（CFTC）。

## Next
- **先 paper-trade/回測**：抽 on-chain 交易史，回測「跟 top-N wallet」策略淨回報（計滑點/延遲）。有 edge 先講真錢。
- 可借 [[Polymarket LLM-reasoning bot（叫 Claude 分析落注 · Robot Traders）]] 嘅 API 起手碼落單。

## 相關（sibling edges）
- [[Polymarket 天氣盤 niche 專精（斷浪例）]] — 路線 B（niche 專精）
- [[Polymarket LLM-reasoning bot（叫 Claude 分析落注 · Robot Traders）]] — 路線 C（LLM 判斷）
- [[Ideas]] hub
