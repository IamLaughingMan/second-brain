---
type: synthesis
domain: pkm
para: resource
title: "Recording Claude Conversations in Obsidian"
status: active
created: 2026-06-18
updated: 2026-06-18
tags:
  - pkm
  - obsidian
  - claude
  - conversation-logging
  - research
  - found-by-claude
---

# Recording Claude Conversations in Obsidian

> 研究：大家點用 Obsidian 記錄同 Claude 嘅對話（2026-06-18，雙 bucket：大神 + community + GitHub-by-stars）。本 vault 屬 **mixed-mode**——`wiki/` 部份跟 Karpathy ②蒸餾派、其他 root folder 各有邏輯（bookmark hybrid、inbox GTD、project PARA…），原始對話 archive 屬獨立 category（提議中嘅 `Claude history/`）。

## 核心：兩種對立哲學

| | ① 存原始對話（archive raw） | ② 蒸餾唔倒垃圾（distill, don't dump） |
|---|---|---|
| 做法 | 成段 chat 匯出 → markdown log，全文可搜 | 好答案先 compile 入 wiki，chat noise 掉 |
| 代表 | export 工具、Claude Vault、memory pipeline、`cctrace` | **Karpathy LLM Wiki**、本 vault `wiki/` 嘅「收工」workflow |
| 好處 | 完整、零遺漏、可 re-feed AI | wiki compounding、無雜訊 |
| 痛點 | vault 充斥低密度 chat、難搵 | 要人手 curate 邊句值得留 |

大神 bucket（**Karpathy** / **kepano**）明確企②：Karpathy「good answers can be filed back into the wiki」，raw chat 唔係資產；kepano file-over-app 重點係擁有 plain markdown。**本 vault 嘅 `wiki/` 部份係②派成熟實作**（收工蒸餾、raw/wiki 分層）；但 vault 並非單一哲學——其他 root folder 各有邏輯，原始對話 archive 可以行①派而**唔違反**整個 vault（因 ② 只 gate `wiki/`）。

## 四大類具體做法（community）

- **A. 瀏覽器一鍵匯出**（claude.ai 網頁對話 → md）：Chrome 擴充「Claude to Obsidian & Markdown Export」（保留 code、citation 轉 footnote）；Claude Vault（`claude-vault sync conversations.json`，離線 Ollama 自動 tag，共同 tag 生 wikilink）。
- **B. 監看資料夾自動匯入**：`GBAnjos/claude-sync-obsidian`（watch folder → 自動 import，保留結構）。
- **C. Claude Code 直接讀寫 vault（本 vault 用緊呢類）**：vault 目錄開 `claude`；「Save to Obsidian」Claude Code skill（session/plan/決策寫入，免 API）；2026 共識＝topical folder 勝 chronological、統一 frontmatter、重 query 多過 auto-log。
- **D. Claude 嵌入 Obsidian（plugin）**：`YishenTu/claudian`、`Roasbeef/obsidian-claude-code`（Agent SDK）等。⚠️ `AgriciDaniel/claude-obsidian` 本機已永久移除，勿返轉頭。
- **E. 對話當「記憶」pipeline**：`basicmachines-co/basic-memory`、`lucasrosati/claude-code-memory-setup`（export→process→import，frontmatter+tag+wikilink+graph）、Claude Code History Viewer（已 bookmark）。

## GitHub 高星 landscape（REST API by stars，2026-06-18）

**Karpathy 自建 KB（同本 vault `wiki/` 同派，最值參考其 CLAUDE.md / 結構）**
| ★ | repo |
|---|---|
| 2.97k | SamurAIGPT/llm-wiki-agent |
| 2.5k | eugeniughelbur/obsidian-second-brain |
| 1.5k | ballred/obsidian-claude-pkm（Obsidian+Claude Code PKM starter kit）|
| 1.2k | alchaincyf/obsidian-ai-orange-book（中文）|
| 400 | NicholasSpisak/second-brain（明言 based on Karpathy LLM Wiki pattern ＝本 vault `wiki/` 孖生）|
| 110 | helloianneo/obsidian-ai-second-brain（中文・4 階段 12 步）|

**工具層 / plugin / 記憶**
| ★ | repo |
|---|---|
| 36.0k | kepano/obsidian-skills（大神，**本 vault 已用**）|
| 12.9k | YishenTu/claudian（最高星 embed plugin）|
| 7.0k | AgriciDaniel/claude-obsidian（⚠️ 已移除）|
| 3.2k | basicmachines-co/basic-memory（對話持久記憶）|

**對話匯出工具（「記錄對話」最核心嗰類）**
| ★ | repo |
|---|---|
| 563 | agarwalvishal/claude-chat-exporter |
| **195** | **jimmc414/cctrace（匯出 Claude Code session → md+XML，最啱本 vault 補①派 raw archive 嘅 gap）** |
| 167 | ryanschiang/claude-export |

## Takeaway / 可補強

- 本 vault `wiki/` 有明確高星 peer（NicholasSpisak/second-brain、SamurAIGPT/llm-wiki-agent、ballred/obsidian-claude-pkm）→ 抄佢哋 `CLAUDE.md`／資料夾慣例最對路。
- 最啱「Claude Code 模式」嘅完整對話留底工具 ＝ **`cctrace`**——本 vault 想補 raw archive gap 時可直接套用（提議中 `Claude history/`）；唔需要將原始對話強行入 `wiki/`。
- 純網頁對話留底 → claudian / export script 類。
- **重要 framing**：raw archive 同 wiki compounding **唔對立**——前者係 audit／回顧層、後者係 compounding 知識層。Vault mixed-mode 容納兩者同時存在於唔同 root folder。

## Open / Next actions
- [ ] 深挖 peer vault `NicholasSpisak/second-brain` + `ballred/obsidian-claude-pkm` 嘅 CLAUDE.md，比對有冇好慣例可抄
- [ ] 試 `jimmc414/cctrace` 導 Claude Code session，評估補入「收工」流程（完整留底 vs 蒸餾）
- [ ] bookmark 3–4 條最值嘅 repo（`found-by-claude` + 全文預設）— 未做

## Sources
- https://github.com/kepano/obsidian-skills ・ https://github.com/YishenTu/claudian ・ https://github.com/SamurAIGPT/llm-wiki-agent ・ https://github.com/NicholasSpisak/second-brain ・ https://github.com/ballred/obsidian-claude-pkm ・ https://github.com/basicmachines-co/basic-memory ・ https://github.com/jimmc414/cctrace ・ https://github.com/agarwalvishal/claude-chat-exporter ・ https://github.com/alchaincyf/obsidian-ai-orange-book
- https://forum.obsidian.md/t/claude-vault-turn-your-claude-chats-into-a-knowledge-base-for-obsidian-free/109275
- https://www.savemarkdown.co/blog/claude-code-obsidian-knowledge-base-workflow/

## Related
- [[OBSIDIAN-SETUP]] ・ [[WIKI]] ・ Karpathy 方法論見 `Meta/docs/Karpathy LLM Wiki Pattern.md`
- [[Bookmarks]]（Claude Code History Viewer 已收）
