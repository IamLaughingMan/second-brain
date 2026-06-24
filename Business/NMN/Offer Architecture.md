---
type: resource
domain: nmn
para: resource
title: "NMN — Offer Architecture (Phase 2 step 2)"
status: draft
created: 2026-06-24
updated: 2026-06-24
tags:
  - nmn
  - business
  - ecommerce
  - pricing
  - offer
related:
  - "[[NMN]]"
  - "[[NMN (project)]]"
  - "[[Brand & Web Design Brief]]"
  - "[[Ecommerce Website Build Methodology]]"
---

# NMN — Offer Architecture

> Methodology 步驟 2(conversion 第一因)。定位:**credible value ~$30–45**(masstige,不做最平)。市場 = 美國。
> 數字為 **draft,待 COGS 確認**(見 §6)。

## 1. SKU lineup + 角色

| SKU | 規格 | 總 NMN | 服數(1/日) | 角色 |
|---|---|---|---|---|
| **A — Capsule** | 300mg × 60 caps | 18 g | 60 日 | **入門 / 便利 / 信任起點**(易試、易送禮) |
| **B — Powder** | 500mg/服 · 100 g | 100 g | ~200 服 (~6.6 月) | **抵用 / $/g 殺手 / 進階回購** |

> 天然階梯:capsule 賣便利,powder 賣 $/g。**站內 $/g 對比自然把 powder 升級** —— 同時令 brand 顯得誠實(連「邊隻抵啲」都照講)。

## 2. 價格階梯（draft — 待 COGS）

| SKU | One-time | Subscribe (−15%) | $/日 | $/g |
|---|---|---|---|---|
| Capsule 300mg×60 | **$34.95** | **$29.95** | $0.58 → $0.50 | ~$1.94 → $1.66 |
| Powder 100g | **$44.95**〜$49.95 ⚠️ | **$38.20**〜 | — | **~$0.45 → $0.38** ✅ |

- Capsule $/g 必然高(encapsulation 溢價 + 總量低)→ 正常,便利客埋單。
- **Powder $/g ~$0.45 = 抵用 hero number**,殺多數 capsule 對手。
- ⚠️ **Powder 價未能定死** —— 100g 純 NMN 原料成本可能高(raw NMN landed 約 $0.3–1.0/g → 100g = $30–100 raw)。**$44.95 有機會 margin 負**,必須等你 COGS 先 confirm(見 §6)。

## 3. 透明 conversion 武器（非 dark pattern）
- **PDP 明寫 `$/serving` + `$/gram` + `$/day`**,並附**誠實對標表**(vs 平價底 / vs 透明溢價)。Value 客最食;平價底品牌通常唔敢擺。
- 純度 % + COA(可下載)放近價錢 → 把「平」重新定義為「同等/更純,只係無 marketing 溢價」。

## 4. Subscribe & save
- 一次性 + 訂閱(預設 **−15%**、**隨時取消**、可改頻率)。
- 補充品回購率高 → 訂閱拉 LTV;首單可疊「首次訂閱再 −10%」(誠實折扣,非假 urgency)。
- 技術:Shopify 原生 Subscriptions(或 Seal/Recharge,睇 app 取捨;原生免月費優先)。

## 5. Guarantee + shipping（預設,可 veto）
- **60 日 money-back**(空樽都收)→ 信心訊號,補充品濫用率低。
- **免運**:所有訂閱免運;一次性 **過 $39 免運**(US 境內)→ 推 capsule 客加購或上 powder。
- 國際運費 later。

## 6. Margin model（待你填 COGS）
```
Contribution margin = Retail − COGS − 付款費(~3% + $0.30) − fulfillment(US pick/pack/ship ~$4–7)
目標:blended 毛利(扣 COGS,未計運費/手續)≥ 70%
```
**要你提供(大概數即可):**
1. Capsule 300mg×60 **每樽 landed COGS**(原料+膠囊+樽+標+入樽,到你手)。
2. Powder 100g **每包 landed COGS**(原料+袋/罐+標)。
3. NMN raw **$/g**(NDIN-covered 供應商)—— 直接決定 powder 抵唔抵賣。

→ 收到即可定死兩個價 + 驗證 powder 唔蝕。

## 7. 待定 / 下一步
- 服用劑量:capsule 1 粒(300mg/日,60 日)定 2 粒(600mg/日,30 日)?影響 $/日 message。
- 之後加 SKU:可考慮 capsule+powder「starter bundle」(試 + 囤)。
- 下一步(methodology 步驟 3):**Proof inventory** —— COA / cGMP / 創辦人 / NDIN 證明盤點。

## Log
- 2026-06-24:Offer architecture v0.1(draft)。SKU A capsule 300mg×60 / SKU B powder 100g;credible-value 定價;訂閱 −15%;待 COGS 定死、驗 powder margin。
