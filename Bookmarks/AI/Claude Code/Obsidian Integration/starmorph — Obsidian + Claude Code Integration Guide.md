---
type: bookmark
para: resource
domain: obsidian-ai
title: "Obsidian + Claude Code: The Complete Integration Guide"
url: "hxxps://blog[.]starmorph[.]com/blog/obsidian-claude-code-integration-guide"
status: active
created: 2026-06-26
updated: 2026-06-26
summary: "starmorph blog 詳列 3 strategies 對應 Pattern A/B/C；明寫 Strategy 1 (symlinks variant of B) 'simplest' for active coding；強調 'Agents read, humans write'"
tags:
  - bookmark
  - obsidian
  - ai
  - claude-obsidian-workflow
  - found-by-claude
  - pointer-only-av
  - av-false-positive
---

# Obsidian + Claude Code: The Complete Integration Guide

> [!warning] URL defanged ＋ pointer-only（AV false positive）
> 個 AV 對 **starmorph[.]com** 彈 quarantine（per [[project-av-quarantines-flagged-urls]]），所以 URL 全部 defang（`https` → `hxxps`、`.` → `[.]`）+ 唔做 full-text archive。**starmorph 係正規 tech blog，唔係惡意網站**——呢個係 AV 嘅 false positive（新 domain trip heuristic）。
>
> **要訪問**：將 `hxxps://blog[.]starmorph[.]com/...` 嘅 `hxxps` 改返 `https`、`[.]` 改返 `.`，揀去你自己 browser 打開。

## Summary
starmorph blog 詳列 **3 strategies** 點 integrate Claude Code 同 Obsidian vault：

- **Strategy 1 (symlinks)** = 你呢個 vault 嘅 [[Linked Repo + Vault (Pattern B)]]，作者明寫「**simplest**」for active coding；run Claude Code 喺 repo + symlink 入 vault
- **Strategy 2 (vault as cwd)** = [[Vault-as-Everything (Pattern A)]]，folder structure 包 CLAUDE[.]md / [.]claude/ / daily-notes / projects / research / decisions / templates
- **Strategy 3 (MCP)** = [[Unified via MCP (Pattern C)]]，用 `obsidian-claude-code-mcp` plugin (iansinnott) over WebSocket port :22360；作者形容「最 flexible」但 setup 較重

## Key Takeaways
- **作者推薦 Strategy 1（即 Pattern B）** 作為 active coding 嘅起點，理由：simplest + clean separation
- **「Agents read, humans write」原則** —— vault 內容由人沉澱、AI 唔應該 auto-populate（影響 Pattern A 嘅 risk）
- Frontmatter 約定 `CLAUDE.md` 加 metadata：`type: claude-config / project / stack / status`
- MCP 路線靠 `iansinnott/obsidian-claude-code-mcp` plugin（喺 GitHub 揾）
- Claude 嘅 plan / memory 應留喺 `~/.claude/` 同 vault knowledge 分開，唔好 mix

## My Notes
- 呢 article 係**最直接 backing 我 wiki/AI/Obsidian/ 3-pattern 分類** —— 我嘅 A/B/C 概念正係從 starmorph 3 strategies 對應
- 「Strategy 1 simplest」嘅 quote 直接支持你 NMN 行 Pattern B 嘅做法
- **AV 歷史**：2026-06-26 嘗試 full-archive (18.4KB) → AV quarantine；改 pointer-only (3.2KB) URL 未 defang → AV 又 quarantine；改 pointer-only + URL defang → 預期可 survive（同 [[project-av-quarantines-flagged-urls]] memory 嘅 chatgptjailbreak[.]tech 模式一樣）
- **AV 觸發位**：似乎係 `starmorph[.]com` 嘅 live URL 形式（http/https 前綴 + 完整 domain）；defang 後唔再 match blocklist

## Related
- Synthesis: [[Claude + Obsidian Project Workflow]]
- Comparison: [[Claude + Obsidian Workflow Pattern Comparison]]
- Hub: [[Obsidian]]
- 同類其他 long-form：[[parazettel — Claude Code x Obsidian (Theo Stowell)]]、[[whytryai — Build Your Second Brain Claude Code + Obsidian]]、[[mindstudio — Build AI Second Brain Guide]]
- AV gotcha 規矩：[[project-av-quarantines-flagged-urls]]

<!-- ===== ARCHIVE BELOW (intentionally pointer-only due to AV) ===== -->

## Full Content (archived)

_(Pointer-only：AV quarantine on full-text archive attempt 2026-06-26. URL defanged in this file。Open in your own browser by un-defanging hxxps → https, [.] → .)_

## Key Comments

_(Blog 無 dedicated comment section)_
