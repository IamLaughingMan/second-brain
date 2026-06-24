---
type: resource
domain: business
para: resource
title: "Ecommerce Website Build Methodology (Claude)"
status: active
created: 2026-06-24
updated: 2026-06-24
tags:
  - business
  - ecommerce
  - methodology
  - shopify
related:
  - "[[Business]]"
  - "[[NMN (project)]]"
---

# Ecommerce Website Build Methodology

> 跨 product reusable。做任何 Shopify 品牌銷售站都跟呢套次序。源自 NMN project 對「ChatGPT design-first 流程」嘅批判 + reorder。

## 核心論點
**Offer + proof + 上線後迭代** 贏 conversion,**唔係**一份靚 brief。Visual direction 係**最遲、最平**嘅決定 —— 尤其 clinical-transparent 模式:**內容本身就係設計**。常見 AI(ChatGPT)流程把最唔重要嘅決定(3 visual directions)排第一,係 sequencing error。

## 排序對比

| 軸 | AI design-first 流程 | 本 methodology |
|---|---|---|
| 起點 | Visual direction (aesthetics) | Constraint + evidence(合法/收款/sourcing/offer/真 assets) |
| 最高槓桿 | Layout / 美學 | **Offer**(價、$/gram、保證、訂閱折、運費門檻) |
| Layout 來源 | 由「3 directions」憑空探索 | 偷已驗證 PDP 骨架,靠內容+字體克制差異化 |
| 交付單位 | 成個 site design | **一頁 PDP 先 ship** |
| Conversion 觀 | design property | 上線後靠數據賺返 |
| 閉環 | 一份 plan | plan → code → 驗證 → git → vault record |

## 流程（8 步）
1. **Kill-switch 先過**:合法性 / 收款 / 監管 sourcing(行業特定 gate)。
2. **Offer architecture**:定價、$/單位 對標、subscribe-&-save 折、運費門檻、退款保證、bundle。← conversion 第一因。
3. **Proof inventory**:盤點真 assets(認證 / 廠 / 創辦人 / 檢測)。決定可信度上限。
4. **內容/文案先行**:spec、規格、「點解平/點解值」、claims-safe 教育。= 透明模式嘅產品本體。
5. **偷骨架**:用已驗證品類 PDP anatomy(above-fold 價+加購 → proof → 規格 → why → reviews → FAQ → guarantee)。
6. **Visual**:把選定 direction 套落骨架(此時近乎自動)。
7. **Thin slice ship**:先整 hero PDP;乾淨 base theme + sections 客製;**狠控 app**(app = 慢+template feel+月費)。
8. **量度 + 迭代**:GA4 + heatmap → 數據改,唔係意見改。

## AI design-first 流程值得保留嘅好處
逼 role-clarity、反 generic guardrails、think-before-build 兩階段拆分。「3 directions」係正當技巧,只係要**喺 positioning 鎖死之後**先用。

## Claude Code 特有優勢
唔止畀 plan —— 可埋頭寫 Shopify theme/Liquid、Playwright 開 store 驗、git version、全程記 vault(Model B)。策略→running theme→迭代 = 閉環。

## Log
- 2026-06-24:建立(源自 NMN project process 討論)。
