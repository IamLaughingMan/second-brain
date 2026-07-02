---
type: idea
stage: 未做
status: active
para: inbox
created: 2026-07-03
updated: 2026-07-03
tags:
  - idea
  - personal
  - polymarket
  - crypto
  - weather-market
  - trading-bot
---

# Polymarket 天氣盤 niche 專精（斷浪例）

**Edge 路線 B（3 選 1）**：唔跟大戶、唔求全，而係**專攻一個你有真實優勢嘅子市場**（天氣盤），買被低估嘅低價合約。

## 念頭來源
斷浪（@waveking1314）拆解一個天氣盤 niche 錢包：只做天氣市場、專買 5¢–30¢ 低價合約，一週 $3,491（262 預測、最大單筆 $543）。玩法＝市場低估某天氣結果機率、合約平，趁平買入食正期望值。
- [[斷浪 — Polymarket 天氣盤 niche 錢包（5¢–30¢ 低價合約）(X)]]
- [[0Xkook — Polymarket 上海溫度盤 wallet（95% 勝率 169 交易）(X)]]——更極端專精（**單一城市：上海溫度**，95% 勝率、169 交易、$5,367），印證「交易定價偏差、唔賭結果」。

## 核心假設
天氣市場有**客觀可得嘅預報數據**（氣象模型）→ 若你嘅機率估計勝過市場 consensus，低價合約有正期望值。Edge 來自「領域數據」而非「跟人」。

## ⚠️ 冷靜位
- 一週樣本細，可能運氣成分大。
- 需要**真實預報 edge**（拎到好過市場嘅氣象數據/模型），唔係人人有。
- Niche **容量有限**（天氣盤流動性/注碼上限低），賺唔到大錢。

## Next
- 掃 Polymarket 天氣市場嘅**成交量/流動性**，睇容量夠唔夠玩。
- 試搵**公開氣象數據源**（NOAA/ECMWF 等），評估對比市場 consensus 有冇系統性 edge。
- 可用 [[Polymarket LLM-reasoning bot（叫 Claude 分析落注 · Robot Traders）]] 嘅 pipeline 自動評估天氣盤。

## 相關（sibling edges）
- [[Polymarket copy-trading（跟聰明錢 wallet · 71x）]] — 路線 A（copy-trade）
- [[Polymarket LLM-reasoning bot（叫 Claude 分析落注 · Robot Traders）]] — 路線 C（LLM 判斷）
- [[Ideas]] hub
