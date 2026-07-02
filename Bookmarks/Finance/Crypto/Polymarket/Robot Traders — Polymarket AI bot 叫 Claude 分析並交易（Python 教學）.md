---
type: bookmark
para: resource
domain: polymarket
title: "Automated Polymarket AI Bot: Let Claude Analyse Markets and Trade for You"
url: "https://robottraders.io/blog/polymarket-ai-bot-claude-python"
author:
  - "[[Robot Traders]]"
published: 2026-03-22
cover: "[[polymarket-claude-bot-robottraders-cover.jpg]]"
summary: "Robot Traders 技術教學：~180 行 Python bot，把 Polymarket 市場問題丟畀 Claude API（開 web-search tool）分析、按信心度落注或跳過。附完整 GitHub 源碼 + YouTube。屬「LLM 推理判斷」approach，與 viral 71x 帖嘅 wallet copy-trading 不同——係開 project 嘅實際建置參考。"
status: active
created: 2026-07-03
updated: 2026-07-03
related:
  - "[[Polymarket LLM-reasoning bot（叫 Claude 分析落注 · Robot Traders）]]"
tags:
  - bookmark
  - polymarket
  - claude-code
  - claude-api
  - python
  - trading-bot
  - prediction-market
  - crypto
  - tutorial
  - found-by-claude
---

# Robot Traders — Polymarket AI bot 叫 Claude 分析並交易（Python）

> [!info] Bookmark · polymarket domain · robottraders.io（found-by-claude）
> Reference-grade 建置教學。**⚠️ 同 viral 71x 帖唔同 approach**：呢個係「叫 Claude 讀市場問題→web search→按信心落注」（LLM 推理），viral 帖嗰個係 wallet copy-trading（跟聰明錢）。兩者都係開 project 可參考嘅路線。

## Summary
Robot Traders 嘅 Python 教學：一個 **~180 行單檔 script**，把任何 Polymarket 市場 URL 丟畀 **Claude API**（開 **web-search tool**）—— Claude 上網 research、對市場問題形成 verdict，bot 再按信心度**落注或跳過**。Prompt 刻意通用（crypto／政治／體育都 work）。附完整源碼、Polymarket Python SDK、Anthropic tool-use/web-search 文件、YouTube walkthrough。係「LLM 推理判斷」路線（非規則掃描、非 copy-trading）。

## Key Takeaways
- **架構**：貼 market URL → `ask_claude`（web search + reasoning）→ 按 confidence 決定買/skip；單檔 Python ~180 行。
- **3 個 credential**（放 `.env`、勿入 git）：Polymarket `PRIVATE_KEY` + `FUNDER_ADDRESS`（Polygon；email 戶經 Magic.Link export，`SIGNATURE_TYPE=1`）＋ `ANTHROPIC_API_KEY`（platform.claude.com）。
- **成本**：Claude API 按用量收費（開 web search 每 call 有費），要先買 credit。
- **依賴/資源**：`py-clob-client-v2`、`python-dotenv`；源碼 `github.com/RobotTraders/bits_and_bobs/polymarket_ai_bot.py`；片 `youtu.be/IzhC4uY8tgc`；接前作 `polymarket-trading-bot-python`（規則掃描版）。
- **風險**：credential = 你資金全權，勿入版控；此文無誇大回報 claim（≠ viral 帖）。

## My Notes
_(待補)_ — 開 idea [[Polymarket LLM-reasoning bot（叫 Claude 分析落注 · Robot Traders）]] 嘅實際建置參考。**要留意 approach 分野**：想複製 viral 帖嘅 71x＝要行 **copy-trading**（掃 on-chain wallet、排勝率、跟單），呢篇係 **LLM-reasoning**（叫 Claude 逐市場判斷）——兩條路線可混（例如用 LLM 篩 copy-trade 訊號）。呢篇勝在有齊源碼＋credential 設定，做 paper-trade / API 起手最快。

## Related
- Idea：[[Polymarket LLM-reasoning bot（叫 Claude 分析落注 · Robot Traders）]]
- Viral 帖（copy-trading approach）：[[mini_littlechanges — Anthropic 工程師 $200→$1.4萬 Polymarket bot（中文轉述）(Threads)]] · [[Altcoin Buzz — Anthropic engineer $200→$14.3k Claude Code Polymarket bot（原始 viral 帖）(X)]]
- Hub: [[Bookmarks]]

<!-- ===== ARCHIVE BELOW（全文 snapshot，triage 時可跳過）===== -->

## Full Content (archived)

**來源**：robottraders.io《Automated Polymarket AI Bot: Let Claude Analyse Markets and Trade for You》· 作者 Robot Traders · 發佈 2026-03-22 · 閱讀 ~15 分鐘 · <https://robottraders.io/blog/polymarket-ai-bot-claude-python>
**註**：WebFetch 被站封（403），改 curl（browser UA）→ 本地 defuddle 抽取。長文＋截圖＋程式碼，下為實質重點；完整源碼在 GitHub、影片在 YouTube。

### 概念
規則掃描版 bot 靠 hard-code 規則決定買咩；此版讓 bot **讀市場問題、research、自行判斷**再落注：fetch 一個 prediction market → 把問題送畀 LLM（上網 + 推理）→ 按 model 信心度落注或跳過。成果＝**單檔 ~180 行 Python**，貼 market URL 就跑，Claude 負責分析；prompt 通用（crypto／政治／體育皆可）。

### Setup 與 Credentials（`.env`，勿入版控）
```
POLYMARKET_PRIVATE_KEY=your-private-key
POLYMARKET_FUNDER_ADDRESS=your-wallet-address
ANTHROPIC_API_KEY=your-anthropic-api-key
```
- **Polymarket**（Polygon 網絡）：email 戶私鑰由 Magic.Link 管理（Settings→Private Key→Start Export）；外部錢包（MetaMask/Ledger）自行 export。`SIGNATURE_TYPE`：0=EOA 錢包／1=email(Magic.Link，預設)／2=browser wallet proxy。錢包地址喺 Profile Settings（`0x…`）。
- **Anthropic**：platform.claude.com → API Keys → Create Key（只顯示一次）；按用量收費，需先買 credit。

### 資源
- 源碼：`github.com/RobotTraders/bits_and_bobs/polymarket_ai_bot.py`
- Polymarket Python SDK：`github.com/Polymarket/py-clob-client-v2`・文件 `docs.polymarket.com`
- Anthropic：Models Overview／Tool Use／Web Search Tool 文件
- 影片：`youtu.be/IzhC4uY8tgc`・前作（規則掃描版）：`/blog/polymarket-trading-bot-python`

## Key Comments
不適用（技術部落格，非社媒；文內無公開留言區）。
