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
| Powder 100g | **$44.95** ✅ | **$38.20** | — | **~$0.45 → $0.38** ✅ |

- Capsule $/g 必然高(encapsulation 溢價 + 總量低)→ 正常,便利客埋單。
- **Powder $/g ~$0.45 = 抵用 hero number**,殺多數 capsule 對手。
- ✅ **Powder margin 警報解除**(raw NMN 實際 $0.18/g,非 $0.3–1.0):$44.95 健康賺(見 §6)。
- 可選:powder 劈到 **$39.95** 換更鋒利 $/g($0.40)、GM 仍 ~49% —— 但 $44.95 留多 margin,$/g 已夠殺。

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

## 6. Margin model

### 已知:原料 NMN 成本（2026-06-24 記錄）
| Grade | 用途 | 數量 | 總額 | $/kg | $/g | 可做單位 | 每單位原料 |
|---|---|---|---|---|---|---|---|
| **G1 powder** | Powder SKU | 104 kg | $18,720 | $180 | **$0.18** | ~1,040 包(100g) | **$18.00** |
| **G3 capsule** | Capsule SKU | 38 kg | $6,840 | $180 | **$0.18** | ~2,111 樽(18g) | **$3.24** |
| 合計 | | 142 kg | **$25,560** | | | | |

> 兩 grade 同價 $180/kg。**待補:G1 / G3 純度 %**(spec sheet / COA 要用,亦解釋點解分兩 grade)。

### Margin（NMN 原料 = 實數;其餘為估算,待你補)
```
Contribution = Retail − landed COGS − 付款費(~3% + $0.30) − fulfillment(US ~$5)
```
| | Capsule $34.95 | Powder $44.95 |
|---|---|---|
| NMN 原料(實) | $3.24 | $18.00 |
| 其餘(膠囊/樽/袋/標/入樽,**估**) | ~$3.8 | ~$2.5 |
| **landed COGS(估)** | **~$7** | **~$20.5** |
| **毛利 GM%**(扣 COGS) | **~80%** | **~54%** |
| 訂閱價 GM%(−15%) | ~77% | ~46% |
| Contribution(扣費+運,one-time) | ~$21.6 (62%) | ~$17.8 (40%) |

**結論:兩隻都健康賺,powder 唔蝕。** Capsule margin% 高(便利溢價);powder margin% 低啲但正常(bulk-value),靠 $/g 同訂閱回購補。

**要你補(定死全 COGS):** 空膠囊(60 粒)・樽+蓋 ・powder 袋/罐 ・標籤 ・入樽/入袋 labor ・進口運費。→ 補齊即定死價、算 break-even 單位數。

## 7. 待定 / 下一步
- 服用劑量:capsule 1 粒(300mg/日,60 日)定 2 粒(600mg/日,30 日)?影響 $/日 message。
- 之後加 SKU:可考慮 capsule+powder「starter bundle」(試 + 囤)。
- 下一步(methodology 步驟 3):**Proof inventory** —— COA / cGMP / 創辦人 / NDIN 證明盤點。

## Log
- 2026-06-24:Offer architecture v0.1(draft)。SKU A capsule 300mg×60 / SKU B powder 100g;credible-value 定價;訂閱 −15%;待 COGS 定死、驗 powder margin。
- 2026-06-24:記錄原料 NMN 成本 —— G1 powder 104kg/$18,720、G3 capsule 38kg/$6,840(同 $180/kg = $0.18/g)。Powder margin 警報解除(GM ~54%);待補包裝/入樽/運費定死全 COGS。
