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
  - claude-api
  - python
  - trading-bot
---

# Polymarket LLM-reasoning bot（叫 Claude 分析落注 · Robot Traders）

**Edge 路線 C（3 選 1）**：唔靠 wallet 數據，而係**逐個市場問題丟畀 Claude**（開 web search）自行 research + 判斷，按信心度落注。

## 念頭來源
Robot Traders 教學：~180 行 Python，貼 market URL → `ask_claude`（web search + reasoning）→ 按 confidence 買/skip。有完整 GitHub 源碼 + 影片。
- [[Robot Traders — Polymarket AI bot 叫 Claude 分析並交易（Python 教學）]]（起手：單次問 Claude）
- **進階多-agent 例**：[[0Xkook — 100 個 AI agent Polymarket 賺 $180萬（Kimi K2.6 + Opus 4.8）(X)]]——100 Kimi K2.6 跑幾千場景模擬 + Opus 4.8 審核，只落數學上有優勢嘅單（$180 萬 claim 未證實，但「模擬→LLM 過濾正期望值」框架值得記）。
- **通用預測引擎（可借工具）**：[[0Xkook — BettaFish／MiroFish 多智能體預測引擎（Claude Code 建，陳天橋 3000萬投資）(X)]]——MiroFish「抽真實 seed→建平行世界模擬→預測」framework（Claude Code / Vibe Coding 建），可指向 prediction market；非 Polymarket 專屬工具。

## 核心假設
LLM + web search 對某類市場（有公開資訊、非純博彩）嘅機率判斷，勝過市場定價 → 有正期望值。最直接可跑（有現成碼）。

## ⚠️ 冷靜位
- **LLM 可能過度自信 / hallucinate**，confidence 未必 calibrated → 要驗 calibration。
- Claude API **按 call 收費**（開 web search 更貴），高頻會蝕手續費。
- Credential = 資金全權，`.env` 勿入版控。
- 未證實有 edge，市場可能已 price-in 公開資訊。

## Next
- 跑 Robot Traders script 做 **paper / 極小注**，記錄 Claude confidence vs 實際結果 → 計 **calibration / Brier score**，證有冇 edge。
- 呢個係**機制**，可反過來服務路線 A/B（用 LLM 篩 copy-trade 訊號、或評估天氣盤）。

## 相關（sibling edges）
- [[Polymarket copy-trading（跟聰明錢 wallet · 71x）]] — 路線 A（copy-trade）
- [[Polymarket 天氣盤 niche 專精（斷浪例）]] — 路線 B（niche 專精）
- [[Ideas]] hub
