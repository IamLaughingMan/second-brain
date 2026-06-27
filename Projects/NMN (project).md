---
type: project
para: project
domain: nmn
title: "NMN"
status: active
created: 2026-06-24
updated: 2026-06-27
code_path: "~/AI/Claude/nmn-2026-06-24"
tags:
  - project
  - business
  - nmn
related:
  - "[[Projects]]"
  - "[[NMN]]"
  - "[[Business]]"
---

# Project: NMN

← [[Projects]] ・ 知識層 → [[NMN]] ・ overview → [[Business/NMN/overview|overview]]

## Goal
做 NMN 補充品電商/零售生意。由 sourcing → 產品/法規 research → 上架銷售。

## Background
NMN(Nicotinamide Mononucleotide)= 長壽/抗衰老補充品。新開 project,知識層喺 vault `Business/NMN/` compounding,檔案本體喺 repo folder。

## Current Status
**策略 + web 層已建(V2,2026-06-27)。** 品牌 = **HYGIEIAS**(US 市場、masstige decoded-commodity、Direction A 臨床透明)。4 份 strategy deliverable 喺 `Business/NMN/`(brand brief / brand story / offer architecture / PDP copy),配套 web build 喺 repo `web/`(home + capsule PDP + preview tool)。實數已落:原料 $0.18/g、landed COGS capsule $6.85(GM 80%)/ powder $20.50(GM 54%)、≥99% 純度、cGMP + NDIN。**今日 V1→V2 重做(effort xhigh)**:法規收緊到 2025-12 FDA 實況、claims-safe 教育用真 citation、競品 $/g 用真 web data、劑量 open question 收尾。**仲未做:** sourcing 落實、Amazon 履約費、真 COA/lab 名。

## Key Decisions
- **Model B 三件對應** — 外部 folder(檔案)↔ 本控制頁(actionable)↔ `Business/NMN/`(知識),frontmatter 互指。
- **Business/ 自成知識層** — 平 `wiki/`、自己一套 Karpathy 機制,business 同個人 wiki 分開;已入 auto-commit hook scope。
- **品牌策略 spine** — Clinical Transparency / Decoded Commodity(The Ordinary 模式);Direction A「Lab Sheet」視覺;claims-safe(誠實講證據 emerging,禁 disease claim)。
- **V1/V2 版本制(2026-06-27)** — 重做時舊版存檔入 `V1/`(vault 用 `(V1)` suffix + `status: archived`;repo 用 `web/V1/`),新版佔 canonical 名做 live。

## Important Links
- 知識 hub:[[NMN]]
- 外部 folder:`~/AI/Claude/nmn-2026-06-24/`(`docs/` `suppliers/` `products/` `research/`)

## Related Files
- Repo folder: `~/AI/Claude/nmn-2026-06-24/`
- Supplier files / 報價 / COA / 合約:落 repo `suppliers/`、`docs/`、`products/`

## Claude Instructions
- 香港中文語氣;整理保留原意;不自動刪未確認資料;不確定先標「To confirm」;supplier email 清楚禮貌直接。
- Knowledge / 決策落 vault(本頁 + `Business/NMN/`),repo 只放檔案本體。

## Open Questions
- [x] ~~目標市場~~ → **美國 / 北美**(2025 FDA 逆轉,timing 啱)
- [x] ~~起步渠道~~ → **Shopify 自家站 + Amazon 履約(MCF)**;NMN 已重返 Amazon(2025-12)
- [ ] **Sourcing:原料 NDIN 鏈** — 現有 G1/G3 係咪覆蓋喺 accepted NDIN(SyncoZymes #1247 / Kingdomway #1259)?否則要自 file。
- [ ] **Founder 取向** — 實名出面 vs 公司口吻(實名 = 信任大躍升)。

## Next Actions
- [ ] **Sourcing:** 確認原料 NDIN 鏈 → 開第一個 supplier 頁(`suppliers/`)
- [ ] **履約定價:** 攞 Amazon MCF/FBA per-unit 報價 → 鎖死 contribution → 計 CAC 上限
- [ ] **真 assets:** 攞 COA(lab 名 + batch)、cGMP 廠名 → 換走 web/PDP 嘅 `[…]` placeholder
- [ ] **concept 頁:** NMN 是什麼 / NMN vs NR(把 PDP 教育段 compile 上 `Business/NMN/`)

## Outputs Worth Keeping
- **4 份 strategy deliverable(V2)** — [[Brand & Web Design Brief]]・[[Brand Story & Proof]]・[[Offer Architecture]]・[[PDP — Capsule (wireframe + copy)]]
- **Web build** — `web/index.html`(home)・`web/pdp-capsule.html`(PDP)・`web/preview.html`(preview tool);V1 存檔 `web/V1/`

## Log
- 2026-06-24：建立 project —— 外部 folder + vault Business/NMN 知識層 + 控制頁,三者 Model B 互指。
- 2026-06-27：**V1→V2 重做(effort xhigh)**。舊版存檔(vault `NMN/V1/` + repo `web/V1/`);4 份 strategy deliverable + 3 web 頁重建。新增 web research:2025-12 FDA NDI 實況(SyncoZymes #1247 / Kingdomway #1259)、真競品 $/g、真 citation(Fukamizu 2022 / Wen 2024),劑量 open question 收尾(300mg/日有 2022 試驗)。
