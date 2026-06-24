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

### 已知:入樽廠成本（turnkey,客供 NMN;2026-06-24）
| SKU | 首批數量 | 入樽 $/單位 | 入樽小計 |
|---|---|---|---|
| Capsule | 2,000 樽 | $3.61 | $7,220 |
| Powder | 1,000 包 | $2.50 | $2,500 |
| 合計 | 3,000 | | **$9,720** |

> 假設 $3.61 / $2.50 = turnkey(空膠囊/樽/袋/標+入樽,**不含** NMN 原料,你自供)。**待 confirm 是否已含全部包材。**

### Landed COGS（NMN + 入樽 = 實數;履約另計）
```
Contribution = Retail − landed COGS − 付款費(~3% + $0.30) − Amazon 履約費(MCF/FBA, TBD)
```
| | Capsule $34.95 | Powder $44.95 |
|---|---|---|
| NMN 原料(實) | $3.24 | $18.00 |
| 入樽(實) | $3.61 | $2.50 |
| **landed COGS** | **$6.85** | **$20.50** |
| **毛利 GM%**(扣 COGS) | **80.4%** ✅ | **54.4%** ✅ |
| 訂閱價 GM%(−15%) | ~77% | ~46% |
| Contribution(估 Amazon 履約後,one-time) | ~$21.3 (61%) | ~$16.3 (36%) |

**結論:兩隻都健康賺。** Capsule margin% 高(便利溢價);powder 低啲但 bulk-value 正常,靠 $/g + 訂閱回購補。

### 履約:Amazon（存倉 + ship）
- 計劃用 **Amazon 做存倉 + 出貨**。Shopify 訂單 → 應用 **Amazon MCF（Multi-Channel Fulfillment）**;若同時上 Amazon marketplace 則 FBA。
- **MCF 費 > 標準 FBA 費**;按尺寸/重量計,粗估 capsule ~$5–6、powder(100g 較大)~$6–7。**確實數待 Amazon dimension 報價。**
- 衍生 channel 問題(later):純 Shopify vs Shopify + Amazon listing(NMN 已重返 Amazon)。

### 已投入 + break-even（產品成本層,未計 marketing/CAC)
- 原料 $25,560 + 入樽 $9,720 = **$35,280**(首批 3,000 單位;另加運去 Amazon + Amazon 費)。
- 潛在 gross revenue(全 one-time 價):2,000×$34.95 + 1,000×$44.95 = **$114,850**。
- 產品成本回本:約需賣 ~1,800 單位(/3,000)→ **餘量即利潤緩衝**。⚠️ 真正變數係 **marketing/CAC**(下階段)。

### 待補(完全鎖死)
1. Amazon MCF/FBA 實際 per-unit 費(尺寸/重量報價)。
2. 運原料/成品去 Amazon 倉嘅 inbound 費。
3. G1 / G3 純度 %(spec/COA 用)。

## 7. 待定 / 下一步
- 服用劑量:capsule 1 粒(300mg/日,60 日)定 2 粒(600mg/日,30 日)?影響 $/日 message。
- 之後加 SKU:可考慮 capsule+powder「starter bundle」(試 + 囤)。
- 下一步(methodology 步驟 3):**Proof inventory** —— COA / cGMP / 創辦人 / NDIN 證明盤點。

## Log
- 2026-06-24:Offer architecture v0.1(draft)。SKU A capsule 300mg×60 / SKU B powder 100g;credible-value 定價;訂閱 −15%;待 COGS 定死、驗 powder margin。
- 2026-06-24:記錄原料 NMN 成本 —— G1 powder 104kg/$18,720、G3 capsule 38kg/$6,840(同 $180/kg = $0.18/g)。Powder margin 警報解除(GM ~54%);待補包裝/入樽/運費定死全 COGS。
- 2026-06-24:記錄入樽廠 —— capsule 2,000 樽 ×$3.61、powder 1,000 包 ×$2.50(共 $9,720)。Landed COGS 定死:capsule $6.85(GM 80%)/ powder $20.50(GM 54%)。履約用 Amazon(MCF/FBA),per-unit 費待報。首批投入 $35,280 / 3,000 單位。
