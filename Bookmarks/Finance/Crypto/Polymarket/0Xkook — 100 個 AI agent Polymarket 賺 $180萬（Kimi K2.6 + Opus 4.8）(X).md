---
type: bookmark
para: resource
domain: polymarket
title: "這哥們兒25歲，在 Polymarket 上用 100 個 AI 代理，硬生生幹了 180 萬美元"
url: "https://x.com/HuaXi46802/status/2072522951732412926"
author:
  - "[[0Xkook]]"
published: 2026-07-02
cover: "[[polymarket-100-ai-agents-x-cover.jpg]]"
summary: "0Xkook：25 歲用 100 個 AI agent 喺 Polymarket 賺 $180 萬。開 AI 集群——100 個 Kimi K2.6 agent 把 BTC 扔進幾千種市場場景瘋狂模擬，再由 Opus 4.8 逐個 review，只有數學上真有優勢先落單。LLM-reasoning 路線嘅進階多-agent Monte-Carlo 版。"
status: active
created: 2026-07-03
updated: 2026-07-03
related:
  - "[[Polymarket LLM-reasoning bot（叫 Claude 分析落注 · Robot Traders）]]"
tags:
  - bookmark
  - polymarket
  - prediction-market
  - crypto
  - ai-trading
  - ai-agent
  - multi-agent
  - claude-opus
  - kimi
  - x
---

# 0Xkook — 100 個 AI agent Polymarket 賺 $180 萬（Kimi K2.6 + Opus 4.8）

> [!info] Bookmark · polymarket domain · X（@HuaXi46802 0Xkook）
> LLM-reasoning 路線嘅**進階多-agent 版**：唔係單次問 Claude，而係 100-agent Monte-Carlo 模擬 + Opus 4.8 判官。歸入 [[Polymarket LLM-reasoning bot（叫 Claude 分析落注 · Robot Traders）]]。

## Summary
25 歲交易者聲稱用 **100 個 AI agent** 喺 Polymarket 賺 **$180 萬美元**。架構：開一個 **AI 集群**——**100 個 Kimi K2.6 agent** 同時把比特幣扔進**幾千種不同市場場景**瘋狂模擬，然後由 **Opus 4.8** 把每個結果過一遍，**只有數學上真正算出有優勢先落單**。＝ 大規模 Monte-Carlo 模擬 + LLM 判官 filter。

## Key Takeaways
- **多-agent 架構**：100× Kimi K2.6（跑場景模擬）+ Opus 4.8（審核/揀有數學優勢嘅）。
- **落單條件**：唔靠直覺，靠**幾千場景模擬算出正期望值**先出手。
- 比 Robot Traders 單次「問 Claude 一個市場」進階好多——係「模擬 + LLM 審核」流水線。

## My Notes
_(待補)_ — 呢個係路線 C（LLM-reasoning）嘅**天花板版本**：模擬幾千情境 + LLM ensemble 審核。要複製成本高（100 agent API 費 + BTC 場景模擬引擎）。⚠️ $180 萬 claim **未經證實**，Polymarket 92.4% 蝕錢；但「模擬→LLM 過濾正期望值」框架值得記低，可縮小版試（少 agent + 單一市場類）。

## Related
- Idea：[[Polymarket LLM-reasoning bot（叫 Claude 分析落注 · Robot Traders）]]
- 建置起手：[[Robot Traders — Polymarket AI bot 叫 Claude 分析並交易（Python 教學）]]
- Hub: [[Bookmarks]]

<!-- ===== ARCHIVE BELOW（全文 snapshot，triage 時可跳過）===== -->

## Full Content (archived)

**來源**：X《@HuaXi46802 0Xkook》· 2026-07-02 · <https://x.com/HuaXi46802/status/2072522951732412926>
**註**：X syndication endpoint 攞正文（簡體，已 s2hk 轉正；model 名 Kimi K2.6／Opus 4.8 保留原文）；附影片＋一張圖。

### 原文（逐字・已由簡轉正 s2hk）
這哥們兒25歲，在Polymarket上用100個AI代理，硬生生幹了180萬美元。

他不是一個人在交易，而是直接開了一個AI集羣。100個Kimi K2.6代理同時把比特幣扔進幾千種不同的市場場景裏瘋狂模擬，然後讓Opus 4.8把每一個結果過一遍。只有數學上真正算出來有優勢的，才會真正下單。

## Key Comments
留言未能抓取（X login wall）。
