---
type: resource
domain: nmn
para: resource
title: "NMN — PDP Capsule (wireframe + copy)"
status: archived
version: v2
created: 2026-06-24
updated: 2026-06-27
tags:
  - nmn
  - business
  - ecommerce
  - pdp
  - copy
  - wireframe
related:
  - "[[NMN]]"
  - "[[NMN (project)]]"
  - "[[Brand & Web Design Brief]]"
  - "[[Offer Architecture]]"
  - "[[Brand Story & Proof]]"
  - "[[PDP — Capsule (wireframe + copy) (V1)]]"
---

# PDP — HYGIEIAS NMN Capsules (300mg × 60)

> Hero PDP(產品詳情頁 / Product Detail Page)。Mobile-first 單欄。視覺 = Direction A(Lab Sheet / clinical transparency)。**`[…]` = 待補真數據**(lab 名、COA、cGMP 廠名)。
> V2(2026-06-27):**§6 教育換真 citation**(Fukamizu 2022 / Wen 2024)、**劑量收尾**(1 粒 = 300mg/日,有 2022 試驗)、**FAQ 法規答案用 2025-12 FDA 實況**。V1 → [[PDP — Capsule (wireframe + copy) (V1)]]。

## 視覺基調（Direction A,全頁通用)
- 色:紙白底 #FAFAF8 ・ 深藍 ink(取自 logo)#1B2A4A ・ 單一 accent CTA(深藍實底 or 安全橙)・零 gradient。
- 字:grotesk body + **mono 做所有數據**(mg / % / $/g)。
- 留白:結構化 —— hairline rules、spec table、密而有序。
- 圖:product-on-seamless、top-down、COA 當圖、膠囊微距。無 model、無 stock、無 lifestyle。

---

## Wireframe（mobile,由上而下)

```
┌─────────────────────────────┐
│ [≡]   HYGIEIAS         [🛒]  │  sticky header
├─────────────────────────────┤
│     [ product-on-white ]    │  1. HERO 圖(可左右掃 COA/膠囊微距)
│ NMN Capsules                │  H1
│ Nicotinamide mononucleotide │  sub
│ ┌────┐┌────┐┌──────┐┌─────┐ │  spec chips(mono)
│ │300mg││60ct││3rd-pty││NDI ✓│ │
│ └────┘└────┘└──────┘└─────┘ │
│ ( ) One-time      $34.95    │  price toggle
│ (•) Subscribe −15% $29.95   │  (subscribe 預選)
│     $0.50 / day · cancel any │
│ ┌─────────────────────────┐ │
│ │     ADD TO CART  →       │ │  CTA(高對比)
│ └─────────────────────────┘ │
│ cGMP · 3rd-party tested ·    │  trust micro-row
│ NDI-compliant · 60-day MBG  │
├─────────────────────────────┤
│ 2. SPEC SHEET(datasheet)    │  純度/劑量/servings/$g/$serving/clean label
│ 3. READ THE LAB REPORT      │  COA viewer + download + lab/batch
│ 4. WHAT YOU PAY FOR         │  誠實 $/g 對比表(vs premium / budget)
│ 5. HOW TO TAKE IT           │  1 粒/日 + 時機
│ 6. WHAT IS NMN(claims-safe)│  教育 + 真 footnote 引用
│ 7. WHY HYGIEIAS(故事 snippet)│  Hygieia / decoded + link About
│ 8. SUBSCRIBE & SAVE         │  −15% 機制
│ 9. 60-DAY GUARANTEE         │  空樽都收
│ 10. REVIEWS(誠實 cold-start)│  verified-only policy
│ 11. FAQ(手風琴)             │
│ FDA disclaimer · footer     │
└─────────────────────────────┘
 [ sticky bottom bar: $29.95 · ADD TO CART ]  ← mobile 常駐
```

---

## Copy（section-by-section,English customer-facing)

### 1. Hero
- **H1:** NMN Capsules
- **Sub:** Pure nicotinamide mononucleotide. Documented, third-party tested, fairly priced.
- **Spec chips:** `300 mg / capsule` · `60 capsules` · `Third-party tested` · `NDI-compliant`
- **Price:** One-time **$34.95** · Subscribe & Save **$29.95** (−15%, cancel anytime) · **$0.50 / day**
- **CTA:** ADD TO CART
- **Trust micro-row:** Made in a cGMP facility · Third-party tested · NDI-compliant ingredient · 60-day money-back

### 2. Spec sheet（datasheet block — mono)
| | |
|---|---|
| NMN per capsule | **300 mg** |
| Capsules | **60** (≈ 60-day supply at 1/day) |
| Purity | **≥ 99%** (per COA) |
| Form | Vegetable cellulose capsule |
| Price per serving | **$0.50** (subscribe) / $0.58 |
| Price per gram NMN | **$1.66** (subscribe) / $1.94 |
| Other ingredients | [None / rice flour — clean label, TBC] |
| Tested by | [Independent lab — name] |

### 3. Read the lab report
> Every batch is third-party tested for identity and purity. We don't ask you to take our word for it — read the report.
- [ COA viewer (embedded PDF) ] · **Download COA (PDF)** · Batch #[…] · Lab: [name]

### 4. What you pay for（誠實對比 — 非 dark pattern,用品類標籤非點名)
| | **HYGIEIAS** | Typical premium NMN | Typical budget NMN |
|---|---|---|---|
| Price / bottle | **$34.95** | $50–115 | $25–31 |
| NMN / serving | 300 mg | 250–1000 mg | 250–500 mg |
| Price / gram | **$1.94** | $1.20–3.90 | $1.10–2.10 |
| Purity stated | **≥ 99% ✓** | sometimes | rarely |
| Third-party COA shown | **Yes, on this page** | sometimes "on request" | rarely |
| NDI-compliant ingredient | **Yes** | varies | often unclear |
> We're not the cheapest. We're the one that shows you the lab report and skips the luxury markup. *(Powder option: **$0.45/g** — see the powder page.)*

### 5. How to take it
> Take 1 capsule daily (300 mg), with or without food. Many people take it in the morning. That's it.
> *(劑量依據:300 mg/日係人體試驗用過嘅劑量 — Wen 2024 系統回顧涵蓋嘅 RCT 區間 250–900 mg/日。)*

### 6. What is NMN?（claims-safe 教育 + 真 footnote)
> NMN (nicotinamide mononucleotide) is a precursor your body uses to make NAD⁺ — a coenzyme involved in cellular energy metabolism. NAD⁺ and its precursors are an active area of healthy-aging research. Human studies so far report good tolerability, with benefits that are still emerging and not yet conclusive.¹ ² We share the science so you can make an informed choice — not because we're making a promise about it.
>
> ¹ Fukamizu Y, et al. *Safety evaluation of β-nicotinamide mononucleotide oral administration in healthy adult men and women.* Scientific Reports, 2022. *(1250 mg/day for 4 weeks; safe and well-tolerated.)*
> ² Wen J, et al. *Improved Physical Performance Parameters in Patients Taking NMN: A Systematic Review of RCTs.* Cureus, 2024. *(10 trials, 437 participants; improvements were mostly not statistically significant; well tolerated.)*
> *(中性引用真研究,坦白講 emerging;**禁** "reverses aging / cures / treats" 字眼。)*

### 7. Why HYGIEIAS（故事 snippet)
> Named after Hygieia, the Greek goddess of health — prevention, not cure. We sell NMN we can document: cGMP-made, NDI-compliant, third-party tested. The milligrams, the purity, the price per gram — then you decide. → **Read our story**

### 8. Subscribe & Save
> Subscribe and save 15% on every order. Skip, change, or cancel anytime — no lock-in. Your NMN arrives before you run out.

### 9. 60-day money-back guarantee
> Try it for 60 days. If it's not for you, we'll refund you — even if the bottle's empty.

### 10. Reviews（誠實 cold-start)
> HYGIEIAS is new. Verified-buyer reviews will appear here as they come in. We will never post fake or incentivized reviews. [上線:用 verified-purchase 評價 app;未有評價前顯示此政策聲明,不留空、不作假]

### 11. FAQ
- **Is NMN legal to sell in the US?** Yes. In September 2025 the FDA confirmed NMN is not excluded from the dietary supplement definition, and in December 2025 it reinstated NMN's New Dietary Ingredient status. Our ingredient is NDI-compliant.
- **Why are you cheaper than premium brands?** No luxury markup and no celebrity marketing — same documented purity, fairer price.
- **What's the purity?** ≥ 99%, confirmed by third-party COA (above).
- **How many capsules per day?** One (300 mg) — a dose used in human studies.
- **Is it third-party tested?** Yes — full COA on this page.
- **Shipping & returns?** [Ships from US via Amazon · free over $39 · 60-day money-back].
- **Is it safe?** Made in a cGMP facility; human studies report good tolerability.¹ Talk to your doctor if pregnant, nursing, or on medication.

### Footer（legal — 必備)
> *These statements have not been evaluated by the Food and Drug Administration. This product is not intended to diagnose, treat, cure, or prevent any disease.*
> Policies · Contact · COA library · © HYGIEIAS

---

## 待補 → 換走 `[…]`
~~G3 純度 %~~ ✅ ≥99% ・ ~~劑量(1 vs 2 粒)~~ ✅ 1 粒/300mg ・ ~~NMN citation~~ ✅ Fukamizu 2022 / Wen 2024 ・ COA PDF + lab 名 + batch ・ cGMP 廠名 ・ other ingredients ・ 運費/免運確認。
> 待 confirm:99% 係咪 G1 / G3 兩 grade 都一樣;原料 NDIN 鏈(SyncoZymes #1247 / Kingdomway #1259)。

## Powder PDP（同骨架,差異)
Hero 改打 **$/g $0.45 hero number**;spec 加「1 level scoop = 500 mg」+ 量匙說明;對比表 powder $/g 殺全場;教育/法規/guarantee 沿用。

## Log
- 2026-06-24:Capsule hero PDP wireframe + copy v1(Direction A,claims-safe,含 FDA disclaimer)。→ 存檔 [[PDP — Capsule (wireframe + copy) (V1)]]。
- 2026-06-27:**V2**。§6 教育換真 citation(Fukamizu 2022 / Wen 2024)+ honest-emerging 句;劑量收尾(1 粒 300mg,FAQ + §5 寫實);FAQ 法規答案用 2025-09 + 2025-12 FDA 實況;§4 對比表加 $/g 行 + premium 上限改 $115。
