---
type: project
para: project
domain: projects
title: "polymarket-autotrader"
status: active
created: 2026-07-03
updated: 2026-07-03
code_path: "~/AI/Claude/polymarket-autotrader-2026-07-03"
tags:
  - project
  - polymarket
  - trading-bot
related:
  - "[[Projects]]"
---

# Project: polymarket-autotrader

← [[Projects]]

## Goal
真實 **Polymarket 自動交易 bot**。策略中立骨架，容納 3 條 edge 路線，**先 paper 後 live**——validated edge 先接真錢。

## Background
由一系列 viral 帖啟發（Anthropic 工程師 71x、天氣盤 niche、100-agent 賺 $180 萬）。3 條路線 = 3 條已拆 idea：
- **A copy-trading** — [[Polymarket copy-trading（跟聰明錢 wallet · 71x）]]
- **B weather-niche** — [[Polymarket 天氣盤 niche 專精（斷浪例）]]
- **C LLM-reasoning** — [[Polymarket LLM-reasoning bot（叫 Claude 分析落注 · Robot Traders）]]
實例/教學：`Bookmarks/Finance/Crypto/Polymarket/`（7 條）。

## Current Status
**Scaffold（2026-07-03）**：repo `git init` + `CLAUDE.md`/`README`/`.gitignore`/`.env.example`，首 commit `ce3ec5d`。未有 remote、未寫實作、未部署。

## Key Decisions
- **Paper-first**：先回測/paper-trade 驗 edge（計滑點/延遲/手續費）先講真錢。
- **策略中立骨架**：唔鎖單一路線，可先做一條（傾向先 C 或 B——有現成工具/最窄可驗）。
- **Python 起手**：`py-clob-client-v2` + `python-dotenv`（+ Anthropic SDK for C）。
- **Secrets 入 `.env`（gitignore）**，私鑰=資金全權。

## Important Links
- Repo: `~/AI/Claude/polymarket-autotrader-2026-07-03`
- 建置參考: [[Robot Traders — Polymarket AI bot 叫 Claude 分析並交易（Python 教學）]]（含 GitHub 源碼）

## Open Questions
- [ ] 先做邊條路線？（傾向 B 天氣盤最窄可驗 / C 有現成碼）
- [ ] 有冇公開 on-chain dataset 重建 wallet 排名（路線 A）？
- [ ] 天氣盤有冇公開氣象數據可造 edge（路線 B）？
- [ ] Geo-block（美西）點解決 API access？

## Next Actions
- [ ] 揀首個路線 + 定 paper-trade / 回測框架
- [ ] 跑 Robot Traders script 做 API 起手（sandbox / 極小注）
- [ ] 設 kill-switch / 倉位上限 / 每日蝕停（live 前必備）

## Log
- 2026-07-03：project 開，repo scaffold（commit `ce3ec5d`），由 [[Personal/Ideas/Polymarket]] 3 idea promote。
